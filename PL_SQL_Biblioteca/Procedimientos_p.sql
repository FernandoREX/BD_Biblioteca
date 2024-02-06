/*
Procedimientos para registrar, actualizar y eliminar datos de la base de datos
Autor: David Vigil
*/
/*
Procedimiento para registrar un lector ✅
*/

CREATE OR REPLACE PROCEDURE registrarLector(
    id_lector IN Lector.ID_lector%TYPE,
    nombre_lec IN Lector.nombre_lec%TYPE,
    apPat_lec IN Lector.apPat_lec%TYPE,
    apMat_lec IN Lector.apMat_lec%TYPE,
    tipo_lector IN Lector.tipo_lector%TYPE,
    adeudo IN Lector.adeudo%TYPE,
    calle_lec IN Lector.calle_lec%TYPE,
    colonia_lec IN Lector.colonia_lec%TYPE,
    municipio_lec IN Lector.municipio_lec%TYPE,
    telefono_lec IN Lector.telefono_lec%TYPE,
    fecha_alta IN Lector.fecha_alta%TYPE,
    fechavigencia IN Lector.fechavigencia%TYPE
)
IS
BEGIN
    INSERT INTO Lector VALUES(
        id_lector,
        nombre_lec,
        apPat_lec,
        apMat_lec,
        tipo_lector,
        adeudo,
        calle_lec,
        colonia_lec,
        municipio_lec,
        telefono_lec,
        fecha_alta,
        fechavigencia
    );
    COMMIT;
END;
/

/*
Procedimiento para actualizar un lector ✅
*/

CREATE OR REPLACE PROCEDURE actualizarLector(
    id_lector IN Lector.ID_lector%TYPE,
    nombre_lec IN Lector.nombre_lec%TYPE,
    apPat_lec IN Lector.apPat_lec%TYPE,
    apMat_lec IN Lector.apMat_lec%TYPE,
    tipo_lector IN Lector.tipo_lector%TYPE,
    adeudo IN Lector.adeudo%TYPE,
    calle_lec IN Lector.calle_lec%TYPE,
    colonia_lec IN Lector.colonia_lec%TYPE,
    municipio_lec IN Lector.municipio_lec%TYPE,
    telefono_lec IN Lector.telefono_lec%TYPE,
    fecha_alta IN Lector.fecha_alta%TYPE,
    fechavigencia IN Lector.fechavigencia%TYPE
)
IS
BEGIN
    UPDATE Lector SET
        nombre_lec = nombre_lec,
        apPat_lec = apPat_lec,
        apMat_lec = apMat_lec,
        tipo_lector = tipo_lector,
        adeudo = adeudo,
        calle_lec = calle_lec,
        colonia_lec = colonia_lec,
        municipio_lec = municipio_lec,
        telefono_lec = telefono_lec
    WHERE ID_lector = id_lector;
    COMMIT;
END;
/

/*
Procedimiento para eliminar un lector ✅
*/

CREATE OR REPLACE PROCEDURE eliminarLector(
    id_lector IN Lector.ID_lector%TYPE
)
IS
BEGIN
    DELETE FROM Lector WHERE ID_lector = id_lector;
    COMMIT;
END;
/

/*
Procedimiento para registrar un autor ✅
*/

CREATE OR REPLACE PROCEDURE registrarAutor(
    id_autor IN Autor.ID_autor%TYPE,
    nombre_autor IN Autor.nombre_autor%TYPE,
    apPat_autor IN Autor.apPat_autor%TYPE,
    apMat_autor IN Autor.apMat_autor%TYPE,
    nacionalidad_autor IN Autor.nacionalidad_autor%TYPE
)
IS
BEGIN
    INSERT INTO Autor VALUES(
        id_autor,
        nombre_autor,
        apPat_autor,
        apMat_autor,
        nacionalidad_autor
    );
    COMMIT;
END;
/

