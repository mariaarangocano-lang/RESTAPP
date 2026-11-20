<?php
require_once __DIR__ . '/includes/auth.php';
$titulo = 'Inicio';
$css    = ['inicio'];
include __DIR__ . '/includes/header.php';
?>

    <div class="carrusel">
        <div class="imagenes">
            <img src="assets/img/nino.jpg" alt="Niño">
            <img src="assets/img/restaurante1.jpg" alt="Restaurante 1">
            <img src="assets/img/foto_resta.jpg" alt="Restaurante">
            <img src="assets/img/restaurante2.jpg" alt="Restaurante 2">
            <!-- Primera imagen repetida: hace que el ciclo se reinicie sin saltos -->
            <img src="assets/img/nino.jpg" alt="Niño">
        </div>
    </div>

   
    <main>

        <section class="tarjeta" id="presentacion">
            <h2>Presentación</h2>
            <p>
                Esta página web fue creada para facilitar la gestión diaria de las
                listas de asistencia del restaurante escolar. Con ella llevamos un
                control ordenado y eficiente de las novedades, asistencias, listados
                y registros de los estudiantes que participan.
            </p>
        </section>

        <section class="tarjeta" id="objetivos">
            <h2>Objetivos</h2>
            <ul>
                <li>Registrar la asistencia en tiempo real para evitar confusiones y mantener una mejor organización.</li>
                <li>Aprovechar mejor la alimentación del colegio: quienes no usan el restaurante pueden cederlo a quienes de verdad lo necesitan.</li>
                <li>Diseñar una plataforma intuitiva que permita a los alfabetizadores gestionar el listado de asistencia de forma eficiente.</li>
            </ul>
        </section>

        <div class="mision-vision">
            <section class="tarjeta">
                <h2>Misión</h2>
                <p>
                    Crear una página web que ayude a que el restaurante escolar sea
                    más organizado y fácil de manejar, donde se vean con claridad las
                    listas, las asistencias y las novedades.
                </p>
            </section>

            <section class="tarjeta">
                <h2>Visión</h2>
                <p>
                    Que la página se convierta en una herramienta útil para toda la
                    comunidad educativa y, en el futuro, sirva de ejemplo para otros
                    colegios.
                </p>
            </section>
        </div>

        <section class="tarjeta" id="integrantes">
            <h2 style="text-align: center;">Integrantes</h2>

            <div class="integrantes">
                <div>
                    <img src="assets/img/perfil.png" alt="Paulina Arango">
                    <h3>Paulina Arango</h3>
                </div>

                <div>
                    <img src="assets/img/perfil.png" alt="Lorena Martínez">
                    <h3>Lorena Martínez</h3>
                </div>

                <div>
                    <img src="assets/img/perfil.png" alt="Divana Oquendo">
                    <h3>Divana Oquendo</h3>
                </div>
            </div>
        </section>

    </main>

<?php include __DIR__ . '/includes/footer.php'; ?>
