SET SERVEROUTPUT ON;

----- CREACION DE TRIGGER  -----

-- TRIGGER INSERT
CREATE OR REPLACE TRIGGER TG_INSERTA_BRANDS
BEFORE INSERT ON BRANDS
FOR EACH ROW 
DECLARE
BEGIN
    :NEW.BRAND_NAME := TRIM(UPPER(:NEW.BRAND_NAME) );
END;

-- TRIGER UPDATE
CREATE OR REPLACE TRIGGER TG_UPDATE_BRANDS
BEFORE UPDATE ON BRANDS
FOR EACH ROW 
DECLARE
BEGIN
    :NEW.BRAND_NAME := TRIM(UPPER(:NEW.BRAND_NAME) );
END;

-- PRUEBA
DECLARE
BEGIN 
    INSERT INTO BRANDS VALUES (15, '  Alpina  ');
    COMMIT;

    UPDATE BRANDS SET BRAND_NAME=' tn bike   ' WHERE BRAND_ID=13;
    COMMIT;
END;