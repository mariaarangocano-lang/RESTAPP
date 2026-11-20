-- RestApp: control de faltas (NO borra datos)
-- Ejecutar DESPUÉS de sql/actualizacion.sql, en phpMyAdmin > base 'restapp' > pestaña SQL.
-- Requiere MariaDB (el de XAMPP) por el 'ADD COLUMN IF NOT EXISTS'.

USE restapp;
SET NAMES utf8mb4;

-- Estado de cada estudiante: beneficiario (en la lista), pendiente (en espera) o retirado (4 faltas).
ALTER TABLE estudiantes
  ADD COLUMN IF NOT EXISTS estado ENUM('beneficiario','pendiente','retirado') NOT NULL DEFAULT 'beneficiario',
  ADD COLUMN IF NOT EXISTS fecha_ingreso DATE NULL,
  ADD COLUMN IF NOT EXISTS fecha_baja DATE NULL;

-- Historial de cambios: quién salió, quién entró y con cuántas faltas.
CREATE TABLE IF NOT EXISTS bajas (
  id                 INT AUTO_INCREMENT PRIMARY KEY,
  estudiante_sale_id INT NOT NULL,
  estudiante_entra_id INT NULL,
  grado_id           INT NOT NULL,
  faltas             TINYINT NOT NULL,
  fecha              DATE NOT NULL,
  usuario_id         INT NULL,
  creado             TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  INDEX idx_grado (grado_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Pendientes de ejemplo (3 por grado). Reemplázalos por los reales desde la página 'Pendientes'.

INSERT INTO estudiantes (nombre, grado_id, estado) SELECT 'Ximena Ospina Zapata', 1, 'pendiente' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM estudiantes WHERE nombre = 'Ximena Ospina Zapata' AND grado_id = 1);
INSERT INTO estudiantes (nombre, grado_id, estado) SELECT 'Luna Zapata Ríos', 1, 'pendiente' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM estudiantes WHERE nombre = 'Luna Zapata Ríos' AND grado_id = 1);
INSERT INTO estudiantes (nombre, grado_id, estado) SELECT 'Luciana Muñoz Vélez', 1, 'pendiente' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM estudiantes WHERE nombre = 'Luciana Muñoz Vélez' AND grado_id = 1);
INSERT INTO estudiantes (nombre, grado_id, estado) SELECT 'Luna García Quintero', 2, 'pendiente' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM estudiantes WHERE nombre = 'Luna García Quintero' AND grado_id = 2);
INSERT INTO estudiantes (nombre, grado_id, estado) SELECT 'Simón Gómez Sánchez', 2, 'pendiente' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM estudiantes WHERE nombre = 'Simón Gómez Sánchez' AND grado_id = 2);
INSERT INTO estudiantes (nombre, grado_id, estado) SELECT 'Santiago Gómez Ríos', 2, 'pendiente' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM estudiantes WHERE nombre = 'Santiago Gómez Ríos' AND grado_id = 2);
INSERT INTO estudiantes (nombre, grado_id, estado) SELECT 'Felipe Hernández Osorio', 3, 'pendiente' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM estudiantes WHERE nombre = 'Felipe Hernández Osorio' AND grado_id = 3);
INSERT INTO estudiantes (nombre, grado_id, estado) SELECT 'Laura Arango Ríos', 3, 'pendiente' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM estudiantes WHERE nombre = 'Laura Arango Ríos' AND grado_id = 3);
INSERT INTO estudiantes (nombre, grado_id, estado) SELECT 'Andrés Hernández Ospina', 3, 'pendiente' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM estudiantes WHERE nombre = 'Andrés Hernández Ospina' AND grado_id = 3);
INSERT INTO estudiantes (nombre, grado_id, estado) SELECT 'Juan David López Martínez', 4, 'pendiente' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM estudiantes WHERE nombre = 'Juan David López Martínez' AND grado_id = 4);
INSERT INTO estudiantes (nombre, grado_id, estado) SELECT 'Ximena Quintero Vélez', 4, 'pendiente' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM estudiantes WHERE nombre = 'Ximena Quintero Vélez' AND grado_id = 4);
INSERT INTO estudiantes (nombre, grado_id, estado) SELECT 'Natalia Restrepo Zapata', 4, 'pendiente' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM estudiantes WHERE nombre = 'Natalia Restrepo Zapata' AND grado_id = 4);
INSERT INTO estudiantes (nombre, grado_id, estado) SELECT 'Camila Martínez Sánchez', 5, 'pendiente' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM estudiantes WHERE nombre = 'Camila Martínez Sánchez' AND grado_id = 5);
INSERT INTO estudiantes (nombre, grado_id, estado) SELECT 'Laura Betancur Quintero', 5, 'pendiente' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM estudiantes WHERE nombre = 'Laura Betancur Quintero' AND grado_id = 5);
INSERT INTO estudiantes (nombre, grado_id, estado) SELECT 'Daniel Ramírez Betancur', 5, 'pendiente' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM estudiantes WHERE nombre = 'Daniel Ramírez Betancur' AND grado_id = 5);
INSERT INTO estudiantes (nombre, grado_id, estado) SELECT 'Camila López Ríos', 6, 'pendiente' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM estudiantes WHERE nombre = 'Camila López Ríos' AND grado_id = 6);
INSERT INTO estudiantes (nombre, grado_id, estado) SELECT 'Natalia Cano Ospina', 6, 'pendiente' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM estudiantes WHERE nombre = 'Natalia Cano Ospina' AND grado_id = 6);
INSERT INTO estudiantes (nombre, grado_id, estado) SELECT 'Daniela López Londoño', 6, 'pendiente' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM estudiantes WHERE nombre = 'Daniela López Londoño' AND grado_id = 6);
INSERT INTO estudiantes (nombre, grado_id, estado) SELECT 'Jacobo Ríos Martínez', 7, 'pendiente' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM estudiantes WHERE nombre = 'Jacobo Ríos Martínez' AND grado_id = 7);
INSERT INTO estudiantes (nombre, grado_id, estado) SELECT 'Salomé Álvarez Henao', 7, 'pendiente' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM estudiantes WHERE nombre = 'Salomé Álvarez Henao' AND grado_id = 7);
INSERT INTO estudiantes (nombre, grado_id, estado) SELECT 'Luciana Cardona Vargas', 7, 'pendiente' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM estudiantes WHERE nombre = 'Luciana Cardona Vargas' AND grado_id = 7);
INSERT INTO estudiantes (nombre, grado_id, estado) SELECT 'Camilo Rodríguez Ríos', 8, 'pendiente' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM estudiantes WHERE nombre = 'Camilo Rodríguez Ríos' AND grado_id = 8);
INSERT INTO estudiantes (nombre, grado_id, estado) SELECT 'Julián Mejía Londoño', 8, 'pendiente' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM estudiantes WHERE nombre = 'Julián Mejía Londoño' AND grado_id = 8);
INSERT INTO estudiantes (nombre, grado_id, estado) SELECT 'Camilo Restrepo Londoño', 8, 'pendiente' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM estudiantes WHERE nombre = 'Camilo Restrepo Londoño' AND grado_id = 8);
INSERT INTO estudiantes (nombre, grado_id, estado) SELECT 'Esteban Giraldo Cano', 9, 'pendiente' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM estudiantes WHERE nombre = 'Esteban Giraldo Cano' AND grado_id = 9);
INSERT INTO estudiantes (nombre, grado_id, estado) SELECT 'Juliana Mejía Osorio', 9, 'pendiente' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM estudiantes WHERE nombre = 'Juliana Mejía Osorio' AND grado_id = 9);
INSERT INTO estudiantes (nombre, grado_id, estado) SELECT 'Andrés Gómez Rodríguez', 9, 'pendiente' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM estudiantes WHERE nombre = 'Andrés Gómez Rodríguez' AND grado_id = 9);
INSERT INTO estudiantes (nombre, grado_id, estado) SELECT 'Mariana Vélez Jaramillo', 10, 'pendiente' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM estudiantes WHERE nombre = 'Mariana Vélez Jaramillo' AND grado_id = 10);
INSERT INTO estudiantes (nombre, grado_id, estado) SELECT 'Isabella Cano Cardona', 10, 'pendiente' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM estudiantes WHERE nombre = 'Isabella Cano Cardona' AND grado_id = 10);
INSERT INTO estudiantes (nombre, grado_id, estado) SELECT 'Alejandro López Álvarez', 10, 'pendiente' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM estudiantes WHERE nombre = 'Alejandro López Álvarez' AND grado_id = 10);
INSERT INTO estudiantes (nombre, grado_id, estado) SELECT 'Simón Torres Londoño', 11, 'pendiente' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM estudiantes WHERE nombre = 'Simón Torres Londoño' AND grado_id = 11);
INSERT INTO estudiantes (nombre, grado_id, estado) SELECT 'Felipe Rodríguez Jaramillo', 11, 'pendiente' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM estudiantes WHERE nombre = 'Felipe Rodríguez Jaramillo' AND grado_id = 11);
INSERT INTO estudiantes (nombre, grado_id, estado) SELECT 'Esteban Ríos Betancur', 11, 'pendiente' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM estudiantes WHERE nombre = 'Esteban Ríos Betancur' AND grado_id = 11);
