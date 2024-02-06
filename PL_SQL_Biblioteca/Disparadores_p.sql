-- Trigger por si queremos eliminar usuario con multas
CREATE OR REPLACE TRIGGER tr_Multas_Eliminar_Lector
BEFORE UPDATE OR DELETE
ON Lector
FOR EACH ROW
DECLARE
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
FOR EACH ROW
DECLARE
    v_TipoLector Lector.tipo_lector%TYPE;
BEGIN
    SELECT tipo_lector INTO v_TipoLector
    FROM Lector
    WHERE ID_lector = :OLD.ID_lector;

    IF :OLD.fecha_vencimiento = SYSDATE THEN
        IF v_TipoLector = 'Estudiante' THEN
            UPDATE PrestamoBiblioteca
            SET fecha_resello = SYSDATE + 8
            WHERE ID_prestamo = :OLD.ID_prestamo;
        ELSIF v_TipoLector = 'Profesor' THEN
            UPDATE PrestamoBiblioteca
            SET fecha_resello = SYSDATE + 15
            WHERE ID_prestamo = :OLD.ID_prestamo;
        ELSIF v_TipoLector = 'Investigador' THEN
            UPDATE PrestamoBiblioteca
            SET fecha_resello = SYSDATE + 30
            WHERE ID_prestamo = :OLD.ID_prestamo;
        END IF;
    END IF;
END tr_Resello;
/

