-- Datos para la tabla Lector
INSERT INTO Lector VALUES
('L0001', 'Juan', 'Perez', 'Gomez', 'Estudiante', NULL, 'Calle 123', 'Colonia A', 'Ciudad', '1234567890', TO_DATE('01-01-2022', 'DD-MM-YYYY'), TO_DATE('01-01-2023', 'DD-MM-YYYY'));

INSERT INTO Lector VALUES
('L0002', 'Maria', 'Lopez', 'Rodriguez', 'Profesor', NULL, 'Avenida XYZ', 'Colonia B', 'Otra Ciudad', '9876543210', TO_DATE('15-02-2022', 'DD-MM-YYYY'), TO_DATE('15-02-2023', 'DD-MM-YYYY'));

INSERT INTO Lector VALUES
('L0003', 'Pedro', 'Gutierrez', 'Santos', 'Investigador', 20.50, 'Calle ABC', 'Colonia C', 'Otro Lugar', '5555555555', TO_DATE('10-03-2022', 'DD-MM-YYYY'), TO_DATE('10-03-2023', 'DD-MM-YYYY'));

INSERT INTO Lector VALUES
('L0004', 'Ana', 'Ramirez', 'Hernandez', 'Estudiante', NULL, 'Calle 456', 'Colonia D', 'Pueblo', '5551234567', TO_DATE('03-05-2022', 'DD-MM-YYYY'), TO_DATE('03-05-2023', 'DD-MM-YYYY'));

INSERT INTO Lector VALUES
('L0005', 'Raul', 'Gomez', 'Lopez', 'Profesor', NULL, 'Avenida LMN', 'Colonia E', 'Villa', '9879876543', TO_DATE('15-06-2022', 'DD-MM-YYYY'), TO_DATE('15-06-2023', 'DD-MM-YYYY'));

INSERT INTO Lector VALUES
('L0006', 'Laura', 'Gonzalez', 'Martinez', 'Investigador', 15.75, 'Calle XYZ', 'Colonia F', 'Otro Pueblo', '5677654321', TO_DATE('20-07-2022', 'DD-MM-YYYY'), TO_DATE('20-07-2023', 'DD-MM-YYYY'));

INSERT INTO Lector VALUES
('L0007', 'Jorge', 'Martinez', 'Fernandez', 'Estudiante', NULL, 'Calle 789', 'Colonia G', 'Ciudad Nueva', '6542345678', TO_DATE('10-08-2022', 'DD-MM-YYYY'), TO_DATE('10-08-2023', 'DD-MM-YYYY'));

INSERT INTO Lector VALUES
('L0008', 'Carmen', 'Sanchez', 'Perez', 'Profesor', NULL, 'Avenida OPQ', 'Colonia H', 'Pueblo Viejo', '8763456789', TO_DATE('05-09-2022', 'DD-MM-YYYY'), TO_DATE('05-09-2023', 'DD-MM-YYYY'));

INSERT INTO Lector VALUES
('L0009', 'Roberto', 'Hernandez', 'Gomez', 'Investigador', 5.25, 'Calle UVW', 'Colonia I', 'Otro Lugar', '4324567890', TO_DATE('15-10-2022', 'DD-MM-YYYY'), TO_DATE('15-10-2023', 'DD-MM-YYYY'));

INSERT INTO Lector VALUES
('L0010', 'Elena', 'Fernandez', 'Lopez', 'Estudiante', NULL, 'Calle 101', 'Colonia J', 'Pueblo Nuevo', '7895678901', TO_DATE('20-11-2022', 'DD-MM-YYYY'), TO_DATE('20-11-2023', 'DD-MM-YYYY'));

INSERT INTO Lector VALUES
('L0011', 'Diego', 'Lopez', 'Gonzalez', 'Profesor', NULL, 'Avenida XYZ', 'Colonia K', 'Villa Antigua', '1112223333', TO_DATE('02-12-2022', 'DD-MM-YYYY'), TO_DATE('02-12-2023', 'DD-MM-YYYY'));

-- Datos para la tabla Autor
INSERT INTO Autor VALUES
('A0001', 'Gabriel', 'Garcia', 'Marquez', 'Colombiano');

INSERT INTO Autor VALUES
('A0002', 'Isabel', 'Allende', NULL, 'Chilena');

INSERT INTO Autor VALUES
('A0003', 'Julio', 'Cortazar', NULL, 'Argentino');

INSERT INTO Autor VALUES
('A0004', 'Christopher', 'Bishop', NULL, 'Británico');

INSERT INTO Autor VALUES
('A0005', 'Trevor', 'Hastie', NULL, 'Estadounidense');

INSERT INTO Autor VALUES
('A0006', 'Thomas', 'Cormen', NULL, 'Estadounidense');

INSERT INTO Autor VALUES
('A0007', 'Erich', 'Gamma', NULL, 'Suizo');


-- Datos para la tabla Material
INSERT INTO Material VALUES
('M0001', 'Cien años de soledad', 'Estante 1', 'Sección A', 'A0001');

