<?php
// Recibe un check de asistencia (por fetch desde asistencia.js) y lo guarda en la base de datos.
session_start();
header('Content-Type: application/json; charset=utf-8');

if (empty($_SESSION['usuario_id'])) {
    http_response_code(401);
    echo json_encode(['ok' => false, 'error' => 'Tu sesión expiró. Vuelve a iniciar sesión.']);
    exit;
}
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(['ok' => false, 'error' => 'Método no permitido.']);
    exit;
}

require_once __DIR__ . '/config/conexion.php';

$estudianteId = (int)($_POST['estudiante_id'] ?? 0);
$fecha        = $_POST['fecha'] ?? '';
$presente     = (($_POST['presente'] ?? '0') === '1') ? 1 : 0;

$f = DateTime::createFromFormat('Y-m-d', $fecha);
if ($estudianteId <= 0 || !$f || $f->format('Y-m-d') !== $fecha) {
    http_response_code(400);
    echo json_encode(['ok' => false, 'error' => 'Datos inválidos.']);
    exit;
}

try {
    $stmt = $pdo->prepare(
        'INSERT INTO asistencia (estudiante_id, fecha, presente) VALUES (?, ?, ?)
         ON DUPLICATE KEY UPDATE presente = VALUES(presente)'
    );
    $stmt->execute([$estudianteId, $fecha, $presente]);
    echo json_encode(['ok' => true]);
} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(['ok' => false, 'error' => 'No se pudo guardar en la base de datos.']);
}
