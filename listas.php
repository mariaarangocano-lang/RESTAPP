<?php
require_once __DIR__ . '/includes/auth.php';
$titulo = 'Gestión del sistema';
$css    = ['listas'];
include __DIR__ . '/includes/header.php';
?>

    <main class="main">
        <h1>Gestión del Sistema</h1>
        <p class="subtitulo">Selecciona una opción para continuar</p>

        <div class="contenedor">
            <a href="asistencia.php" class="card">
                <h3>Listas de Asistencia</h3>
                <p>Registra la asistencia en tiempo real</p>
            </a>

            <a href="grados.php" class="card">
                <h3>Lista de Estudiantes</h3>
                <p>Consulta los estudiantes de cada grado</p>
            </a>

            <a href="novedades.php" class="card">
                <h3>Novedades</h3>
                <p>Registra y consulta las novedades de cada grado</p>
            </a>

            <a href="faltas.php" class="card">
                <h3>Control de faltas</h3>
                <p>Cuenta las faltas y reemplaza a quienes llegan a 4</p>
            </a>

            <a href="pendientes.php" class="card">
                <h3>Estudiantes pendientes</h3>
                <p>Lista de espera para entrar como beneficiarios</p>
            </a>
        </div>
    </main>

<?php include __DIR__ . '/includes/footer.php'; ?>
