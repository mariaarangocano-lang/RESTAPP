-- RestApp: actualización (NO borra datos)
-- 1) Completa cada grado (1° a 11°) hasta 30 estudiantes como máximo.
-- 2) Crea la tabla de novedades.
-- Ejecutar en phpMyAdmin > base 'restapp' > pestaña SQL.

USE restapp;
SET NAMES utf8mb4;

CREATE TABLE IF NOT EXISTS novedades (
  id            INT AUTO_INCREMENT PRIMARY KEY,
  estudiante_id INT NOT NULL,
  fecha         DATE NOT NULL,
  tipo          VARCHAR(30) NOT NULL,
  descripcion   VARCHAR(500) NOT NULL,
  usuario_id    INT NULL,
  creado        TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  INDEX idx_fecha (fecha),
  INDEX idx_estudiante (estudiante_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Cada INSERT solo agrega al estudiante si el grado tiene menos de 30.
-- Los nombres son de ejemplo: reemplázalos por los reales cuando los tengas.

-- Grado 1°
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Luciana Jaramillo Correa', 1 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 1) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Julián Zapata Henao', 1 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 1) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Esteban Tamayo Ocampo', 1 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 1) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Samuel Pineda Ocampo', 1 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 1) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Camilo Builes Usuga', 1 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 1) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Sebastián Vélez Gómez', 1 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 1) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Kevin Hernández Restrepo', 1 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 1) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Paula Zapata Torres', 1 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 1) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Valentina Builes Jaramillo', 1 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 1) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Laura Osorio Arango', 1 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 1) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Ximena Betancur Mejía', 1 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 1) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Tomás Correa García', 1 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 1) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Camilo Castaño Hernández', 1 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 1) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Alejandro Gaviria Londoño', 1 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 1) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Paula Vargas Muñoz', 1 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 1) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Johan Pineda Ramírez', 1 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 1) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Sofía Cano Vargas', 1 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 1) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Juan David Hernández Osorio', 1 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 1) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Jacobo Ocampo Builes', 1 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 1) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Luciana Sánchez Correa', 1 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 1) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Esteban Builes Osorio', 1 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 1) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Nicolás Arango Ríos', 1 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 1) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Daniel Agudelo Correa', 1 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 1) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Nicolás Rodríguez Pineda', 1 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 1) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Natalia Álvarez López', 1 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 1) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Cristian Echeverri Zapata', 1 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 1) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Cristian Tamayo Sánchez', 1 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 1) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Thomas Muñoz Agudelo', 1 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 1) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Natalia Restrepo Vargas', 1 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 1) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Simón Agudelo Gaviria', 1 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 1) < 30;

-- Grado 2°
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Antonella Ocampo Osorio', 2 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 2) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Felipe Ramírez Ocampo', 2 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 2) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Johan Correa Agudelo', 2 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 2) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Mateo Sánchez Giraldo', 2 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 2) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Paula Quintero Gómez', 2 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 2) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Isabella Muñoz Valencia', 2 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 2) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Emmanuel Echeverri Builes', 2 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 2) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'María José Giraldo Arango', 2 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 2) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Dylan Builes Vargas', 2 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 2) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Julián Builes Sánchez', 2 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 2) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Alejandro Martínez Londoño', 2 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 2) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Emily Vargas Zapata', 2 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 2) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Sebastián Correa Arango', 2 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 2) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Sebastián Cardona Sánchez', 2 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 2) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Camilo Agudelo García', 2 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 2) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Johan Quintero Builes', 2 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 2) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'María José Zapata Giraldo', 2 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 2) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Tomás Ríos Muñoz', 2 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 2) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Sebastián Gómez Hernández', 2 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 2) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Valentina Torres Usuga', 2 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 2) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Miguel Ángel Hernández Tamayo', 2 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 2) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Sara Vélez Restrepo', 2 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 2) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Kevin Martínez Gaviria', 2 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 2) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Mariángel Betancur Muñoz', 2 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 2) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Valentina Jaramillo Usuga', 2 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 2) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Daniel Builes Álvarez', 2 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 2) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Miguel Ángel Henao Agudelo', 2 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 2) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Jacobo Álvarez Valencia', 2 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 2) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Dylan Correa Londoño', 2 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 2) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Daniela Ríos Ospina', 2 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 2) < 30;

