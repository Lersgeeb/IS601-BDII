
--- SINTAXIX PAQUETES ---
--?     CREATE OR REPLACE PACKAGE <NOMBRE DEL PAQUETE>
--?     IS
--?         <CREAR VARIABLES>
--?         <INDICAR EL ENCABEZADO DE LAS FUNCIONES>
--?         <INDICAR EL ENCABEZADO DE LOS PROCEDIMIENTOS>
--?     END;
--?     
--?     CREATE OR REPLACE PACKAGE BODY <NOMBRE DEL PAQUETE>
--?     IS
--?         <CUERPO DE LAS FUNCIONES>
--?         <CUERPO DE LOS PROCEDIMIENTOS>
--?     END;

CREATE OR REPLACE PACKAGE PK_INF_VENTA_BICICLETAS
IS
    NOMBRE VARCHAR2(500);
    FUNCTION FN_NOMBRE_TIENDA(ID_TIENDA STORES.STORE_ID%TYPE) RETURN VARCHAR2;
    PROCEDURE SP_INSERTA_BRAND (NOMBRE_MARCA BRANDS.BRAND_NAME%TYPE);
END;


CREATE OR REPLACE PACKAGE BODY PK_INF_VENTA_BICICLETAS
IS
    
    FUNCTION FN_NOMBRE_TIENDA(ID_TIENDA STORES.STORE_ID%TYPE) 
    RETURN VARCHAR2
    IS
        NOMBRE_TIENDA STORES.STORE_NAME%TYPE;
    BEGIN 
      SELECT STORE_NAME 
      INTO NOMBRE_TIENDA 
      FROM STORES 
      WHERE STORE_ID = ID_TIENDA;
      
      NOMBRE := NOMBRE_TIENDA;
      
      RETURN NOMBRE;
    END;


    PROCEDURE SP_INSERTA_BRAND (NOMBRE_MARCA BRANDS.BRAND_NAME%TYPE)
    IS
    BEGIN
        INSERT INTO BRANDS (BRAND_NAME) VALUES (NOMBRE_MARCA);
        COMMIT;
    END;

END;


DECLARE
    NOMBRE VARCHAR2(500);
BEGIN
    NOMBRE:= PK_INF_VENTA_BICICLETAS.FN_NOMBRE_TIENDA(2);
    DBMS_OUTPUT.PUT_LINE('EL NOMBRE DE LA TIENDA 2 ES: ' || NOMBRE );

    PK_INF_VENTA_BICICLETAS.SP_INSERTA_BRAND('NIKE');
END;