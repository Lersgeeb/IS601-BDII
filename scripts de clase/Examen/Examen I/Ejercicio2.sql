SET SERVEROUTPUT ON;

DECLARE
  -- concatenado de cadenas
  -- eliminar enunciados inecesarios 'NOMBRE'
  CURSOR datosCliente IS SELECT CUSTOMER_ID, CUST_FIRST_NAME || ' ' || CUST_LAST_NAME , CUST_STREET_ADDRESS2 
  FROM DEMO_CUSTOMERS WHERE CUST_STREET_ADDRESS2 IS NULL;
  
  -- cambiar el orden de la estructura del record
  TYPE registro IS RECORD(
    CUST_ID DEMO_CUSTOMERS.CUSTOMER_ID%TYPE,  
    CUST_NAME VARCHAR2(45),
    CUST_ADDRESS2 DEMO_CUSTOMERS.CUST_STREET_ADDRESS2%TYPE
  );  
  
  datos_registro registro;
BEGIN
  OPEN datosCliente;
  
  -- Cambiar loop
  LOOP    
    FETCH datosCliente INTO datos_registro;
    --Agregar condicion de salida
    EXIT WHEN datosCliente%NOTFOUND;
    
    DBMS_OUTPUT.PUT_LINE('EL ID DE CLIENTE ES: '||datos_registro.CUST_ID);
    DBMS_OUTPUT.PUT_LINE('EL NOMBRE DEL CLIENTE ES: '||datos_registro.CUST_NAME);
    IF (datos_registro.CUST_ADDRESS2 IS NULL) THEN
      DBMS_OUTPUT.PUT_LINE('LA DIRECCION 2 DEL CLIENTE NO HA SIDO REGISTRADA');
    ELSE
      DBMS_OUTPUT.PUT_LINE('LA DIRECCION 2 DEL CLIENTE ES: '||datos_registro.CUST_ADDRESS2);
    END IF;
    DBMS_OUTPUT.PUT_LINE(CHR(13)); --CAMBIO DE LINEA

  END LOOP;
  
  CLOSE datosCliente;
END;