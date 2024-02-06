/*
Tablas que usaremos en para la programacion de PL/SQL en la biblioteca

SQL> DESC Lector;
 Nombre                                    ┐Nulo?   Tipo
 ----------------------------------------- -------- ----------------------------
 ID_LECTOR                                 NOT NULL CHAR(5)
 NOMBRE_LEC                                         VARCHAR2(30)
 APPAT_LEC                                          VARCHAR2(30)
 APMAT_LEC                                          VARCHAR2(30)
 TIPO_LECTOR                                        VARCHAR2(20)
 ADEUDO                                             NUMBER(6,2)
 CALLE_LEC                                          VARCHAR2(30)
 COLONIA_LEC                                        VARCHAR2(30)
 MUNICIPIO_LEC                                      VARCHAR2(30)
 TELEFONO_LEC                                       VARCHAR2(20)
 FECHA_ALTA                                         DATE
 FECHAVIGENCIA                                      DATE

SQL> DESC Autor;
 Nombre                                    ┐Nulo?   Tipo
 ----------------------------------------- -------- ----------------------------
 ID_AUTOR                                  NOT NULL CHAR(5)
 NOMBRE_AUTOR                                       VARCHAR2(30)
 APPAT_AUTOR                                        VARCHAR2(30)
 APMAT_AUTOR                                        VARCHAR2(30)
 NACIONALIDAD_AUTOR                                 VARCHAR2(30)

SQL> DESC Material;
 Nombre                                    ┐Nulo?   Tipo
 ----------------------------------------- -------- ----------------------------
 ID_MATERIAL                               NOT NULL CHAR(5)
 TITULO_MATERIAL                                    VARCHAR2(30)
 COLOCACION_MATERIAL                                VARCHAR2(30)
 UBICACIONENBIBLIOTECA                              VARCHAR2(30)
 ID_AUTOR                                  NOT NULL CHAR(5)

SQL> DESC Ejemplar;
 Nombre                                    ┐Nulo?   Tipo
 ----------------------------------------- -------- ----------------------------
 ID_EJEMPLAR                               NOT NULL CHAR(5)
 NUM_EJEMPLAR                                       NUMBER(8)
 ID_MATERIAL                                        CHAR(5)
 ESTATUS                                            VARCHAR2(20)

SQL> DESC PrestamoBiblioteca;
 Nombre                                    ┐Nulo?   Tipo
 ----------------------------------------- -------- ----------------------------
 ID_PRESTAMO                               NOT NULL CHAR(5)
 ID_LECTOR                                          CHAR(5)
 ID_EJEMPLAR                                        CHAR(5)
 ID_MATERIAL                                        CHAR(5)
 FECHA_PRESTAMO                                     DATE
 FECHA_ENTREGA                                      DATE
 FECHA_RESELLO                                      DATE
 FECHA_VENCIMIENTO                                  DATE
 NUMERO_REFRENDO                                    NUMBER(2)

SQL> DESC Multa;
 Nombre                                    ┐Nulo?   Tipo
 ----------------------------------------- -------- ----------------------------
 ID_MULTA                                  NOT NULL CHAR(5)
 FECHA_MULTA                                        DATE
 DIAS_RETRASO                                       NUMBER(4)
 MONTO_MULTA                                        NUMBER(6,2)
 ID_PRESTAMO                               NOT NULL CHAR(5)

SQL> DESC Director_Tesis;
 Nombre                                    ┐Nulo?   Tipo
 ----------------------------------------- -------- ----------------------------
 ID_DIRECTOR                               NOT NULL CHAR(5)
 NOMBRE_DIRECTOR                                    VARCHAR2(30)
 APPAT_DIRECTOR                                     VARCHAR2(30)
 APMAT_DIRECTOR                                     VARCHAR2(30)
 GRADO_ACADEMICO                                    VARCHAR2(30)

SQL> DESC Tesis;
 Nombre                                    ┐Nulo?   Tipo
 ----------------------------------------- -------- ----------------------------
 ID_TESIS                                  NOT NULL CHAR(5)
 ID_MATERIAL                                        CHAR(5)
 ANIOPUBLICACION                                    NUMBER(4)
 CARRERA_TEMA                                       VARCHAR2(30)
 ID_DIRECTOR                                        CHAR(5)

SQL> DESC LibroBiblioteca;
 Nombre                                    ┐Nulo?   Tipo
 ----------------------------------------- -------- ----------------------------
 ISBN                                      NOT NULL NUMBER(13)
 ID_MATERIAL                                        CHAR(5)
 NUM_ADQUISICION                                    NUMBER(4)
 CARRERA_TEMA                                       VARCHAR2(30)
 EDICION                                            NUMBER(4)

*/

/****************************************************************************************
Programacion de PL/SQL para la Multa

    * Necesito una secuencia para el id de la multa
    * Trigger para insertar no dejar eleminar lector con multas
    * Procedimiento para insertar multas

****************************************************************************************/
-- Secuencia para el ID de la multa
CREATE SEQUENCE SQ_id_multa
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

-- Trigger por si queremos eliminar ususario con multas
CREATE OR REPLACE TRIGGER tr_Multas_Eliminar_Lector
BEFORE UPDATE OR DELETE
ON Lector
FOR EACH ROW

CURSOR c_Deudas IS
    SELECT * FROM multa
    JOIN PrestamoBiblioteca USING(ID_prestamo);

BEGIN
    FOR C1 IN c_Deudas LOOP 
        IF :OLD.ID_lector = C1.ID_lector THEN
            RAISE_APPLICATION_ERROR(-20000, 'No se puede eliminar el lector, tiene multas pendientes');
        END IF;
    END LOOP;