INSERT INTO Material VALUES
('M0002', 'La casa de los espíritus', 'Estante 2', 'Sección B', 'A0002');

INSERT INTO Material VALUES
('M0003', 'Rayuela', 'Estante 3', 'Sección C', 'A0003');

INSERT INTO Material VALUES
('M0004', 'Machine Learning', 'Estante 4', 'Sección D', 'A0004');

INSERT INTO Material VALUES
('M0005', 'The Elements', 'Estante 4', 'Sección D', 'A0005');

INSERT INTO Material VALUES
('M0006', 'Introduction to Algorithms', 'Estante 5', 'Sección E', 'A0006');

INSERT INTO Material VALUES
('M0007', 'Design Patterns', 'Estante 5', 'Sección E', 'A0007');

INSERT INTO Material VALUES
('M0008', 'Norwegian Wood', 'Estante 6', 'Sección F', 'A0005');

INSERT INTO Material VALUES
('M0009', 'Harry Potter', 'Estante 6', 'Sección F', 'A0007');

INSERT INTO Material VALUES
('M0010', 'The Spy', 'Estante 7', 'Sección G', 'A0004');

INSERT INTO Material VALUES
('M0011', 'Foundation', 'Estante 7', 'Sección G', 'A0004');

INSERT INTO Material VALUES
('M0012', 'Murder on the Orient Express', 'Estante 8', 'Sección H', 'A0004');

INSERT INTO Material VALUES
('M0013', 'Pride and Prejudice', 'Estante 8', 'Sección H', 'A0004');

INSERT INTO Material VALUES
('M0014', '1984', 'Estante 9', 'Sección I', 'A0001');

INSERT INTO Material VALUES
('M0015', 'War and Peace', 'Estante 9', 'Sección I', 'A0006');

-- Datos para la tabla Ejemplar
INSERT INTO Ejemplar VALUES
('E0001', 1, 'M0001', 'Disponible');

INSERT INTO Ejemplar VALUES
('E0002', 1, 'M0002', 'Prestado');

INSERT INTO Ejemplar VALUES
('E0003', 2, 'M0003', 'Mantenimiento');

INSERT INTO Ejemplar VALUES
('E0004', 3, 'M0004', 'Disponible');

INSERT INTO Ejemplar VALUES
('E0005', 1, 'M0005', 'Prestado');

INSERT INTO Ejemplar VALUES
('E0006', 2, 'M0006', 'Mantenimiento');

INSERT INTO Ejemplar VALUES
('E0007', 1, 'M0007', 'Disponible');

INSERT INTO Ejemplar VALUES
('E0008', 1, 'M0008', 'Disponible');

INSERT INTO Ejemplar VALUES
('E0009', 1, 'M0009', 'Prestado');

INSERT INTO Ejemplar VALUES
('E0010', 2, 'M0010', 'Mantenimiento');

INSERT INTO Ejemplar VALUES
('E0011', 3, 'M0011', 'Disponible');

INSERT INTO Ejemplar VALUES
('E0012', 1, 'M0012', 'Prestado');

INSERT INTO Ejemplar VALUES
('E0013', 2, 'M0013', 'Mantenimiento');

INSERT INTO Ejemplar VALUES
('E0014', 1, 'M0014', 'Disponible');

INSERT INTO Ejemplar VALUES
('E0015', 1, 'M0015', 'Prestado');


-- Datos para la tabla PrestamoBiblioteca
INSERT INTO PrestamoBiblioteca VALUES
('P0001', 'L0001', 'E0001', 'M0001', TO_DATE('05-03-2022', 'DD-MM-YYYY'), TO_DATE('15-03-2022', 'DD-MM-YYYY'), NULL, TO_DATE('15-03-2022', 'DD-MM-YYYY'), 1);

INSERT INTO PrestamoBiblioteca VALUES
('P0002', 'L0002', 'E0002', 'M0002', TO_DATE('10-03-2022', 'DD-MM-YYYY'), NULL, NULL, TO_DATE('24-03-2022', 'DD-MM-YYYY'), 1);

INSERT INTO PrestamoBiblioteca VALUES
('P0003', 'L0003', 'E0003', 'M0003', TO_DATE('20-03-2022', 'DD-MM-YYYY'), NULL, NULL, TO_DATE('19-04-2022', 'DD-MM-YYYY'), 2);

INSERT INTO PrestamoBiblioteca VALUES
('P0004', 'L0001', 'E0004', 'M0004', TO_DATE('25-03-2022', 'DD-MM-YYYY'), NULL, NULL, TO_DATE('08-04-2022', 'DD-MM-YYYY'), 1);

INSERT INTO PrestamoBiblioteca VALUES
('P0005', 'L0002', 'E0005', 'M0005', TO_DATE('05-04-2022', 'DD-MM-YYYY'), NULL, NULL, TO_DATE('20-04-2022', 'DD-MM-YYYY'), 1);

