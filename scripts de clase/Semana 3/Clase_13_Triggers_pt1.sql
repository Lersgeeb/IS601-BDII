--- CREAR PERMISOS PARA CREAR TRIGGERS ---

--CONECTARSE CON EL USUARIO SYSTEM
GRANT CREATE ANY TRIGGER, 
ALTER ANY TRIGGER, 
DROP ANY TRIGGER 
TO ADMINISTRADORES;


------------------- BD_BICICLETAS -------------------------
SET SERVEROUTPUT ON;

--CREACION DE TRIGGER
CREATE OR REPLACE TRIGGER TG_SQ_TABLA_CATEGORIAS
BEFORE INSERT ON CATEGORIES
FOR EACH ROW 
DECLARE
BEGIN
    :NEW.CATEGORY_ID := SQ_TABLA_CATEGORIAS.NEXTVAL;

END;


-- PRUEBA INSERT
DECLARE
BEGIN
    INSERT INTO CATEGORIES (CATEGORY_NAME) VALUES ('BICICLETAS HIBRIDAS');
    COMMIT;

    INSERT INTO CATEGORIES (CATEGORY_NAME) VALUES ('BICICLETAS PLEGABLES');
    COMMIT;
    
END;
