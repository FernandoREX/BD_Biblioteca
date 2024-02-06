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
-- Secuencia para el ID de la multa
CREATE SEQUENCE SQ_id_multa
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

-- Funcion para calcular si tiene multas
CREATE OR REPLACE FUNCTION f_TieneMultas
(
    v_ID_lector IN Lector.ID_lector%TYPE
)
RETURN BOOLEAN
IS
    v_NoMultas NUMBER := 0;
BEGIN
    SELECT COUNT(*) INTO v_NoMultas 
    FROM MULTA
    JOIN PrestamoBiblioteca ON MULTA.ID_prestamo = PrestamoBiblioteca.ID_prestamo
    WHERE PrestamoBiblioteca.ID_lector = v_ID_lector;

    RETURN v_NoMultas > 0;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN FALSE;
END f_TieneMultas;
/

