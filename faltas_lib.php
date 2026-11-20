<?php
// Funciones compartidas del control de faltas.
// Regla: un estudiante beneficiario con 4 faltas sale de la lista y entra el primer pendiente de su grado.
//
// Una "falta" es un día en que se tomó lista en el grado (hay al menos un check registrado ese día)
// y el estudiante NO quedó marcado como presente. No cuenta si ese día tiene una novedad
// de tipo "Inasistencia justificada". Un estudiante que entra como reemplazo cuenta desde el día siguiente.

const MAX_FALTAS = 4;

function csrf_token(): string {
    if (session_status() !== PHP_SESSION_ACTIVE) {
        session_start();
    }
    if (empty($_SESSION['csrf'])) {
        $_SESSION['csrf'] = bin2hex(random_bytes(16));
    }
    return $_SESSION['csrf'];
}

function csrf_valido(string $token): bool {
    return hash_equals(csrf_token(), $token);
}

function set_flash(bool $ok, string $msg): void {
    $_SESSION['flash'] = ['ok' => $ok, 'msg' => $msg];
}

function get_flash(): ?array {
    $f = $_SESSION['flash'] ?? null;
    unset($_SESSION['flash']);
    return $f;
}

/**
 * Faltas de los beneficiarios de un grado.
 * Devuelve [estudiante_id => ['id','nombre','faltas','fechas','debe_salir']]
 */
function calcularFaltas(PDO $pdo, int $gradoId): array {
    $stmt = $pdo->prepare(
        "SELECT id, nombre, fecha_ingreso FROM estudiantes
         WHERE grado_id = ? AND estado = 'beneficiario' ORDER BY nombre"
    );
    $stmt->execute([$gradoId]);
    $estudiantes = $stmt->fetchAll();
    if (!$estudiantes) {
        return [];
    }

    // Días en que se tomó lista en este grado
    $stmt = $pdo->prepare(
        'SELECT DISTINCT a.fecha FROM asistencia a
         JOIN estudiantes e ON e.id = a.estudiante_id
         WHERE e.grado_id = ? ORDER BY a.fecha'
    );
    $stmt->execute([$gradoId]);
    $dias = array_column($stmt->fetchAll(), 'fecha');

    // Días en que cada estudiante estuvo presente
    $presentes = [];
    $stmt = $pdo->prepare(
        'SELECT a.estudiante_id, a.fecha FROM asistencia a
         JOIN estudiantes e ON e.id = a.estudiante_id
         WHERE e.grado_id = ? AND a.presente = 1'
    );
    $stmt->execute([$gradoId]);
    foreach ($stmt->fetchAll() as $r) {
        $presentes[(int)$r['estudiante_id']][$r['fecha']] = true;
    }

    // Inasistencias justificadas (no cuentan como falta)
    $justificadas = [];
    try {
        $stmt = $pdo->prepare(
            "SELECT n.estudiante_id, n.fecha FROM novedades n
             JOIN estudiantes e ON e.id = n.estudiante_id
             WHERE e.grado_id = ? AND n.tipo = 'inasistencia'"
        );
        $stmt->execute([$gradoId]);
        foreach ($stmt->fetchAll() as $r) {
            $justificadas[(int)$r['estudiante_id']][$r['fecha']] = true;
        }
    } catch (PDOException $e) {
        // La tabla novedades aún no existe: no hay justificadas.
    }

    $resultado = [];
    foreach ($estudiantes as $e) {
        $id = (int)$e['id'];
        $desde = $e['fecha_ingreso'];
        $fechas = [];
        foreach ($dias as $dia) {
            if ($desde && $dia <= $desde) continue;
            if (!empty($presentes[$id][$dia])) continue;
            if (!empty($justificadas[$id][$dia])) continue;
            $fechas[] = $dia;
        }
        $resultado[$id] = [
            'id'         => $id,
            'nombre'     => $e['nombre'],
            'faltas'     => count($fechas),
            'fechas'     => $fechas,
            'debe_salir' => count($fechas) >= MAX_FALTAS,
        ];
    }
    return $resultado;
}

/**
 * Retira a un estudiante con 4 faltas y mete al primer pendiente de su grado.
 * Devuelve [bool ok, string mensaje].
 */
function reemplazarEstudiante(PDO $pdo, int $estudianteId, ?int $usuarioId): array {
    $pdo->beginTransaction();
    try {
        $stmt = $pdo->prepare(
            "SELECT id, nombre, grado_id FROM estudiantes
             WHERE id = ? AND estado = 'beneficiario' FOR UPDATE"
        );
        $stmt->execute([$estudianteId]);
        $sale = $stmt->fetch();
        if (!$sale) {
            $pdo->rollBack();
            return [false, 'Ese estudiante ya no está en la lista de beneficiarios.'];
        }

        $faltas = calcularFaltas($pdo, (int)$sale['grado_id']);
        $nFaltas = $faltas[$estudianteId]['faltas'] ?? 0;
        if ($nFaltas < MAX_FALTAS) {
            $pdo->rollBack();
            return [false, $sale['nombre'] . ' aún no completa ' . MAX_FALTAS . ' faltas.'];
        }

        $stmt = $pdo->prepare(
            "SELECT id, nombre FROM estudiantes
             WHERE grado_id = ? AND estado = 'pendiente' ORDER BY id LIMIT 1 FOR UPDATE"
        );
        $stmt->execute([$sale['grado_id']]);
        $entra = $stmt->fetch();

        $pdo->prepare("UPDATE estudiantes SET estado = 'retirado', fecha_baja = CURDATE() WHERE id = ?")
            ->execute([$estudianteId]);

        if ($entra) {
            $pdo->prepare(
                "UPDATE estudiantes SET estado = 'beneficiario', fecha_ingreso = CURDATE(), fecha_baja = NULL WHERE id = ?"
            )->execute([$entra['id']]);
        }

        $pdo->prepare(
            'INSERT INTO bajas (estudiante_sale_id, estudiante_entra_id, grado_id, faltas, fecha, usuario_id)
             VALUES (?, ?, ?, ?, CURDATE(), ?)'
        )->execute([$estudianteId, $entra['id'] ?? null, $sale['grado_id'], $nFaltas, $usuarioId]);

        $pdo->commit();

        if ($entra) {
            return [true, $sale['nombre'] . ' salió de la lista y entró ' . $entra['nombre'] . '.'];
        }
        return [true, $sale['nombre'] . ' salió de la lista. No había estudiantes pendientes en este grado: el cupo quedó libre.'];
    } catch (Throwable $e) {
        if ($pdo->inTransaction()) {
            $pdo->rollBack();
        }
        return [false, 'No se pudo completar el cambio. Intenta de nuevo.'];
    }
}
