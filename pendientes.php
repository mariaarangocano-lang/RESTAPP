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
        if ($accion === 'agregar') {
            $nombre = trim($_POST['nombre'] ?? '');
            if (mb_strlen($nombre) < 3 || mb_strlen($nombre) > 100) {
                set_flash(false, 'El nombre debe tener entre 3 y 100 caracteres.');
            } else {
                $stmt = $pdo->prepare(
                    "SELECT COUNT(*) FROM estudiantes WHERE grado_id = ? AND nombre = ? AND estado <> 'retirado'"
                );
                $stmt->execute([$gradoId, $nombre]);
                if ($stmt->fetchColumn()) {
                    set_flash(false, 'Ese estudiante ya está registrado en este grado.');
                } else {
                    $pdo->prepare("INSERT INTO estudiantes (nombre, grado_id, estado) VALUES (?, ?, 'pendiente')")
                        ->execute([$nombre, $gradoId]);
                    set_flash(true, 'Estudiante agregado a la lista de pendientes.');
                }
            }
        } elseif ($accion === 'eliminar') {
            $pdo->prepare("DELETE FROM estudiantes WHERE id = ? AND estado = 'pendiente'")
                ->execute([(int)($_POST['id'] ?? 0)]);
            set_flash(true, 'Estudiante eliminado de pendientes.');
        }
    }
    header('Location: pendientes.php?grado=' . $gradoId);
    exit;
}

$flash = get_flash();
$stmt = $pdo->prepare("SELECT id, nombre FROM estudiantes WHERE grado_id = ? AND estado = 'pendiente' ORDER BY id");
$stmt->execute([$gradoId]);
$pendientes = $stmt->fetchAll();

$titulo = 'Pendientes';
$css    = ['tablas', 'faltas'];
include __DIR__ . '/includes/header.php';
?>

    <main>
        <h1>Estudiantes pendientes</h1>
        <p class="subtitulo">Entran a la lista de beneficiarios en este orden cuando alguien del grado llega a <?= MAX_FALTAS ?> faltas.</p>

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
        </div>

        <div class="tarjeta">
            <h2>Agregar pendiente</h2>
            <form method="post" class="form-pendiente">
                <input type="hidden" name="csrf" value="<?= htmlspecialchars($token) ?>">
                <input type="hidden" name="accion" value="agregar">
                <input type="hidden" name="grado" value="<?= $gradoId ?>">
                <input type="text" name="nombre" placeholder="Nombre completo del estudiante" maxlength="100" required>
                <button type="submit" class="btn-verde">Agregar</button>
            </form>
        </div>

        <div class="tarjeta">
            <div class="tabla-scroll">
                <table>
                    <tr><th>Turno</th><th>Estudiante</th><th></th></tr>
                    <?php foreach ($pendientes as $i => $p): ?>
                        <tr>
                            <td><?= $i + 1 ?></td>
                            <td><?= htmlspecialchars($p['nombre']) ?></td>
                            <td>
                                <form method="post" onsubmit="return confirm('¿Eliminar de pendientes?');">
                                    <input type="hidden" name="csrf" value="<?= htmlspecialchars($token) ?>">
                                    <input type="hidden" name="accion" value="eliminar">
                                    <input type="hidden" name="id" value="<?= (int)$p['id'] ?>">
                                    <input type="hidden" name="grado" value="<?= $gradoId ?>">
                                    <button type="submit" class="btn-rojo">Eliminar</button>
                                </form>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                    <?php if (!$pendientes): ?>
                        <tr><td colspan="3">No hay estudiantes pendientes en este grado.</td></tr>
                    <?php endif; ?>
                </table>
            </div>
        </div>

        <p style="text-align:center; margin-top:20px;"><a href="faltas.php?grado=<?= $gradoId ?>">&larr; Ir al control de faltas</a></p>
    </main>

<?php include __DIR__ . '/includes/footer.php'; ?>