/*
Procedimiento para actualizar un autor ✅
*/
CREATE OR REPLACE PROCEDURE actualizarAutor(
    id_autor IN Autor.ID_autor%TYPE,
    nombre_autor IN Autor.nombre_autor%TYPE,
    apPat_autor IN Autor.apPat_autor%TYPE,
    apMat_autor IN Autor.apMat_autor%TYPE
)
IS
BEGIN
    UPDATE Autor SET
        nombre_autor = nombre_autor,
        apPat_autor = apPat_autor,
        apMat_autor = apMat_autor
    WHERE ID_autor = id_autor;
    COMMIT;
END;
/


/*
Procedimiento para registrar un material ✅
*/

CREATE OR REPLACE PROCEDURE registrarMaterial(
    id_material IN Material.ID_material%TYPE,
    titulo_material IN Material.titulo_material%TYPE,
    colocacion_material IN Material.colocacion_material%TYPE,
    ubicacionEnBiblioteca IN Material.ubicacionEnBiblioteca%TYPE,
    id_autor IN Material.ID_autor%TYPE
)
IS
BEGIN
    INSERT INTO Material VALUES(
        id_material,
        titulo_material,
        colocacion_material,
        ubicacionEnBiblioteca,
        id_autor
    );
    COMMIT;
END;
/

/*
Procedimiento para actualizar un material ✅
*/

CREATE OR REPLACE PROCEDURE actualizarMaterial(
    id_material IN Material.ID_material%TYPE,
    titulo_material IN Material.titulo_material%TYPE,
    colocacion_material IN Material.colocacion_material%TYPE,
    ubicacionEnBiblioteca IN Material.ubicacionEnBiblioteca%TYPE,
    id_autor IN Material.ID_autor%TYPE
)
IS
BEGIN
    UPDATE Material SET
        titulo_material = titulo_material,
        colocacion_material = colocacion_material,
        ubicacionEnBiblioteca = ubicacionEnBiblioteca,
        ID_autor = id_autor
    WHERE ID_material = id_material;
    COMMIT;
END;
/

/*
Procedimiento para registrar un ejemplar ✅
*/

CREATE OR REPLACE PROCEDURE registrarEjemplar(
    id_ejemplar IN Ejemplar.ID_ejemplar%TYPE,
    num_ejemplar IN Ejemplar.num_ejemplar%TYPE,
    id_material IN Ejemplar.ID_material%TYPE,
    estatus IN Ejemplar.Estatus%TYPE
)
IS
BEGIN
    INSERT INTO Ejemplar VALUES(
        id_ejemplar,
        num_ejemplar,
        id_material,
        estatus
    );
    COMMIT;
END;
/

/*
Procedimiento para actualizar un ejemplar ✅
*/

CREATE OR REPLACE PROCEDURE actualizarEjemplar(
    id_ejemplar IN Ejemplar.ID_ejemplar%TYPE,
    num_ejemplar IN Ejemplar.num_ejemplar%TYPE,
    id_material IN Ejemplar.ID_material%TYPE,
    estatus IN Ejemplar.Estatus%TYPE
)
IS
BEGIN
    UPDATE Ejemplar SET
        num_ejemplar = num_ejemplar,
        ID_material = id_material,
        estatus = estatus
    WHERE ID_ejemplar = id_ejemplar;
    COMMIT;
END;
/

/*
Procedimiento para eliminar un ejemplar ✅
*/

CREATE OR REPLACE PROCEDURE eliminarEjemplar(
    id_ejemplar IN Ejemplar.ID_ejemplar%TYPE
)
IS
BEGIN
    DELETE FROM Ejemplar WHERE ID_ejemplar = id_ejemplar;
    COMMIT;
END;
/

-- Secuencia para el ID del prestamo ✅
CREATE SEQUENCE SQ_id_prestamo
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;


/*
Procedimiento para registrar un prestamo ✅
*/

CREATE OR REPLACE PROCEDURE registrarPrestamo
(
    v_ID_lector IN Lector.ID_lector%TYPE,
    v_ID_ejemplar IN Ejemplar.ID_ejemplar%TYPE
)
IS
    v_ID_prestamo CHAR(5);
    v_FechaPrestamo DATE;
    v_FechaEntrega DATE;
    v_FechaResello DATE;
    v_FechaVencimiento DATE;
    v_NumeroRefrendo NUMBER(2);
    v_TipoLector Lector.tipo_lector%TYPE;
    v_ID_material Material.ID_material%TYPE;