-- Grado 3°
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Juliana Usuga Ramírez', 3 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 3) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Julián Ríos Mejía', 3 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 3) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Gabriela Echeverri Giraldo', 3 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 3) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Santiago Gómez Zapata', 3 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 3) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Santiago García López', 3 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 3) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Ximena Betancur Rodríguez', 3 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 3) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Sofía Correa Agudelo', 3 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 3) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Emily Ramírez Torres', 3 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 3) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Emily Restrepo Builes', 3 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 3) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Emmanuel Pineda Tamayo', 3 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 3) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Samantha Muñoz Usuga', 3 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 3) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Nicolás Montoya Sánchez', 3 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 3) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Kevin Castaño Vargas', 3 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 3) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Esteban Henao García', 3 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 3) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Alejandro Osorio Martínez', 3 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 3) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Sara Cardona Martínez', 3 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 3) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Johan Gaviria López', 3 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 3) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Sebastián Giraldo Agudelo', 3 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 3) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Cristian Rodríguez Álvarez', 3 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 3) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Johan Echeverri Montoya', 3 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 3) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Nicolás Álvarez Ospina', 3 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 3) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Felipe Cardona Mejía', 3 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 3) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Mariángel Sánchez Gaviria', 3 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 3) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Samuel Hernández Mejía', 3 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 3) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Ana Sofía Cardona Betancur', 3 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 3) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Manuela Arango Vargas', 3 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 3) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Andrés Ríos Londoño', 3 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 3) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Emmanuel Cardona Jaramillo', 3 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 3) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Nicolás Agudelo Torres', 3 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 3) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Luciana Echeverri Quintero', 3 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 3) < 30;

-- Grado 4°
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Salomé Montoya Henao', 4 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 4) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Valentina Hernández Vargas', 4 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 4) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Johan Castaño Ríos', 4 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 4) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Miguel Ángel Cardona Rodríguez', 4 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 4) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Ximena Ospina Betancur', 4 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 4) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Alejandro Pineda Gaviria', 4 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 4) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Laura Restrepo Tamayo', 4 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 4) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Cristian Quintero Ocampo', 4 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 4) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Daniel Montoya Pineda', 4 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 4) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Paula Pineda Quintero', 4 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 4) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Felipe Ocampo Álvarez', 4 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 4) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Salomé Arango Zapata', 4 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 4) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Juan David Ospina Zapata', 4 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 4) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Simón López Betancur', 4 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 4) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Camilo Cardona Zapata', 4 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 4) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Julián Jaramillo Quintero', 4 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 4) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Jacobo García Londoño', 4 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 4) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Emily Ospina Arango', 4 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 4) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Antonella García Gómez', 4 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 4) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Samuel Arango Ríos', 4 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 4) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Valentina López Zapata', 4 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 4) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Karol Rodríguez Ramírez', 4 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 4) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Luciana Zapata Ocampo', 4 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 4) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Daniel Betancur Jaramillo', 4 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 4) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Emmanuel Valencia Tamayo', 4 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 4) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Isabella Osorio Jaramillo', 4 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 4) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Esteban Montoya Valencia', 4 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 4) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Emmanuel Sánchez Restrepo', 4 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 4) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Simón Cano Correa', 4 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 4) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Simón Arango Mejía', 4 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 4) < 30;

