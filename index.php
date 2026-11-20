<?php
// Punto de entrada: http://localhost/RestApp/
session_start();
header('Location: ' . (empty($_SESSION['usuario_id']) ? 'login.php' : 'inicio.php'));
exit;
