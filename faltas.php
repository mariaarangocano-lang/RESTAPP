<?php
require_once __DIR__ . '/includes/auth.php';
require_once __DIR__ . '/faltas_lib.php';

$grados  = $pdo->query('SELECT id, nombre FROM grados ORDER BY id')->fetchAll();
$gradoId = (int)($_REQUEST['grado'] ?? ($grados[0]['id'] ?? 0));
$token   = csrf_token();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (!csrf_valido($_POST['csrf'] ?? '')) {
        set_flash(false, 'La sesión del formulario expiró. Intenta de nuevo.');
    } else {
        $accion = $_POST['accion'] ?? '';
        $uid    = $_SESSION['usuario_id'] ?? null;

        if ($accion === 'reemplazar') {
            [$ok, $msg] = reemplazarEstudiante($pdo, (int)($_POST['id'] ?? 0), $uid);
            set_flash($ok, $msg);
        } elseif ($accion === 'reemplazar_todos') {
            $mensajes = [];
            $todoOk = true;
            foreach (calcularFaltas($pdo, $gradoId) as $f) {
                if ($f['debe_salir']) {
                    [$ok, $msg] = reemplazarEstudiante($pdo, $f['id'], $uid);
                    $mensajes[] = $msg;
                    $todoOk = $todoOk && $ok;
                }
            }
            set_flash($todoOk, $mensajes ? implode(' ', $mensajes) : 'No hay estudiantes con ' . MAX_FALTAS . ' faltas en este grado.');
        }
    }
    header('Location: faltas.php?grado=' . $gradoId);
    exit;
}

$flash   = get_flash();
$faltas  = calcularFaltas($pdo, $gradoId);
$deben   = count(array_filter($faltas, fn($f) => $f['debe_salir']));
uasort($faltas, fn($a, $b) => [$b['faltas'], $a['nombre']] <=> [$a['faltas'], $b['nombre']]);

$stmt = $pdo->prepare("SELECT COUNT(*) FROM estudiantes WHERE grado_id = ? AND estado = 'pendiente'");
$stmt->execute([$gradoId]);
$pendientes = (int)$stmt->fetchColumn();

$stmt = $pdo->prepare(
    'SELECT b.fecha, b.faltas, s.nombre AS sale, en.nombre AS entra
     FROM bajas b
     JOIN estudiantes s ON s.id = b.estudiante_sale_id
     LEFT JOIN estudiantes en ON en.id = b.estudiante_entra_id
     WHERE b.grado_id = ? ORDER BY b.id DESC LIMIT 15'
);
$stmt->execute([$gradoId]);
$historial = $stmt->fetchAll();

$titulo = 'Control de faltas';
$css    = ['tablas', 'faltas'];
include __DIR__ . '/includes/header.php';
?>

    <main>
        <h1>Control de faltas</h1>
        <p class="subtitulo">Con <?= MAX_FALTAS ?> faltas el estudiante sale de la lista y entra el siguiente pendiente del grado.</p>

        <?php if ($flash): ?>
            <div class="<?= $flash['ok'] ? 'aviso-ok' : 'aviso-error' ?>"><?= htmlspecialchars($flash['msg']) ?></div>
        <?php endif; ?>

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
            </form>
            <p>
                Beneficiarios: <strong><?= count($faltas) ?></strong> &middot;
                Pendientes en espera: <strong><?= $pendientes ?></strong> &middot;
                Con <?= MAX_FALTAS ?> faltas: <strong><?= $deben ?></strong>
                (<a href="pendientes.php?grado=<?= $gradoId ?>">ver pendientes</a>)
            </p>
            <?php if ($deben > 0): ?>
                <form method="post" onsubmit="return confirm('¿Retirar a todos los que tienen <?= MAX_FALTAS ?> faltas y meter a los pendientes?');">
                    <input type="hidden" name="csrf" value="<?= htmlspecialchars($token) ?>">
                    <input type="hidden" name="accion" value="reemplazar_todos">
                    <input type="hidden" name="grado" value="<?= $gradoId ?>">
                    <button type="submit" class="btn-rojo">Reemplazar a todos los que llegaron a <?= MAX_FALTAS ?></button>
                </form>
            <?php endif; ?>
        </div>

        <div class="tarjeta">
            <div class="tabla-scroll">
                <table>
                    <tr>
                        <th>Estudiante</th>
                        <th>Faltas</th>
                        <th>Fechas</th>
                        <th></th>
                    </tr>
                    <?php foreach ($faltas as $f): ?>
                        <tr class="<?= $f['debe_salir'] ? 'fila-salida' : '' ?>">
                            <td><?= htmlspecialchars($f['nombre']) ?></td>
                            <td><span class="faltas f<?= min($f['faltas'], MAX_FALTAS) ?>"><?= $f['faltas'] ?> / <?= MAX_FALTAS ?></span></td>
                            <td class="fechas"><?= htmlspecialchars(implode(', ', $f['fechas'])) ?: '—' ?></td>
                            <td>
                                <?php if ($f['debe_salir']): ?>
                                    <form method="post" onsubmit="return confirm('¿Retirar a este estudiante y meter al siguiente pendiente?');">
                                        <input type="hidden" name="csrf" value="<?= htmlspecialchars($token) ?>">
                                        <input type="hidden" name="accion" value="reemplazar">
                                        <input type="hidden" name="id" value="<?= $f['id'] ?>">
                                        <input type="hidden" name="grado" value="<?= $gradoId ?>">
                                        <button type="submit" class="btn-rojo">Retirar y reemplazar</button>
                                    </form>
                                <?php endif; ?>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                    <?php if (!$faltas): ?>
                        <tr><td colspan="4">No hay beneficiarios en este grado.</td></tr>
                    <?php endif; ?>
                </table>
            </div>
        </div>

        <div class="tarjeta">
            <h2>Últimos cambios</h2>
            <div class="tabla-scroll">
                <table>
                    <tr><th>Fecha</th><th>Salió</th><th>Faltas</th><th>Entró</th></tr>
                    <?php foreach ($historial as $h): ?>
                        <tr>
                            <td><?= htmlspecialchars($h['fecha']) ?></td>
                            <td><?= htmlspecialchars($h['sale']) ?></td>
                            <td><?= (int)$h['faltas'] ?></td>
                            <td><?= htmlspecialchars($h['entra'] ?? '— (sin pendientes)') ?></td>
                        </tr>
                    <?php endforeach; ?>
                    <?php if (!$historial): ?>
                        <tr><td colspan="4">Aún no hay cambios en este grado.</td></tr>
                    <?php endif; ?>
                </table>
            </div>
        </div>

        <p style="text-align:center; margin-top:20px;"><a href="listas.php">&larr; Volver a Gestión del sistema</a></p>
    </main>

<?php include __DIR__ . '/includes/footer.php'; ?>