-- Grado 5°
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Paula Betancur López', 5 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 5) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Tomás Sánchez Rodríguez', 5 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 5) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Paula Castaño Londoño', 5 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 5) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Camilo Restrepo Ramírez', 5 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 5) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Samuel Jaramillo Usuga', 5 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 5) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Sofía Gaviria Castaño', 5 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 5) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Sara Ocampo López', 5 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 5) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Camilo Restrepo Ospina', 5 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 5) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Kevin Restrepo Martínez', 5 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 5) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Juliana Echeverri Betancur', 5 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 5) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Esteban Ramírez Rodríguez', 5 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 5) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Juan David Usuga Álvarez', 5 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 5) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Ximena Ríos Mejía', 5 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 5) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Santiago Vélez Ríos', 5 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 5) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Felipe Henao Álvarez', 5 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 5) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Manuela Gaviria Rodríguez', 5 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 5) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Felipe Gaviria Ocampo', 5 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 5) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Mateo Arango Muñoz', 5 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 5) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Natalia Rodríguez Quintero', 5 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 5) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Miguel Ángel Agudelo Ríos', 5 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 5) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Antonella Jaramillo Álvarez', 5 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 5) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Brayan Usuga Hernández', 5 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 5) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Manuela Ocampo Martínez', 5 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 5) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Johan Correa Arango', 5 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 5) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Luna Echeverri Jaramillo', 5 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 5) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Mariana Gómez Vélez', 5 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 5) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Thomas López Henao', 5 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 5) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Simón Correa Muñoz', 5 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 5) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Tomás Osorio Cano', 5 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 5) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Natalia Ocampo Quintero', 5 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 5) < 30;

-- Grado 6°
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Luna Giraldo Cano', 6 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 6) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Ximena Vargas Ocampo', 6 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 6) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Thomas Usuga Ramírez', 6 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 6) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Sara Ospina Ríos', 6 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 6) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Gabriela Builes Gómez', 6 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 6) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Ximena Echeverri Ríos', 6 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 6) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Isabella Cardona Hernández', 6 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 6) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Ana Sofía Cano Gaviria', 6 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 6) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Camilo Arango Álvarez', 6 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 6) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Cristian Zapata Rodríguez', 6 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 6) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Miguel Ángel Montoya Usuga', 6 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 6) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Ana Sofía Pineda Martínez', 6 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 6) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Mateo Mejía Gaviria', 6 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 6) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Nicolás Ospina Correa', 6 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 6) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Salomé Hernández Muñoz', 6 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 6) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Camilo Mejía Castaño', 6 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 6) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Alejandro Arango Ramírez', 6 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 6) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Isabella Usuga Giraldo', 6 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 6) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Samantha Londoño Gaviria', 6 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 6) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Paula Betancur Álvarez', 6 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 6) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Santiago Giraldo Gómez', 6 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 6) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Esteban Agudelo Sánchez', 6 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 6) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Ximena Gaviria Ospina', 6 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 6) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Camilo Echeverri Rodríguez', 6 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 6) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Manuela Jaramillo Gaviria', 6 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 6) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Gabriela Ospina Rodríguez', 6 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 6) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Luciana Correa Gómez', 6 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 6) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'María José García Cano', 6 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 6) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Ana Sofía Montoya Gaviria', 6 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 6) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Gabriela Valencia Tamayo', 6 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 6) < 30;