BEGIN
    SELECT tipo_lector INTO v_TipoLector
    FROM Lector
    WHERE ID_lector = v_ID_lector;

    SELECT ID_material INTO v_ID_material
    FROM Ejemplar
    WHERE ID_EJEMPLAR = v_ID_EJEMPLAR; -- Corregido a ID_material

    IF f_TieneMultas(v_ID_lector) THEN
        RAISE_APPLICATION_ERROR(-20002, 'No se puede prestar el material, tiene multas pendientes');
    END IF;

    IF v_TipoLector = 'Estudiante' THEN
        v_FechaPrestamo := SYSDATE;
        v_FechaEntrega := SYSDATE + 8;
        v_FechaResello := SYSDATE + 8;
        v_FechaVencimiento := SYSDATE + 8;
        v_NumeroRefrendo := 1;
    ELSIF v_TipoLector = 'Profesor' THEN
        v_FechaPrestamo := SYSDATE;
        v_FechaEntrega := SYSDATE + 15;
        v_FechaResello := SYSDATE + 15;
        v_FechaVencimiento := SYSDATE + 15;
        v_NumeroRefrendo := 2;
    ELSIF v_TipoLector = 'Investigador' THEN
        v_FechaPrestamo := SYSDATE;
        v_FechaEntrega := SYSDATE + 30;
        v_FechaResello := SYSDATE + 30;
        v_FechaVencimiento := SYSDATE + 30;
        v_NumeroRefrendo := 3;
    END IF;

    v_ID_prestamo := 'PR'||SQ_ID_PRESTAMO.NEXTVAL; -- Corregido a SQ_ID_PRESTAMO.NEXTVAL
    INSERT INTO PrestamoBiblioteca VALUES
    (
        v_ID_prestamo, 
        v_ID_lector, 
        v_ID_ejemplar, 
        v_ID_material, -- Cambiado a v_ID_material
        v_FechaPrestamo,
        '',
        v_FechaResello,
        v_FechaVencimiento,
        v_NumeroRefrendo
    );
END registrarPrestamo;
/


/*
Procedimiento para actualizar un prestamo que con un resello el dia de devolucion
y tomando en cuenta los dias segun sus estatus y si tiene multas no puede resellar ✅
*/

CREATE OR REPLACE PROCEDURE actualizarPrestamo
(
    v_ID_prestamo IN PrestamoBiblioteca.ID_prestamo%TYPE
)
IS
    v_FechaEntrega DATE;
    v_FechaResello DATE;
    v_FechaVencimiento DATE;
    v_NumeroRefrendo NUMBER(2);
    v_TipoLector Lector.tipo_lector%TYPE;
BEGIN
    SELECT fecha_entrega INTO v_FechaEntrega
    FROM PrestamoBiblioteca
    WHERE ID_prestamo = v_ID_prestamo;

    SELECT fecha_resello INTO v_FechaResello
    FROM PrestamoBiblioteca
    WHERE ID_prestamo = v_ID_prestamo;

    SELECT fecha_vencimiento INTO v_FechaVencimiento
    FROM PrestamoBiblioteca
    WHERE ID_prestamo = v_ID_prestamo;

    SELECT tipo_lector INTO v_TipoLector
    FROM Lector
    JOIN PrestamoBiblioteca USING(ID_lector)
    WHERE ID_prestamo = v_ID_prestamo;

    IF v_FechaEntrega = SYSDATE THEN
        IF v_TipoLector = 'Estudiante' THEN
            UPDATE PrestamoBiblioteca
            SET fecha_resello = SYSDATE + 8,
                fecha_vencimiento = SYSDATE + 8,
                numero_refrendo = 1
            WHERE ID_prestamo = v_ID_prestamo;
        ELSIF v_TipoLector = 'Profesor' THEN
            UPDATE PrestamoBiblioteca
            SET fecha_resello = SYSDATE + 15,
                fecha_vencimiento = SYSDATE + 15,
                numero_refrendo = 2
            WHERE ID_prestamo = v_ID_prestamo;
        ELSIF v_TipoLector = 'Investigador' THEN
            UPDATE PrestamoBiblioteca
            SET fecha_resello = SYSDATE + 30,
                fecha_vencimiento = SYSDATE + 30,
                numero_refrendo = 3
            WHERE ID_prestamo = v_ID_prestamo;
        END IF;
    END IF;
