<?php
require_once __DIR__ . '/includes/auth.php';

$grados  = $pdo->query('SELECT id, nombre FROM grados ORDER BY id')->fetchAll();
$gradoId = (int)($_GET['grado'] ?? ($grados[0]['id'] ?? 0));
$fecha   = $_GET['fecha'] ?? date('Y-m-d');
if (!preg_match('/^\d{4}-\d{2}-\d{2}$/', $fecha)) {
    $fecha = date('Y-m-d');
}

$stmt = $pdo->prepare("SELECT id, nombre FROM estudiantes WHERE grado_id = ? AND estado = 'beneficiario' ORDER BY nombre");
$stmt->execute([$gradoId]);
$estudiantes = $stmt->fetchAll();

// Asistencia ya registrada para ese grado y fecha
$stmt = $pdo->prepare(
    'SELECT a.estudiante_id FROM asistencia a
     JOIN estudiantes e ON e.id = a.estudiante_id
     WHERE e.grado_id = ? AND a.fecha = ? AND a.presente = 1'
);
$stmt->execute([$gradoId, $fecha]);
$presentes = array_map('intval', array_column($stmt->fetchAll(), 'estudiante_id'));

// Cantidad de novedades por estudiante en esa fecha (si la tabla aún no existe, se omite)
$novedadesPor = [];
try {
    $stmt = $pdo->prepare(
        'SELECT n.estudiante_id, COUNT(*) AS total FROM novedades n
         JOIN estudiantes e ON e.id = n.estudiante_id
         WHERE e.grado_id = ? AND n.fecha = ?
         GROUP BY n.estudiante_id'
    );
    $stmt->execute([$gradoId, $fecha]);
    foreach ($stmt->fetchAll() as $r) {
        $novedadesPor[(int)$r['estudiante_id']] = (int)$r['total'];
    }
} catch (PDOException $e) {
}

require_once __DIR__ . '/faltas_lib.php';
$faltas = calcularFaltas($pdo, $gradoId);

$titulo = 'Asistencia';
$css    = ['tablas', 'asistencia', 'novedades', 'faltas'];
include __DIR__ . '/includes/header.php';
?>

    <main>
        <h1>Lista de asistencia</h1>

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

            <div class="barra">
                <span id="contador"></span>
                <span id="estado" class="estado">Los cambios se guardan automáticamente</span>
            </div>

            <div class="tabla-scroll">
                <table id="tabla-asistencia" data-fecha="<?= htmlspecialchars($fecha) ?>">
                    <tr>
                        <th>N°</th>
                        <th>Estudiante</th>
                        <th>Asistió</th>
                        <th>Faltas</th>
                        <th>Novedad</th>
                    </tr>
                    <?php foreach ($estudiantes as $i => $e): ?>
                        <tr>
                            <td><?= $i + 1 ?></td>
                            <td><?= htmlspecialchars($e['nombre']) ?></td>
                            <td><input type="checkbox" class="chk-asistio" value="<?= (int)$e['id'] ?>"
                                <?= in_array((int)$e['id'], $presentes, true) ? 'checked' : '' ?>></td>
                            <?php $nf = $faltas[(int)$e['id']]['faltas'] ?? 0; ?>
                            <td><span class="faltas f<?= min($nf, MAX_FALTAS) ?>"><?= $nf ?> / <?= MAX_FALTAS ?></span></td>
                            <td>
                                <a href="novedades.php?grado=<?= $gradoId ?>&amp;fecha=<?= htmlspecialchars($fecha) ?>&amp;estudiante=<?= (int)$e['id'] ?>">+ Novedad</a>
                                <?php if (!empty($novedadesPor[(int)$e['id']])): ?>
                                    <span class="badge-novedad"><?= $novedadesPor[(int)$e['id']] ?></span>
                                <?php endif; ?>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                    <?php if (!$estudiantes): ?>
                        <tr><td colspan="5">No hay estudiantes registrados en este grado.</td></tr>
                    <?php endif; ?>
                </table>
            </div>
        </div>
    </main>

    <script src="assets/js/asistencia.js"></script>
<?php include __DIR__ . '/includes/footer.php'; ?>