-- Grado 7°
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Karol Álvarez Zapata', 7 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 7) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Emily Builes Zapata', 7 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 7) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Camilo García Mejía', 7 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 7) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Antonella Tamayo Ramírez', 7 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 7) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Johan Restrepo Betancur', 7 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 7) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Thomas Builes Restrepo', 7 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 7) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Alejandro Echeverri Vélez', 7 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 7) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Ximena Vargas Usuga', 7 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 7) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Ximena Hernández García', 7 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 7) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Daniela Builes Ramírez', 7 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 7) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Antonella Henao Ospina', 7 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 7) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Emily Sánchez Correa', 7 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 7) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Alejandro Castaño Jaramillo', 7 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 7) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Camilo Builes Osorio', 7 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 7) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Emily Cardona Giraldo', 7 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 7) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Emmanuel Henao Betancur', 7 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 7) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Ximena Ríos Usuga', 7 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 7) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Santiago Montoya Muñoz', 7 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 7) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Sebastián Pineda Álvarez', 7 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 7) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Juan David Quintero Castaño', 7 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 7) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Luciana Jaramillo Quintero', 7 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 7) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Sebastián Arango Muñoz', 7 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 7) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Miguel Ángel Quintero Henao', 7 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 7) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Luna Muñoz Ocampo', 7 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 7) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Luciana Quintero Londoño', 7 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 7) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Daniel Vargas Osorio', 7 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 7) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Mateo Rodríguez Ocampo', 7 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 7) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Cristian Castaño Ríos', 7 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 7) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Luna Zapata Builes', 7 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 7) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Simón Gaviria Echeverri', 7 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 7) < 30;

-- Grado 8°
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Laura Sánchez Betancur', 8 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 8) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Johan Castaño López', 8 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 8) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Mateo Cardona Gómez', 8 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 8) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Mariángel Ocampo Arango', 8 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 8) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Juliana Castaño Usuga', 8 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 8) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Johan Tamayo Ríos', 8 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 8) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Thomas Agudelo Castaño', 8 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 8) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Valentina Martínez Henao', 8 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 8) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Brayan Restrepo Quintero', 8 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 8) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Emily Rodríguez Montoya', 8 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 8) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Emmanuel Correa Quintero', 8 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 8) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Kevin Cano Hernández', 8 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 8) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Alejandro Giraldo Gaviria', 8 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 8) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Valentina Zapata Muñoz', 8 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 8) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Luna Henao Vargas', 8 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 8) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Laura Valencia Ospina', 8 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 8) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Cristian Ramírez Hernández', 8 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 8) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Daniel Ríos Echeverri', 8 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 8) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Simón Usuga Ocampo', 8 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 8) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Juliana Zapata Rodríguez', 8 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 8) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Mariángel Ríos Martínez', 8 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 8) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Manuela Ocampo Correa', 8 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 8) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Natalia Agudelo Castaño', 8 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 8) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Luna Betancur Jaramillo', 8 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 8) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Esteban Agudelo Arango', 8 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 8) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Andrés Jaramillo Arango', 8 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 8) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Isabella Builes Álvarez', 8 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 8) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Sofía Agudelo Cano', 8 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 8) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Antonella Vargas Giraldo', 8 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 8) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'María José Quintero Correa', 8 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 8) < 30;

-- Grado 9°
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Camilo Osorio Ramírez', 9 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 9) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Laura Usuga López', 9 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 9) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Samuel García Correa', 9 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 9) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Simón Gaviria Ramírez', 9 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 9) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Thomas Tamayo Hernández', 9 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 9) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Julián Echeverri Valencia', 9 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 9) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Emily Builes Jaramillo', 9 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 9) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Felipe Castaño Cano', 9 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 9) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Manuela García Ocampo', 9 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 9) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Manuela Arango Echeverri', 9 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 9) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Nicolás Mejía Zapata', 9 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 9) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Esteban Montoya Rodríguez', 9 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 9) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Emmanuel Vélez Montoya', 9 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 9) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Juan David Correa Echeverri', 9 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 9) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Juliana Correa Montoya', 9 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 9) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Mariángel Builes Álvarez', 9 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 9) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Alejandro Jaramillo Cano', 9 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 9) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Johan Osorio Gaviria', 9 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 9) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Kevin Gaviria Giraldo', 9 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 9) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Gabriela Valencia Ocampo', 9 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 9) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Cristian Muñoz Álvarez', 9 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 9) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Felipe Pineda López', 9 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 9) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Felipe Martínez Quintero', 9 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 9) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Ana Sofía Cardona Álvarez', 9 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 9) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Mariángel Gaviria Betancur', 9 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 9) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Juliana Vargas Ospina', 9 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 9) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Manuela López Cardona', 9 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 9) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Simón Muñoz Ríos', 9 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 9) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Johan Tamayo Builes', 9 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 9) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Miguel Ángel Rodríguez Ramírez', 9 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 9) < 30;

