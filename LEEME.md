# RestApp – Restaurante escolar

## Instalación en XAMPP (desde cero)
1. Copia la carpeta `RestApp` dentro de `C:\\xampp\\htdocs\\` (debe quedar `htdocs\\RestApp\\login.php`).
2. En XAMPP inicia **Apache** y **MySQL**.
3. Abre `http://localhost/phpmyadmin` → pestaña **SQL** → pega el contenido de `sql/restapp.sql` → **Continuar**
   (también sirve la pestaña **Importar** eligiendo ese archivo).
4. Importa también `sql/actualizacion.sql` (no borra nada): completa cada grado hasta 30 estudiantes y crea la tabla `novedades`.
5. Importa después `sql/actualizacion2.sql` (control de faltas y estudiantes pendientes).
6. Abre `http://localhost/RestApp/` e ingresa con usuario **admin** y contraseña **admin123**.

> Importar `restapp.sql` borra y recrea la base `restapp`. Úsalo solo para instalar o reiniciar todo.

## Cómo se usa
- **Administración → Listas → Listas de Asistencia**: elige grado y fecha; cada check se guarda solo en la base de datos.
- **Administración → Listas → Novedades**: elige grado y fecha, registra una novedad (inasistencia justificada, salud, ración, comportamiento u otro) o elimínala. También se puede abrir desde el enlace «+ Novedad» de cada estudiante en la lista de asistencia.
- **Administración → Listas → Control de faltas**: muestra las faltas de cada beneficiario (x / 4). Al llegar a 4 aparece el botón «Retirar y reemplazar»: el estudiante sale de la lista y entra el primer pendiente del mismo grado. Queda un historial de cambios.
  - Una falta = día con lista tomada en el grado en que el estudiante no quedó marcado como presente.
  - No cuenta si ese día tiene una novedad «Inasistencia justificada».
- **Administración → Listas → Estudiantes pendientes**: lista de espera por grado (se agregan y eliminan desde ahí).
- **Administración → Listas → Lista de Estudiantes**: elige un grado para ver sus estudiantes.

## Estructura
```
RestApp/
├── index.php, login.php, logout.php
├── inicio.php, listas.php, grados.php, estudiantes.php, asistencia.php, novedades.php, faltas.php, pendientes.php
├── guardar_asistencia.php   (recibe cada check y lo guarda)
├── faltas_lib.php           (reglas del contador de faltas y reemplazos)
├── assets/css, assets/js, assets/img
├── includes/                (header, menú, footer, control de sesión)
├── config/conexion.php      (usuario/contraseña de MySQL)
├── sql/restapp.sql          (base de datos + datos de ejemplo)
├── sql/actualizacion.sql    (completa estudiantes a 30 por grado + tabla novedades)
└── sql/actualizacion2.sql   (estado de estudiantes, pendientes, historial de bajas)
```

## Base de datos (restapp)
- `usuarios` – quién puede entrar (contraseñas cifradas)
- `grados` – 1° a 11°
- `estudiantes` – nombre y grado (11°: 28 estudiantes, 7°: 29 estudiantes de ejemplo)
- `asistencia` – un registro por estudiante y fecha
- `estudiantes.estado` – beneficiario / pendiente / retirado
- `bajas` – historial de quién salió, quién entró y con cuántas faltas
- `novedades` – estudiante, fecha, tipo y descripción de cada novedad