END actualizarPrestamo;
/


/*
Procedimiento para eliminar el prestamo si se devuelve en tiempo ✅
*/

CREATE OR REPLACE PROCEDURE eliminarPrestamo
(
    v_ID_prestamo IN PrestamoBiblioteca.ID_prestamo%TYPE
)
IS
    v_FechaEntrega DATE;
BEGIN
    SELECT fecha_entrega INTO v_FechaEntrega
    FROM PrestamoBiblioteca
    WHERE ID_prestamo = v_ID_prestamo;

    IF v_FechaEntrega < SYSDATE THEN
        DELETE FROM PrestamoBiblioteca
        WHERE ID_prestamo = v_ID_prestamo;
    END IF;
END eliminarPrestamo;
/

/*
Procedimiento para registrar una multa ✅
*/

CREATE OR REPLACE PROCEDURE registrarMulta
(
    v_ID_lector IN LECTOR.ID_LECTOR%TYPE
)
IS
    v_idCompuesto CHAR(5);
    v_DiasRetraso NUMBER(5);
    CURSOR Multa_Condicion IS
        SELECT * FROM PrestamoBiblioteca
        WHERE ID_lector = v_ID_lector;
BEGIN
    FOR C1 IN Multa_Condicion LOOP
        v_DiasRetraso := TRUNC(SYSDATE - C1.fecha_vencimiento);
        IF C1.fecha_vencimiento < SYSDATE THEN
            v_idCompuesto := 'MU'||SQ_id_multa.NEXTVAL;
            INSERT INTO Multa VALUES
            (v_idCompuesto, SYSDATE, v_DiasRetraso, v_DiasRetraso*10, C1.ID_prestamo);
        END IF;
    END LOOP;
END registrarMulta;
/

-- ACTUALIZAR MULTA

CREATE OR REPLACE PROCEDURE actualizarMulta
(
    v_ID_multa IN Multa.ID_multa%TYPE
)
IS
    v_DiasRetraso NUMBER(5);
BEGIN
    SELECT dias_retraso INTO v_DiasRetraso
    FROM Multa
    WHERE ID_multa = v_ID_multa;

    UPDATE Multa
    SET dias_retraso = v_DiasRetraso,
        monto_multa = v_DiasRetraso*10
    WHERE ID_multa = v_ID_multa;
END actualizarMulta;
/

/*
Procedimiento para ver las multas de un lector ✅
*/

CREATE OR REPLACE PROCEDURE verMultas
(
    v_ID_lector IN Lector.ID_lector%TYPE
)
IS
    v_MultasAcumuladas NUMBER(6,2);
BEGIN
    SELECT SUM(monto_multa) INTO v_MultasAcumuladas
    FROM Multa
    JOIN PrestamoBiblioteca USING(ID_prestamo)
    WHERE ID_lector = v_ID_lector;

    DBMS_OUTPUT.PUT_LINE('El lector con ID: '||v_ID_lector||' tiene un adeudo de: '||v_MultasAcumuladas);
END verMultas;
/

/*
Procedimiento para eliminar una multa ✅
*/

CREATE OR REPLACE PROCEDURE eliminarMulta(
    id_multa IN Multa.ID_multa%TYPE
)
IS
BEGIN
    DELETE FROM Multa WHERE ID_multa = id_multa;
    COMMIT;
END;
/

/*
Procedimiento para regresar un prestamo
*/

CREATE OR REPLACE PROCEDURE regresarPrestamo
(
    v_ID_prestamo IN PrestamoBiblioteca.ID_prestamo%TYPE
)
IS
    v_FechaEntrega DATE;
    v_FechaResello DATE;
    v_FechaVencimiento DATE;
    v_NumeroRefrendo NUMBER(2);
    v_TipoLector Lector.tipo_lector%TYPE;
    v_multas BOOLEAN;