-- Grado 10°
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Natalia Correa Cano', 10 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 10) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Miguel Ángel Hernández Vargas', 10 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 10) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Simón Ríos Muñoz', 10 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 10) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Emily Muñoz Correa', 10 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 10) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Isabella Agudelo Gómez', 10 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 10) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Mariana Zapata Betancur', 10 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 10) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Jacobo Arango Castaño', 10 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 10) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Sofía Ospina Correa', 10 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 10) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Sara Hernández Sánchez', 10 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 10) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Felipe Sánchez Giraldo', 10 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 10) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Samantha Vélez Henao', 10 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 10) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Felipe Builes Montoya', 10 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 10) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'María José Ospina Gaviria', 10 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 10) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Juan David Sánchez Vargas', 10 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 10) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'María José Montoya Ramírez', 10 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 10) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Brayan Torres Ocampo', 10 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 10) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Esteban Agudelo Hernández', 10 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 10) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Laura Giraldo Restrepo', 10 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 10) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Daniela Betancur Tamayo', 10 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 10) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Dylan Ospina Restrepo', 10 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 10) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Manuela Montoya Sánchez', 10 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 10) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Sara Sánchez Rodríguez', 10 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 10) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Alejandro Muñoz Quintero', 10 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 10) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Paula Cano Osorio', 10 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 10) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Valentina Agudelo Echeverri', 10 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 10) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Emmanuel Quintero Betancur', 10 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 10) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Andrés Álvarez Zapata', 10 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 10) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Gabriela Ocampo Henao', 10 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 10) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Ximena Vargas Mejía', 10 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 10) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Esteban Usuga López', 10 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 10) < 30;

-- Grado 11°
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Dylan Ocampo Jaramillo', 11 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 11) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Antonella Hernández Vargas', 11 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 11) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Emmanuel Betancur Gaviria', 11 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 11) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Nicolás Echeverri Zapata', 11 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 11) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Mariángel Londoño Martínez', 11 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 11) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Daniela Usuga Martínez', 11 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 11) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Camila Echeverri Torres', 11 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 11) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Daniel Zapata Mejía', 11 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 11) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Johan Pineda Vargas', 11 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 11) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Kevin Agudelo Gaviria', 11 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 11) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Sofía Muñoz Jaramillo', 11 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 11) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Juliana Rodríguez Zapata', 11 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 11) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Mateo Hernández Ospina', 11 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 11) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Miguel Ángel Arango Rodríguez', 11 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 11) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Isabella García Valencia', 11 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 11) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Nicolás Restrepo Castaño', 11 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 11) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Cristian Muñoz Ramírez', 11 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 11) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Thomas Vélez Jaramillo', 11 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 11) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Cristian Vargas Vélez', 11 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 11) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Mateo Vélez Correa', 11 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 11) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Emily Ríos Martínez', 11 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 11) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Andrés Vélez Valencia', 11 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 11) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Manuela Torres Giraldo', 11 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 11) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Luciana Usuga Agudelo', 11 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 11) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Jacobo Mejía Agudelo', 11 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 11) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Nicolás Rodríguez Builes', 11 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 11) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Laura Mejía Martínez', 11 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 11) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Nicolás Vargas Álvarez', 11 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 11) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Paula Vélez Echeverri', 11 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 11) < 30;
INSERT INTO estudiantes (nombre, grado_id) SELECT 'Emily Quintero Sánchez', 11 FROM DUAL WHERE (SELECT COUNT(*) FROM estudiantes WHERE grado_id = 11) < 30;
