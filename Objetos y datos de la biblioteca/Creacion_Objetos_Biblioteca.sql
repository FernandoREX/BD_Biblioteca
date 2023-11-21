/*

Autor: Fernando Rosas Gómez

Script de creacion de la base de datos de la biblioteca.

En esta seccion se crean las tablas de la base de datos y los triggers necesarios para 
el funcionamiento de la misma.

NOTA: 
    1) Todos los ID son de tipo CHAR de 5 caracteres.

* Borramos las tablas si es necesario

    DROP TABLE PrestamoBiblioteca;
    DROP TABLE Ejemplar;
    DROP TABLE Tesis;
    DROP TABLE LibroBiblioteca;
    DROP TABLE Director_Tesis;

    DROP TABLE Material;
    DROP TABLE Autor;
    DROP TABLE Lector;

*/

/*
Creacion de la tabla Lector

    Nota:
        1. En el atributo adeudo se le asigna el valor de de NULL
        2. En el atributo fecha_alta se le asigna la fecha actual del sistema.
        3. En el atributo fechavigencia se le asigna la fecha de un año despues 
           de la fecha de alta.
        4. En el atributo tipo_lector solo puede tomar los valores de 'Estudiante', 
           'Profesor' o 'Investigador'.
*/

CREATE TABLE Lector(
    ID_lector CHAR(5) PRIMARY KEY,
    nombre_lec VARCHAR2(30),
    apPat_lec VARCHAR2(30),
    apMat_lec VARCHAR2(30), -- Puede ser nulo
    tipo_lector VARCHAR2(20), -- Solo pueden ser 'Estudiante', 'Profesor' o 'Investigador'
    adeudo NUMBER(6,2) DEFAULT NULL, -- Ahora admite nulos y se establece por defecto en NULL
    calle_lec VARCHAR2(30),
    colonia_lec VARCHAR2(30),
    municipio_lec VARCHAR2(30),
    telefono_lec VARCHAR2(20),
    fecha_alta DATE DEFAULT SYSDATE,
    fechavigencia DATE, -- tiene que ser un año después de la fecha de alta
    CONSTRAINT tipo_lector CHECK (tipo_lector IN ('Estudiante', 'Profesor', 'Investigador'))
);

/*
Creamos la tabla Autor
*/

CREATE TABLE Autor(
    ID_autor CHAR(5) PRIMARY KEY,
    nombre_autor VARCHAR2(30),
    apPat_autor VARCHAR2(30),
    apMat_autor VARCHAR2(30) DEFAULT NULL, -- Puede ser nulo
    nacionalidad_autor VARCHAR2(30)
);

/*
Creamos la tabla Material
*/

CREATE TABLE Material(
    ID_material CHAR(5) PRIMARY KEY,
    titulo_material VARCHAR2(30),
    colocacion_material VARCHAR2(30),
    ubicacionEnBiblioteca VARCHAR2(30),
    ID_autor CHAR(5) NOT NULL,
    CONSTRAINT fk_autor FOREIGN KEY (ID_autor) REFERENCES Autor(ID_autor)
);

/*
Creamos la tabla Ejemplar
*/

CREATE TABLE Ejemplar(
    ID_ejemplar CHAR(5) PRIMARY KEY, -- Llave artifical
    num_ejemplar NUMBER(8),
    ID_material CHAR(5),
    -- Solo puede ser 'Disponible', 'Prestado', 'Mantenimiento' o 'No Prestable'
    Estatus VARCHAR2(20) DEFAULT 'Disponible',
    CONSTRAINT fk_material FOREIGN KEY (ID_material) REFERENCES Material(ID_material) ON DELETE CASCADE,
    CONSTRAINT ckEstatus CHECK (Estatus IN ('Disponible', 'Prestado', 'Mantenimiento', 'No Prestable')),
    CONSTRAINT uNumeroEjemplar UNIQUE (num_ejemplar, ID_material)
);

