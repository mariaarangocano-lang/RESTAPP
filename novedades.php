<?php
require_once __DIR__ . '/includes/auth.php';

if (session_status() !== PHP_SESSION_ACTIVE) {
    session_start();
}
if (empty($_SESSION['csrf'])) {
    $_SESSION['csrf'] = bin2hex(random_bytes(16));
}

const TIPOS_NOVEDAD = [
    'inasistencia' => 'Inasistencia justificada',
    'salud'        => 'Salud / enfermedad',
    'racion'       => 'Ración (cedida o cambio)',
    'conducta'     => 'Comportamiento',
    'otro'         => 'Otro',
];

$grados  = $pdo->query('SELECT id, nombre FROM grados ORDER BY id')->fetchAll();
$gradoId = (int)($_REQUEST['grado'] ?? ($grados[0]['id'] ?? 0));
$fecha   = $_REQUEST['fecha'] ?? date('Y-m-d');
if (!preg_match('/^\d{4}-\d{2}-\d{2}$/', $fecha)) {
    $fecha = date('Y-m-d');
}
$preseleccion = (int)($_GET['estudiante'] ?? 0);
$error = '';

// ---- Guardar / eliminar (POST) ----
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (!hash_equals($_SESSION['csrf'], $_POST['csrf'] ?? '')) {
        $error = 'La sesión del formulario expiró. Intenta de nuevo.';
    } else {
        $accion = $_POST['accion'] ?? '';

        if ($accion === 'crear') {
            $estId = (int)($_POST['estudiante_id'] ?? 0);
            $tipo  = $_POST['tipo'] ?? '';
            $desc  = trim($_POST['descripcion'] ?? '');

            $stmt = $pdo->prepare("SELECT COUNT(*) FROM estudiantes WHERE id = ? AND grado_id = ? AND estado = 'beneficiario'");
            $stmt->execute([$estId, $gradoId]);

            if (!$stmt->fetchColumn()) {
                $error = 'Selecciona un estudiante del grado.';
            } elseif (!isset(TIPOS_NOVEDAD[$tipo])) {
                $error = 'Selecciona un tipo de novedad.';
            } elseif (mb_strlen($desc) < 3 || mb_strlen($desc) > 500) {
                $error = 'La descripción debe tener entre 3 y 500 caracteres.';
            } else {
                $stmt = $pdo->prepare(
                    'INSERT INTO novedades (estudiante_id, fecha, tipo, descripcion, usuario_id) VALUES (?, ?, ?, ?, ?)'
                );
                $stmt->execute([$estId, $fecha, $tipo, $desc, $_SESSION['usuario_id'] ?? null]);
                header('Location: novedades.php?grado=' . $gradoId . '&fecha=' . urlencode($fecha) . '&ok=1');
                exit;
            }
        } elseif ($accion === 'eliminar') {
            $stmt = $pdo->prepare('DELETE FROM novedades WHERE id = ?');
            $stmt->execute([(int)($_POST['id'] ?? 0)]);
            header('Location: novedades.php?grado=' . $gradoId . '&fecha=' . urlencode($fecha) . '&ok=2');
            exit;
        }
    }
}

// ---- Datos para mostrar ----
$stmt = $pdo->prepare("SELECT id, nombre FROM estudiantes WHERE grado_id = ? AND estado = 'beneficiario' ORDER BY nombre");
$stmt->execute([$gradoId]);
$estudiantes = $stmt->fetchAll();

$novedades = [];
$tablaFalta = false;
try {
    $stmt = $pdo->prepare(
        'SELECT n.id, n.tipo, n.descripcion, e.nombre
         FROM novedades n
         JOIN estudiantes e ON e.id = n.estudiante_id
         WHERE e.grado_id = ? AND n.fecha = ?
         ORDER BY n.id DESC'
    );
    $stmt->execute([$gradoId, $fecha]);
    $novedades = $stmt->fetchAll();
} catch (PDOException $e) {
    $tablaFalta = true;
}

$mensaje = '';
if (($_GET['ok'] ?? '') === '1') $mensaje = 'Novedad registrada.';
if (($_GET['ok'] ?? '') === '2') $mensaje = 'Novedad eliminada.';

