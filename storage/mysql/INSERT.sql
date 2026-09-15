USE biblioteca_campus;


INSERT INTO libro (isbn, genero, disponibilidad, titulo) VALUES
('978-0307474728', 'Realismo Mágico', TRUE,  'Cien Años de Soledad'),
('978-0156012195', 'Fábula',          TRUE,  'El Principito'),
('978-0451524935', 'Distopía',        FALSE, '1984'),
('978-8437604572', 'Novela',          TRUE,  'Rayuela'),
('978-0553293357', 'Ciencia Ficción', TRUE,  'Fundación'),
('978-1400034956', 'Novela',          TRUE,  'Crónica de una Muerte Anunciada');


INSERT INTO autor (nombre, apellido) VALUES
('Gabriel', 'García Márquez'),
('Antoine', 'de Saint-Exupéry'),
('George',  'Orwell'),
('Julio',   'Cortázar'),
('Isaac',   'Asimov');


INSERT INTO miembro (apellido, nombre, telefono) VALUES
('Ramírez',  'Laura',  '3001234567'),
('Gómez',    'Carlos', '3009876543'),
('Martínez', 'Ana',    '3151122334'),
('Torres',   'Diego',  '3204455667');

 
INSERT INTO libro_autor (idLibro, idAutor) VALUES
(1, 1),
(2, 2), 
(3, 3),
(4, 4), 
(5, 5),
(6, 1); 


INSERT INTO publicacion (numeroEdicion, editorial, fechaPublicacion, idLibro) VALUES
('1', 'Editorial Sudamericana',   '1967-05-30', 1),
('2', 'Editorial Diana',          '1982-01-01', 1),
('1', 'Reynal & Hitchcock',       '1943-04-06', 2),
('1', 'Secker & Warburg',         '1949-06-08', 3),
('2', 'Debolsillo',               '1990-01-01', 3),
('1', 'Editorial Sudamericana',   '1963-06-28', 4),
('1', 'Gnome Press',              '1951-05-01', 5),
('1', 'Editorial La Oveja Negra', '1981-01-01', 6);


INSERT INTO transaccion (fechaPrestamo, estado, fechaDevolucion, idLibro, idMiembro) VALUES
('2025-08-01', 'prestado',  NULL,         3, 1),
('2025-07-10', 'devuelto',  '2025-07-22', 1, 2),
('2025-08-20', 'atrasado',  NULL,         5, 3),
('2025-09-01', 'devuelto',  '2025-09-10', 2, 4),
('2025-09-05', 'prestado',  NULL,         6, 1);
