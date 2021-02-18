SET SERVEROUTPUT ON;

DECLARE
BEGIN
    
    INSERT INTO TRASLADO_EMPRESATRANSPORTISTA 
    VALUES (
        'C-34534522-R', 
        1.01, 
        '10-JAN-90', 
        'DESTINO-N02', 
        'A-98985367-V', 
        'Carretera', 
        90, 
        95000
    );
    
    INSERT INTO TRASLADO_EMPRESATRANSPORTISTA 
    VALUES (
        'R-12356711-Q', 
        3.06, 
        '21-JAN-95', 
        'DESTINO-N12', 
        'A-98985367-V', 
        'Carretera', 
        90, 
        95000
    );
    
    INSERT INTO TRASLADO_EMPRESATRANSPORTISTA 
    VALUES (
        'C-34534522-R', 
        1.03, 
        '25-JUL-97', 
        'DESTINO-N04', 
        'A-98985367-V', 
        'Carretera', 
        90, 
        95000
    );
    
    COMMIT;
    
    EXCEPTION 
      WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Valor duplicado de la llave primaria');
        DBMS_OUTPUT.PUT_LINE('ERROR: ' || SQLERRM);
      WHEN OTHERS THEN
        IF (SQLCODE=-2291) THEN
          DBMS_OUTPUT.PUT_LINE('valor incorrecto de llave foránea');
        END IF;
        IF (SQLCODE=-1438) THEN
          DBMS_OUTPUT.PUT_LINE('se ha adisgando un valor mayor a la precisión indicada en la estructura de la tabla para un campo numérico');
        END IF;
                  
        DBMS_OUTPUT.PUT_LINE('ERROR: ' || SQLERRM);
  
END;