SET SERVEROUTPUT ON;

-- DROPS
DROP TABLE REGISTRO_LOGS;
DROP SEQUENCE SQ_REGITRO_LOGS;
DROP TRIGGER TG_REGISTRO_LOG_PK;


-- CREAT TABLA DE REGISTRO
CREATE TABLE REGISTRO_LOGS(
    ID_LOG NUMBER PRIMARY KEY,
    FECHA_LOG TIMESTAMP,
    DESCRIPCION_LOG VARCHAR2(200),
    USUARIO VARCHAR2(50),
    TIPO_OPERACION VARCHAR2(50),
    TABLA_AFECTADA  VARCHAR2(200)
);
/

-- CREAR SECUENCIA PARA LA LLAVE PRIMARIA DE LA TABLA DE REGISTRO
CREATE SEQUENCE SQ_REGITRO_LOGS
START WITH 1
INCREMENT BY 3;

-- TRIGGER QUE ASIGNA LA LLAVE PRIMARIA UNICA A CADA FILA DEL REGISTRO
CREATE OR REPLACE TRIGGER TG_REGISTRO_LOG_PK
BEFORE INSERT ON REGISTRO_LOGS
FOR EACH ROW
BEGIN
    :NEW.ID_LOG := SQ_REGITRO_LOGS.NEXTVAL;
END;
/