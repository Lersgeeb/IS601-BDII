-- TRIGGER QUE CREA UN REGISTRO POR CADA OPERACION A LA TABLA CATEGORIAS
CREATE OR REPLACE TRIGGER TG_CATEGORIAS
AFTER INSERT OR UPDATE OR DELETE ON CATEGORIES
FOR EACH ROW
DECLARE
    PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
    IF (INSERTING) THEN 
        INSERT INTO BITACORAS VALUES (SQ_BITACORAS.NEXTVAL, 'SE REALIZO UN INSERT EN LA TABLA CATEGORIAS Y EL DATO NUEVO EN EL ID ES: ' ||
        :NEW.CATEGORY_ID || 'Y EL NOMBRE DE LA CATEGORIA ES: ' || :NEW.CATEGORY_NAME, 
        SYSTIMESTAMP, USER, 'OPERACION INSERT');
    END IF;

     IF (UPDATING) THEN 
        INSERT INTO BITACORAS VALUES (SQ_BITACORAS.NEXTVAL, 'SE REALIZO UN UPDATE EN LA TABLA CATEGORIAS, EL NOMBRE ANTERIOR DE LA CATEGORIA ES: ' 
        || :OLD.CATEGORY_NAME || 'Y EL NOMBRE NUEVO DE LA CATEGORIA ES: ' || :NEW.CATEGORY_NAME, SYSTIMESTAMP, USER, 'OPERACION UPDATE');
    END IF;

    IF (DELETING) THEN
         INSERT INTO BITACORAS VALUES (SQ_BITACORAS.NEXTVAL, 'SE REALIZO UN DELETE EN LA TABLA CATEGORIAS, EL DATO ELIMINADO EN EL ID ES: ' 
        || :OLD.CATEGORY_ID || 'Y EL NOMBRE DE LA CATEGORIA ERA: ' || :OLD.CATEGORY_NAME, SYSTIMESTAMP, USER, 'OPERACION UPDATE');
    END IF;

    COMMIT;
    EXCEPTION 
        WHEN OTHERS THEN
            ROLLBACK;

END;

-- PRUEBA
BEGIN
    INSERT INTO CATEGORIES (CATEGORY_NAME) VALUES ('BMX');
    COMMIT;

    UPDATE CATEGORIES SET CATEGORY_NAME = 'BICICLETAS HOLANDESA' WHERE CATEGORY_NAME='BMX';
    COMMIT;

    DELETE FROM CATEGORIES WHERE CATEGORY_NAME = 'BICICLETAS HOLANDESA';
    COMMIT;

END;