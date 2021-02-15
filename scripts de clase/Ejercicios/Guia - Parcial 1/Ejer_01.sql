
--------- EJERCICIO 1 -----------

--- Crear una secuencia para la tabla DESTINO, cuyo valor de inicio debe ser 17 y se debe
--- incrementar en una unidad, es necesario definir que la secuencia tendrá un valor mínimo
--- de 17 y un valor máximo de 999. Luego crear un trigger que se debe ejecutar antes de un
--- INSERT en la tabla DESTINO y la acción a realizar debe ser asignar el valor “DESTINON<
--- valor de la secuencia>” a la llave primaria de la tabla, donde <valor de la secuencia> se
--- debe sustituir por el siguiente valor de la secuencia, ejemplo: DESTINO-N17.

DROP SEQUENCE sq_ejer_01;
CREATE SEQUENCE sq_ejer_01
START WITH 17
INCREMENT BY 1
MAXVALUE 999
MINVALUE 17;

DROP TRIGGER tg_insert_destino;
CREATE OR REPLACE TRIGGER tg_insert_destino
    BEFORE INSERT 
        ON BD_RESIDUOS_TOX.DESTINO
        FOR EACH ROW
    BEGIN
        :NEW.COD_DESTINO := CONCAT('DESTINO-N', sq_ejer_01.nextval);
    END;


---- INSERT -----
INSERT INTO BD_RESIDUOS_TOX.DESTINO 
  (NOMBRE_DESTINO, CIUDAD_DESTINO, DESC_DESTINO)
VALUES 
  ('Desechorg', 'Tegucigalpa', 'Cerca del Estadio')
;