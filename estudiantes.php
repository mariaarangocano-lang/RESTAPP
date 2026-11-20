<?php
require_once __DIR__ . '/includes/auth.php';

$gradoId = (int)($_GET['grado'] ?? 0);

$stmt = $pdo->prepare('SELECT nombre FROM grados WHERE id = ?');
$stmt->execute([$gradoId]);
$grado = $stmt->fetch();
if (!$grado) {
    header('Location: grados.php');
    exit;
}

$stmt = $pdo->prepare("SELECT nombre FROM estudiantes WHERE grado_id = ? AND estado = 'beneficiario' ORDER BY nombre");
$stmt->execute([$gradoId]);
$estudiantes = $stmt->fetchAll();

$titulo = 'Grado ' . $grado['nombre'];
$css    = ['tablas', 'estudiantes'];
include __DIR__ . '/includes/header.php';
?>

    <main>
        <h1>Lista del grado <?= htmlspecialchars($grado['nombre']) ?></h1>

        <div class="tarjeta">
            <table>
                <tr>
                    <th>N°</th>
                    <th>Estudiante</th>
                </tr>
                <?php foreach ($estudiantes as $i => $e): ?>
                    <tr><td><?= $i + 1 ?></td><td><?= htmlspecialchars($e['nombre']) ?></td></tr>
                <?php endforeach; ?>
                <?php if (!$estudiantes): ?>
                    <tr><td colspan="2">No hay estudiantes registrados en este grado.</td></tr>
                <?php endif; ?>
            </table>
        </div>

        <p style="text-align:center; margin-top:20px;"><a href="grados.php">&larr; Volver a los grados</a></p>
    </main>

<?php include __DIR__ . '/includes/footer.php'; ?>