INSERT INTO PrestamoBiblioteca VALUES
('P0006', 'L0003', 'E0006', 'M0006', TO_DATE('10-04-2022', 'DD-MM-YYYY'), NULL, NULL, TO_DATE('25-04-2022', 'DD-MM-YYYY'), 2);

INSERT INTO PrestamoBiblioteca VALUES
('P0007', 'L0001', 'E0007', 'M0007', TO_DATE('15-04-2022', 'DD-MM-YYYY'), NULL, NULL, TO_DATE('30-04-2022', 'DD-MM-YYYY'), 1);

INSERT INTO PrestamoBiblioteca VALUES
('P0008', 'L0004', 'E0008', 'M0008', TO_DATE('10-01-2023', 'DD-MM-YYYY'), NULL, NULL, TO_DATE('24-01-2023', 'DD-MM-YYYY'), 1);

INSERT INTO PrestamoBiblioteca VALUES
('P0009', 'L0005', 'E0009', 'M0009', TO_DATE('15-02-2023', 'DD-MM-YYYY'), NULL, NULL, TO_DATE('01-03-2023', 'DD-MM-YYYY'), 1);

INSERT INTO PrestamoBiblioteca VALUES
('P0010', 'L0006', 'E0010', 'M0010', TO_DATE('20-03-2023', 'DD-MM-YYYY'), NULL, NULL, TO_DATE('20-04-2023', 'DD-MM-YYYY'), 2);

INSERT INTO PrestamoBiblioteca VALUES
('P0011', 'L0007', 'E0011', 'M0011', TO_DATE('25-04-2023', 'DD-MM-YYYY'), NULL, NULL, TO_DATE('08-05-2023', 'DD-MM-YYYY'), 1);

INSERT INTO PrestamoBiblioteca VALUES
('P0012', 'L0008', 'E0012', 'M0012', TO_DATE('05-05-2023', 'DD-MM-YYYY'), NULL, NULL, TO_DATE('20-05-2023', 'DD-MM-YYYY'), 1);

INSERT INTO PrestamoBiblioteca VALUES
('P0013', 'L0009', 'E0013', 'M0013', TO_DATE('10-06-2023', 'DD-MM-YYYY'), NULL, NULL, TO_DATE('25-06-2023', 'DD-MM-YYYY'), 2);

INSERT INTO PrestamoBiblioteca VALUES
('P0014', 'L0010', 'E0014', 'M0014', TO_DATE('15-07-2023', 'DD-MM-YYYY'), NULL, NULL, TO_DATE('30-07-2023', 'DD-MM-YYYY'), 1);

INSERT INTO PrestamoBiblioteca VALUES
('P0015', 'L0011', 'E0015', 'M0015', TO_DATE('20-08-2023', 'DD-MM-YYYY'), NULL, NULL, TO_DATE('04-09-2023', 'DD-MM-YYYY'), 1);

-- Datos para la tabla Director_Tesis
INSERT INTO Director_Tesis VALUES
('D0001', 'Carlos', 'Martinez', 'Gutierrez', 'Doctor en Filosofía');

INSERT INTO Director_Tesis VALUES
('D0002', 'Laura', 'Sanchez', 'Fernandez', 'Doctor en Ciencias');

INSERT INTO Director_Tesis VALUES
('D0003', 'Sofia', 'Rodriguez', 'Lopez', 'Doctor en Computación');

INSERT INTO Director_Tesis VALUES
('D0004', 'Manuel', 'Gomez', 'Fernandez', 'Doctor Ambiental');

-- Datos para la tabla Tesis
INSERT INTO Tesis VALUES
('TT004', 'M0001', 2020, 'Ciencias de la Computación', 'D0001');

INSERT INTO Tesis VALUES
('TT005', 'M0002', 2019, 'Ciencias Ambientales', 'D0002');

INSERT INTO Tesis VALUES
('TT006', 'M0003', 2021, 'Ingeniería de Sistemas', 'D0001');

INSERT INTO Tesis VALUES
('TT007', 'M0004', 2022, 'Biología', 'D0001');

-- Datos para la tabla LibroBiblioteca
INSERT INTO LibroBiblioteca VALUES
(9781234567890, 'M0006', 1001, 'Informática', 5);

INSERT INTO LibroBiblioteca VALUES
(9789876543210, 'M0007', 1002, 'Ingeniería de Software', 3);

INSERT INTO LibroBiblioteca VALUES
(9781111111111, 'M0006', 1003, 'Ciencias de la Computación', 6);

INSERT INTO LibroBiblioteca VALUES
(9782222222222, 'M0007', 1004, 'Ingeniería de Software', 4);

-- VEMOS LOS DATOS DE TODAS LAS TABLAS

SELECT * FROM Lector;

SELECT * FROM Autor;

SELECT * FROM Material;

SELECT * FROM Ejemplar;

SELECT * FROM PrestamoBiblioteca;

SELECT * FROM Director_Tesis;

SELECT * FROM Tesis;

SELECT * FROM LibroBiblioteca;