$titulo = 'Novedades';
$css    = ['tablas', 'novedades'];
include __DIR__ . '/includes/header.php';
?>

    <main>
        <h1>Novedades</h1>

        <?php if ($tablaFalta): ?>
            <div class="tarjeta aviso-error">
                Falta la tabla <strong>novedades</strong>. Ejecuta <code>sql/actualizacion.sql</code> en phpMyAdmin.
            </div>
        <?php endif; ?>
        <?php if ($mensaje): ?><div class="aviso-ok"><?= htmlspecialchars($mensaje) ?></div><?php endif; ?>
        <?php if ($error): ?><div class="aviso-error"><?= htmlspecialchars($error) ?></div><?php endif; ?>

        <div class="tarjeta">
            <form method="get" class="filtros">
                <div>
                    <label for="grado">Grado</label>
                    <select name="grado" id="grado" onchange="this.form.submit()">
                        <?php foreach ($grados as $g): ?>
                            <option value="<?= (int)$g['id'] ?>" <?= (int)$g['id'] === $gradoId ? 'selected' : '' ?>>
                                <?= htmlspecialchars($g['nombre']) ?>
                            </option>
                        <?php endforeach; ?>
                    </select>
                </div>
                <div>
                    <label for="fecha">Fecha</label>
                    <input type="date" name="fecha" id="fecha" value="<?= htmlspecialchars($fecha) ?>" onchange="this.form.submit()">
                </div>
            </form>
        </div>

        <div class="tarjeta">
            <h2>Registrar novedad</h2>
            <form method="post" class="form-novedad">
                <input type="hidden" name="csrf" value="<?= htmlspecialchars($_SESSION['csrf']) ?>">
                <input type="hidden" name="accion" value="crear">
                <input type="hidden" name="grado" value="<?= $gradoId ?>">
                <input type="hidden" name="fecha" value="<?= htmlspecialchars($fecha) ?>">

                <label for="estudiante_id">Estudiante</label>
                <select name="estudiante_id" id="estudiante_id" required>
                    <option value="">— Selecciona —</option>
                    <?php foreach ($estudiantes as $e): ?>
                        <option value="<?= (int)$e['id'] ?>" <?= (int)$e['id'] === $preseleccion ? 'selected' : '' ?>>
                            <?= htmlspecialchars($e['nombre']) ?>
                        </option>
                    <?php endforeach; ?>
                </select>

                <label for="tipo">Tipo</label>
                <select name="tipo" id="tipo" required>
                    <?php foreach (TIPOS_NOVEDAD as $clave => $texto): ?>
                        <option value="<?= $clave ?>"><?= htmlspecialchars($texto) ?></option>
                    <?php endforeach; ?>
                </select>

                <label for="descripcion">Descripción</label>
                <textarea name="descripcion" id="descripcion" rows="3" maxlength="500" required></textarea>

                <button type="submit" class="btn-guardar">Guardar novedad</button>
            </form>
        </div>

        <div class="tarjeta">
            <h2>Novedades del <?= htmlspecialchars($fecha) ?></h2>
            <div class="tabla-scroll">
                <table>
                    <tr>
                        <th>Estudiante</th>
                        <th>Tipo</th>
                        <th>Descripción</th>
                        <th></th>
                    </tr>
                    <?php foreach ($novedades as $n): ?>
                        <tr>
                            <td><?= htmlspecialchars($n['nombre']) ?></td>
                            <td><span class="etiqueta tipo-<?= htmlspecialchars($n['tipo']) ?>">
                                <?= htmlspecialchars(TIPOS_NOVEDAD[$n['tipo']] ?? $n['tipo']) ?></span></td>
                            <td><?= nl2br(htmlspecialchars($n['descripcion'])) ?></td>
                            <td>
                                <form method="post" onsubmit="return confirm('¿Eliminar esta novedad?');">
                                    <input type="hidden" name="csrf" value="<?= htmlspecialchars($_SESSION['csrf']) ?>">
                                    <input type="hidden" name="accion" value="eliminar">
                                    <input type="hidden" name="id" value="<?= (int)$n['id'] ?>">
                                    <input type="hidden" name="grado" value="<?= $gradoId ?>">
                                    <input type="hidden" name="fecha" value="<?= htmlspecialchars($fecha) ?>">
                                    <button type="submit" class="btn-eliminar">Eliminar</button>
                                </form>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                    <?php if (!$novedades): ?>
                        <tr><td colspan="4">No hay novedades registradas para este grado en esta fecha.</td></tr>
                    <?php endif; ?>
                </table>
            </div>
        </div>

        <p style="text-align:center; margin-top:20px;"><a href="listas.php">&larr; Volver a Gestión del sistema</a></p>
    </main>

<?php include __DIR__ . '/includes/footer.php'; ?>