/*
Creamos la tabla Prestamo

    Nota: 
        1. En el atributo fecha_prestamo se le asigna la fecha actual del sistema.
        2. En el atributo fecha_Entrega se le asigna la fecha en la que se regresa el ejemplar.
        3. En el atributo fecha_Resello se le asigna la fecha en la que se resella el ejemplar.
        4. En el atributo fecha_vencimiento se le asigna la fecha en la que se vence el prestamo.
            Si es Estudiante sus dias de prestamo son: 8 dias.
            Si es Profesor sus dias de prestamo son: 15 dias.
            Si es Investigador sus dias de prestamo son: 30 dias.
        5. Los refrendos solo puede tomar el valor de 1, 2 o 3.


*/

CREATE TABLE PrestamoBiblioteca(
    ID_prestamo CHAR(5) PRIMARY KEY, -- Llave artifical
    ID_lector CHAR(5),
    ID_ejemplar CHAR(5),
    ID_material CHAR(5),
    fecha_prestamo DATE DEFAULT SYSDATE,
    fecha_Entrega DATE DEFAULT NULL,
    fecha_Resello DATE DEFAULT NULL,
    fecha_vencimiento DATE DEFAULT NULL,
    Numero_Refrendo NUMBER(2),
    CONSTRAINT fk_lector FOREIGN KEY (ID_lector) REFERENCES Lector(ID_lector),
    CONSTRAINT fk_ejemplar FOREIGN KEY (ID_ejemplar) REFERENCES Ejemplar(ID_ejemplar),
    CONSTRAINT fk_material_PB FOREIGN KEY (ID_material) REFERENCES Material(ID_material),
    CONSTRAINT ckNumeroRefrendo CHECK (Numero_Refrendo IN (1, 2, 3)),
    CONSTRAINT uPrestamo UNIQUE (ID_lector, ID_ejemplar, ID_material)
);

/*
Creacion de la tabla Multa

    Nota:
        En la tabla de multa resive una llave artifical de la tabla prestamo ID_prestamo, 
        la llave remplaza a su llave compuesta por ID_lector, num_ejemplar e ID_material.

*/

CREATE TABLE MULTA(
    ID_multa CHAR(5) PRIMARY KEY,
    fecha_multa DATE DEFAULT SYSDATE,
    dias_retraso NUMBER(4),
    monto_multa NUMBER(6,2),
    ID_prestamo CHAR(5) NOT NULL,
    CONSTRAINT fk_prestamo FOREIGN KEY (ID_prestamo) REFERENCES PrestamoBiblioteca(ID_prestamo)
);

/*
Creamos tabla Director_Tesis
*/

CREATE TABLE Director_Tesis(
    ID_director CHAR(5) PRIMARY KEY,
    nombre_director VARCHAR2(30),
    apPat_director VARCHAR2(30),
    apMat_director VARCHAR2(30) DEFAULT NULL, -- Puede ser nulo
    grado_Academico VARCHAR2(30)
);

/*
Creamos la tabla Tesis
*/

CREATE TABLE Tesis(
    ID_tesis CHAR(5) PRIMARY KEY,
    ID_material CHAR(5),
    anioPublicacion NUMBER(4),
    Carrera_Tema VARCHAR2(30),
    ID_director CHAR(5),
    CONSTRAINT fk_director FOREIGN KEY (ID_director) REFERENCES Director_Tesis(ID_director),
    CONSTRAINT fk_materialTesis FOREIGN KEY (ID_material) REFERENCES Material(ID_material) ON DELETE CASCADE
);

/*
Creamos la tabla Libro
*/

CREATE TABLE LibroBiblioteca(
    ISBN NUMBER(13) PRIMARY KEY,
    ID_material CHAR(5),
    NUM_Adquisicion NUMBER(4),
    carrera_tema VARCHAR2(30),
    edicion NUMBER(4),
    CONSTRAINT fk_materialLibro FOREIGN KEY (ID_material) REFERENCES Material(ID_material) ON DELETE CASCADE
);


