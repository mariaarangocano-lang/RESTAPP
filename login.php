<?php
session_start();
require_once __DIR__ . '/config/conexion.php';

$error = '';
$usuarioGuardado = $_COOKIE['usuario_guardado'] ?? '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $usuario = trim($_POST['usuario'] ?? '');
    $clave   = $_POST['clave'] ?? '';

    $stmt = $pdo->prepare('SELECT id, clave_hash, nombre FROM usuarios WHERE usuario = ?');
    $stmt->execute([$usuario]);
    $fila = $stmt->fetch();

    if ($fila && password_verify($clave, $fila['clave_hash'])) {
        session_regenerate_id(true);
        $_SESSION['usuario_id'] = $fila['id'];
        $_SESSION['nombre']     = $fila['nombre'] ?: $usuario;

        if (!empty($_POST['guardar'])) {
            setcookie('usuario_guardado', $usuario, time() + 60*60*24*30, '/');
        } else {
            setcookie('usuario_guardado', '', time() - 3600, '/');
        }
        header('Location: inicio.php');
        exit;
    }
    $error = 'Usuario o contraseña incorrectos.';
    $usuarioGuardado = $usuario;
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Iniciar sesión - RestApp</title>
  <link rel="stylesheet" href="assets/css/login.css">
</head>
<body>
  <div class="container">
    <div class="left">
      <img src="assets/img/logo.png" alt="Logo de RestApp">
    </div>
    <div class="right">
      <h2>Iniciar Sesión</h2>
      <?php if ($error): ?>
        <div class="error"><?= htmlspecialchars($error) ?></div>
      <?php endif; ?>
      <form method="post" action="login.php">
        <div class="form-group">
          <label for="usuario">Usuario</label>
          <input type="text" id="usuario" name="usuario" value="<?= htmlspecialchars($usuarioGuardado) ?>" required>
        </div>
        <div class="form-group">
          <label for="clave">Contraseña</label>
          <input type="password" id="clave" name="clave" required>
        </div>
        <div class="form-check">
          <input type="checkbox" id="guardar" name="guardar" <?= $usuarioGuardado ? 'checked' : '' ?>>
          <label for="guardar">Recordar mi usuario en este equipo</label>
        </div>
        <button type="submit" class="login-btn">Entrar</button>
      </form>
    </div>
  </div>
</body>
</html>
