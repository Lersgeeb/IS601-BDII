SET SERVEROUTPUT ON;

---------- ALGUNAS EXCEPCIONES ------------

    -- ACCESS_INTO_NULL 
    ---- Se intenta asignar valores a los atributos de un objeto no inicializado

    -- COLLECTION_IS_NULL
    ---- se intenta aplicar métodps predefinidos (exceptuando exists),
    ---- sobre colecciones de Objetos como varrays o tablas de memoria no
    ---- inicializados; o también cuando se intenta asignar valores a los
    ---- elementos de una colección de Objetos que no ha sido inicializada.

    -- CURSOR_ALREADY_OPEN
    ---- Se intenta abrir un cursos que ya está abierto.

    -- DUP_VAL_ON_INDEX
    ---- Se intenta almacenar valores duplicados en una columna de Bbdd que
    ---- tiene una constraint tipo Unique sobre esa columna.

    -- TOO_MANY_ROWS
    ---- Una sentencia SELECT INTO devuelve mas de una fila.

DECLARE
    NOMBRE PRODUCTS.PRODUCT_NAME%TYPE;
    FECHA DATE;
BEGIN
    FECHA := 'HOLA MUNDO'; -- SYSDATE
    SELECT PRODUCT_NAME INTO NOMBRE FROM PRODUCTS; -- WHERE PRODUCT_ID=1

    DBMS_OUTPUT.PUT_LINE('EL NOMBRE DEL PRODUCTO CON ID 1 ES:' || NOMBRE);

    EXCEPTION 
        WHEN TOO_MANY_ROWS THEN 
            DBMS_OUTPUT.PUT_LINE('SE RETORNAN MUCHOS REGISTROS EN LA SETENCIA SELECT INTO. ' || SQLCODE);
            DBMS_OUTPUT.PUT_LINE(SQLERRM);

        WHEN OTHERS THEN
          IF (SQLCODE=-1858) THEN
            DBMS_OUTPUT.PUT_LINE('SE ESTAN ASIGNANDO TIPOS DE DATOS INCOMPATIBLES');
          END IF;
          DBMS_OUTPUT.PUT_LINE('ERROR: ' || SQLERRM);
          
END;