BEGIN
-- revisa si tiene multas
    v_multas := f_TieneMultas(v_ID_prestamo);

    IF v_multas THEN
        RAISE_APPLICATION_ERROR(-20003, 'No se puede regresar el material, tiene multas pendientes');
    END IF;

    UPDATE PrestamoBiblioteca
    SET fecha_entrega = SYSDATE
    WHERE ID_prestamo = v_ID_prestamo;

END regresarPrestamo;


/*
-------------------------------------------------------------------------------------------
Ejemplos para usar cada uno de los procedimientos y funciones, los prociemientos con exec
-------------------------------------------------------------------------------------------
*/

/*
Ejemplo para registrar un lector ✅
*/

EXEC registrarLector('L0999', 'David', 'Vigil', 'Gonzalez', 'Estudiante', 0, 'Calle 1', 'Colonia 1', 'Municipio 1', '1234567890', SYSDATE, SYSDATE + 365);

/*
Ejemplo para actualizar un lector ✅
*/

EXEC actualizarLector('L0999', 'David', 'Vigil', 'Gonzalez', 'Estudiante', 0, 'Calle 1', 'Colonia 1', 'Municipio 1', '1234567890');

/*
Ejemplo para eliminar un lector ✅
*/

EXEC eliminarLector('L0999');

/*
Ejemplo para registrar un autor ✅
*/

EXEC registrarAutor('A0001', 'David', 'Vigil', 'Gonzalez', 'Mexicano');

/*
Ejemplo para actualizar un autor ✅
*/

EXEC actualizarAutor('A0001', 'De Vito', 'Vigil', 'Gonzalez');

/*
Ejemplo para registrar un material ✅
*/

EXEC registrarMaterial('M0023', 'Cien años 2', 'Estante 1', 'Sección A', 'A0001');

/*
Ejemplo para actualizar un material ✅
*/

EXEC actualizarMaterial('M0023', 'Cien años 2', 'Estante 4', 'Sección Z', 'A0001');

/*
Ejemplo para registrar un ejemplar ✅
*/

EXEC registrarEjemplar('E0098', 1, 'M0023', 'Disponible');

/*
Ejemplo para actualizar un ejemplar ✅
*/

EXEC actualizarEjemplar('E0098', 9, 'M0023', 'Disponible');

/*
Ejemplo para eliminar un ejemplar ✅
*/

EXEC eliminarEjemplar('E0098');

/*
Ejemplo para registrar un prestamo ✅
*/

EXEC registrarPrestamo('L0999', 'E0001');

/*
Ejemplo para actualizar un prestamo ✅
*/

EXEC actualizarPrestamo('PR0001'); -- Modificar con id_prestamo

/*
Ejemplo para eliminar un prestamo ✅
*/

EXEC eliminarPrestamo('PR0001'); -- Modificar con id_prestamo

/*
Ejemplo para registrar una multa ✅
*/

-- Procedimiento para anexar todas las multas todos los dias automaticamente
CREATE OR REPLACE PROCEDURE p_AnexarMultas
IS
    CURSOR c_Lectores IS
        SELECT ID_lector FROM Lector;
BEGIN
    FOR C1 IN c_Lectores LOOP
        p_IngresarMulta(C1.ID_lector);
    END LOOP;
END p_AnexarMultas;
/

-- Procedimiento para ver las multas de un lector
CREATE OR REPLACE PROCEDURE p_VerMultas
(
    v_ID_lector IN Lector.ID_lector%TYPE
)
IS
    v_MultasAcumuladas NUMBER(6,2);
BEGIN
    SELECT SUM(monto_multa) INTO v_MultasAcumuladas
    FROM Multa
    JOIN PrestamoBiblioteca USING(ID_prestamo)
    WHERE ID_lector = v_ID_lector;

    DBMS_OUTPUT.PUT_LINE('El lector con ID: '||v_ID_lector||' tiene un adeudo de: '||v_MultasAcumuladas);
END p_VerMultas;
/

EXEC p_AnexarMultas;

EXEC p_VerMultas('L0999');

/*
Ejemplo para eliminar una multa ✅
*/

EXEC eliminarMulta('MU0001'); -- Modificar con id_multa

/*
Ejemplo para eliminar una multa ✅
*/

EXEC eliminarMulta('MU0001'); -- Modificar con id_multa
