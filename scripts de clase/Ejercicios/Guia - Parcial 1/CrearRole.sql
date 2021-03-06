
CREATE USER BD_DIETAS_GANADERAS IDENTIFIED BY 123
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
QUOTA UNLIMITED ON users;

CREATE ROLE DIETAS_GANADERAS_ROL;

GRANT CREATE SESSION, CREATE ANY TABLE , CREATE ANY PROCEDURE, ALTER ANY TABLE,
ALTER ANY PROCEDURE, DROP ANY TABLE, DROP ANY PROCEDURE TO DIETAS_GANADERAS_ROL;

GRANT CREATE ANY SEQUENCE, DROP ANY SEQUENCE TO DIETAS_GANADERAS_ROL;

GRANT CREATE ANY TRIGGER, 
ALTER ANY TRIGGER, 
DROP ANY TRIGGER 
TO DIETAS_GANADERAS_ROL;

GRANT DIETAS_GANADERAS_ROL TO BD_DIETAS_GANADERAS


---------------------------------
CREATE USER BD_HABITANTES IDENTIFIED BY 123
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
QUOTA UNLIMITED ON users;

CREATE ROLE BD_HABITANTES_ROL;

GRANT CREATE SESSION, CREATE ANY TABLE , CREATE ANY PROCEDURE, ALTER ANY TABLE,
ALTER ANY PROCEDURE, DROP ANY TABLE, DROP ANY PROCEDURE TO BD_HABITANTES_ROL;

GRANT CREATE ANY SEQUENCE, DROP ANY SEQUENCE TO BD_HABITANTES_ROL;

GRANT CREATE ANY TRIGGER, 
ALTER ANY TRIGGER, 
DROP ANY TRIGGER 
TO BD_HABITANTES_ROL;

GRANT BD_HABITANTES_ROL TO BD_HABITANTES

-----------------------------------------
CREATE USER BD_VENTAS IDENTIFIED BY 123
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
QUOTA UNLIMITED ON users;

CREATE ROLE VENTAS_ROL;

GRANT CREATE SESSION, CREATE ANY TABLE , CREATE ANY PROCEDURE, ALTER ANY TABLE,
ALTER ANY PROCEDURE, DROP ANY TABLE, DROP ANY PROCEDURE TO VENTAS_ROL;

GRANT CREATE ANY SEQUENCE, DROP ANY SEQUENCE TO VENTAS_ROL;

GRANT CREATE ANY TRIGGER, 
ALTER ANY TRIGGER, 
DROP ANY TRIGGER 
TO VENTAS_ROL;

GRANT VENTAS_ROL TO BD_VENTAS
-----------------------------------------
CREATE USER BD_EMPRESA_T3 IDENTIFIED BY 123
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
QUOTA UNLIMITED ON users;

CREATE ROLE EMPRESA_T3_ROL;

GRANT CREATE SESSION, CREATE ANY TABLE , CREATE ANY PROCEDURE, ALTER ANY TABLE,
ALTER ANY PROCEDURE, DROP ANY TABLE, DROP ANY PROCEDURE TO EMPRESA_T3_ROL;

GRANT CREATE ANY SEQUENCE, DROP ANY SEQUENCE TO EMPRESA_T3_ROL;

GRANT CREATE ANY TRIGGER, 
ALTER ANY TRIGGER, 
DROP ANY TRIGGER 
TO EMPRESA_T3_ROL;

GRANT EMPRESA_T3_ROL TO BD_EMPRESA_T3
----------------------------


CREATE USER BD_EXAMEN IDENTIFIED BY 123
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
QUOTA UNLIMITED ON users;

CREATE ROLE EXAMEN_ROL;

GRANT CREATE SESSION, CREATE ANY TABLE , CREATE ANY PROCEDURE, ALTER ANY TABLE,
ALTER ANY PROCEDURE, DROP ANY TABLE, DROP ANY PROCEDURE TO EXAMEN_ROL;

GRANT CREATE ANY SEQUENCE, DROP ANY SEQUENCE TO EXAMEN_ROL;

GRANT CREATE ANY TRIGGER, 
ALTER ANY TRIGGER, 
DROP ANY TRIGGER 
TO EXAMEN_ROL;

GRANT EXAMEN_ROL TO BD_EXAMEN
----------------------------

CREATE USER BD_PEDIDOS IDENTIFIED BY 123
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
QUOTA UNLIMITED ON users;

CREATE ROLE PEDIDOS_ROL;

GRANT CREATE SESSION, CREATE ANY TABLE , CREATE ANY PROCEDURE, ALTER ANY TABLE,
ALTER ANY PROCEDURE, DROP ANY TABLE, DROP ANY PROCEDURE TO PEDIDOS_ROL;

GRANT CREATE ANY SEQUENCE, DROP ANY SEQUENCE TO PEDIDOS_ROL;

GRANT CREATE ANY TRIGGER, 
ALTER ANY TRIGGER, 
DROP ANY TRIGGER 
TO PEDIDOS_ROL;

GRANT PEDIDOS_ROL TO BD_PEDIDOS