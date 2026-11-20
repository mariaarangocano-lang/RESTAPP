<?php
require_once __DIR__ . '/includes/auth.php';
$titulo = 'Grados';
$css    = ['grados'];

$grados = $pdo->query('SELECT id, nombre FROM grados ORDER BY id')->fetchAll();

include __DIR__ . '/includes/header.php';
?>

    <main>
        <h1>Listas de estudiantes</h1>
        <p class="subtitulo">Selecciona el grado para ver su lista</p>

        <div class="cuadricula">
            <?php foreach ($grados as $g): ?>
                <a class="grado" href="estudiantes.php?grado=<?= (int)$g['id'] ?>">
                    <span class="numero"><?= htmlspecialchars($g['nombre']) ?></span>
                    <span class="texto">Grado</span>
                </a>
            <?php endforeach; ?>
        </div>
    </main>

<?php include __DIR__ . '/includes/footer.php'; ?>