END tr_Multas;
/

-- Funcion para calcular si tiene multas
CREATE OR REPLACE FUNCTIONS f_TieneMultas
(
    v_ID_lector IN Lector.ID_lector%TYPE
)
RETURN BOOLEAN
IS
    v_NoMultas NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_NoMultas 
    FROM MULTA
    JOIN PrestamoBiblioteca USING(ID_prestamo)
    WHERE ID_lector = v_ID_lector;

    IF v_NoMultas IS NULL THEN
        RETURN FALSE;
    ELSE
        RETURN TRUE;
    END IF;
END f_TieneMultas;
/

-- Porcedimiento para insertar multas
CREATE OR REPLACE PROCEDURE p_IngresarMulta
(
    v_ID_lector IS LECTOR.ID_LECTOR%TYPE
)
IS
    v_idCompuesto CHAR(5);
    v_DiasRetraso NUMBER(5);
    CURSOR Multa_Condicion IS
        SELECT * FROM PrestamoBiblioteca
        WHERE ID_lector = v_ID_lector;
BEGIN
    FOR C1 IN Multa_Condicion LOOP
        v_DiasRetraso := TRUNC(SYSDATE - C1.fecha_vencimiento)
        IF C1.fecha_vencimiento < SYSDATE THEN
            v_idCompuesto := 'MU'||SQ_id_multa.NEXTVAL;
            INSERT INTO Multa VALUES
            (v_idCompuesto, SYSDATE, v_DiasRetraso, 10, C1.ID_prestamo);
        END IF;
    END LOOP;
END p_IngresarMulta;
/

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

/****************************************************************************************
Programacion de PL/SQL para el Prestamo

    * Crear un procedimiento para insertar prestamos, que segun el tipo de lector se le 
      asigne una fecha de vencimiento y un numero de refrendo

      Lector: Estudiante, Limite de materiales: 3, Dias de prestamo: 8, Refrendos: 1
      Lector: Profesor, Limite de materiales: 5, Dias de prestamo: 15, Refrendos: 2
      Lector: Investigador, Limite de materiales: 10, Dias de prestamo: 30, Refrendos: 3

    * Para el prestamo no tiene que tener multas
    * Modificamos con un trigger automaticamente el estatus del ejemplar a prestado si 
      este libro fue prestado y a disponible si fue entregado
    * El resello de un material se realiza únicamente en la fecha de vencimiento del 
      préstamo en función del tipo de lector.
    * Al realizarse una devolución en tiempo, se eliminará el préstamo.

****************************************************************************************/
-- Secuencia para el ID del prestamo
CREATE SEQUENCE SQ_id_prestamo
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

-- Procedimiento para insertar prestamos
CREATE OR REPLACE PROCEDURE p_InsertarPrestamo
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

    SELECT ID_MATERIAL INTO v_ID_material
    FROM Material
    WHERE ID_lector = v_ID_lector;

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

    v_ID_prestamo := 'PR'||SQ_id_prestamo.NEXTVAL;
    INSERT INTO PrestamoBiblioteca VALUES
    (v_ID_prestamo, v_ID_lector, v_ID_ejemplar, v_ID_material, v_FechaPrestamo, 
    v_FechaEntrega, v_FechaResello, v_FechaVencimiento, v_NumeroRefrendo);
END p_InsertarPrestamo;
/

-- Trigger para modificar el estatus del ejemplar
CREATE OR REPLACE TRIGGER tr_ModificarEstatusEjemplar
AFTER INSERT OR UPDATE
ON PrestamoBiblioteca   
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        UPDATE Ejemplar
        SET estatus = 'Prestado'
        WHERE ID_ejemplar = :NEW.ID_ejemplar;
    ELSIF UPDATING THEN
        UPDATE Ejemplar
        SET estatus = 'Disponible'
        WHERE ID_ejemplar = :NEW.ID_ejemplar;
    END IF;
END tr_ModificarEstatusEjemplar;
/

-- trigger para el resello de un material se realiza únicamente en la fecha 
-- de vencimiento del préstamo en función del tipo de lector.

CREATE OR REPLACE TRIGGER tr_Resello
BEFORE UPDATE  
ON PrestamoBiblioteca
    v_TipoLector Lector.tipo_lector%TYPE;
FOR EACH ROW
BEGIN
    SELECT tipo_lector INTO v_TipoLector
    FROM Lector
    WHERE ID_lector = :OLD.ID_lector;

    IF :OLD.fecha_vencimiento = SYSDATE THEN
        IF v_TipoLector = 'Estudiante' THEN
            UPDATE PrestamoBiblioteca
            SET fecha_resello = SYSDATE + 8
            WHERE ID_prestamo = :OLD.ID_prestamo;
        ELSE IF v_TipoLector = 'Profesor' THEN
            UPDATE PrestamoBiblioteca
            SET fecha_resello = SYSDATE + 15
            WHERE ID_prestamo = :OLD.ID_prestamo;
        ELSE IF v_TipoLector = 'Investigador' THEN
            UPDATE PrestamoBiblioteca
            SET fecha_resello = SYSDATE + 30
            WHERE ID_prestamo = :OLD.ID_prestamo;
        END IF;
    END IF;
END tr_Resello;
/

-- Procedimiento para eliminar el prestamo si se devuelve en tiempo

CREATE OR REPLACE PROCEDURE p_EliminarPrestamo
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
END p_EliminarPrestamo;