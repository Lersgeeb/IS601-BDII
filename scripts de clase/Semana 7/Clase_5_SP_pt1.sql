
--- PROCEDIMIENTO ALMACENADO ---
--?     CREATE OR REPLACE PROCEDURE  <NOMBRE PROCEDIMIENTO> (<PARAMETROS>)
--?     IS
--?        <DECLARACION DE VARIABLES>
--?     BEGIN
--?         <iNSTRUCCIONES SQL>
--?     END;

--- DECLARACION DE PARAMETORS ---
--?     <NOMBRE PARAMETRO> [IN|OUT|IN OUT] <TIPO DE DATO>
--?     EJEMPLO
--?     NOMBRE VARCHAR2 

--! POR DEFECTO LOS PARAMETROS SERAN DE TIPO IN
--! UN PARAMETRO IN NO PUEDE ALTERARSE DENTRO DEL BLOQUE DEL PROCEDIMIENTO 
--! UN PARAMETRO OUT PUEDE ALTERARSE DENTRO DEL BLOQUE DEL PROCEDIMIENTO 

--- CREACION DE PROCEDIMIENTO ALMACENADO ---
CREATE OR REPLACE PROCEDURE SP_OBTENER_NOMB_CAT ( IDCAT IN NUMBER )
IS
    NOMBRE_CAT CATEGORIES.CATEGORY_NAME%TYPE; 
BEGIN
    SELECT CATEGORIES.CATEGORY_NAME 
    INTO NOMBRE_CAT 
    FROM CATEGORIES 
    WHERE CATEGORY_ID = IDCAT;

    DBMS_OUTPUT.PUT_LINE('EL NOMBRE DE LA CATEGORIA ES:' || NOMBRE_CAT);
END;

--- EJECUTAR PROCEDIMIENTO ---
EXECUTE SP_OBTENER_NOMB_CAT(2);

BEGIN
    SP_OBTENER_NOMB_CAT(2);
END;

--- CREACION DE PROCEDIMIENTO ALMACENADO CON RETURN ---
CREATE OR REPLACE PROCEDURE SP_OBTENER_NOMB_CAT ( 
    IDCAT IN NUMBER, 
    NOMBRE_CAT OUT CATEGORIES.CATEGORY_NAME%TYPE 
)
IS
BEGIN
    SELECT CATEGORIES.CATEGORY_NAME 
    INTO NOMBRE_CAT 
    FROM CATEGORIES 
    WHERE CATEGORY_ID = IDCAT;
END;

--- EJECUTAR PROCEDIMIENTO CON RETURN ---

DECLARE 
    NOMBRE_CATEGORIA CATEGORIES.CATEGORY_NAME%TYPE;
BEGIN
    SP_OBTENER_NOMB_CAT(2, NOMBRE_CATEGORIA);
    DBMS_OUTPUT.PUT_LINE('EL NOMBRE DE LA CATEGORIA ES:' || NOMBRE_CATEGORIA);
END;


