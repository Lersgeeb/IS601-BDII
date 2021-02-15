-- DROP DE SECUENCIAS
DROP SEQUENCE SQ_REGIONS;
DROP SEQUENCE SQ_COUNTRIES;
DROP SEQUENCE SQ_LOCATIONS;
DROP SEQUENCE SQ_DEPARTMENTS;
DROP SEQUENCE SQ_EMPLOYEES;
DROP SEQUENCE SQ_JOBS;


-- Creación de secuencias para las tablas
CREATE SEQUENCE SQ_REGIONS
START WITH 20
INCREMENT BY 2;

CREATE SEQUENCE SQ_COUNTRIES
START WITH 20
INCREMENT BY 2;

CREATE SEQUENCE SQ_LOCATIONS
START WITH 20
INCREMENT BY 2;

CREATE SEQUENCE SQ_DEPARTMENTS
START WITH 20
INCREMENT BY 2;

CREATE SEQUENCE SQ_EMPLOYEES
START WITH 20
INCREMENT BY 2;

CREATE SEQUENCE SQ_JOBS
START WITH 20
INCREMENT BY 2;

--- PRUEBAS DE INSERTADO

--REGIONS
INSERT INTO REGIONS VALUES (SQ_REGIONS.NEXTVAL ,'AUSTRALIA'); -- ID 20
INSERT INTO REGIONS VALUES (SQ_REGIONS.NEXTVAL ,'SOUTH AMERICA'); -- ID 22

--COUNTRIES
INSERT INTO COUNTRIES VALUES (SQ_COUNTRIES.NEXTVAL, 'BRASIL', 20 );
INSERT INTO COUNTRIES VALUES (SQ_COUNTRIES.NEXTVAL, 'ARGENTINA', 20 );

--LOCATIONS
INSERT INTO LOCATIONS VALUES (SQ_LOCATIONS.NEXTVAL, 'AEF553 AVE', '11011', 'BUENOS AIRES', 'LA PLATA', 22);
INSERT INTO LOCATIONS VALUES (SQ_LOCATIONS.NEXTVAL, 'AEF553 AVE', '10111', 'RIO DE JANEIRO', 'NOVA IGUACU', 20);

--DEPARTMENTS

-- VALOR 20 - VALOR SIGUIENTE 22
SELECT SQ_DEPARTMENTS.NEXTVAL FROM DUAL;  -- SALTAR AL SIGUIENTE VALOR
INSERT INTO DEPARTMENTS VALUES (SQ_DEPARTMENTS.NEXTVAL, 'OPERATIONS', 100 , 20); 
INSERT INTO DEPARTMENTS VALUES (SQ_DEPARTMENTS.NEXTVAL, 'RESEARCH', 101 , 22); 

--JOB
INSERT INTO JOBS VALUES (SQ_JOBS.NEXTVAL, 'DATA ANALYST', 12000 , 20000); 
INSERT INTO JOBS VALUES (SQ_JOBS.NEXTVAL, 'SECURITY', 8000 , 14000); 


--EMPLOYEES
INSERT INTO EMPLOYEES VALUES (SQ_EMPLOYEES.NEXTVAL, 'JOSUE', 'JIMENEZ', 'jimenez.josue@gmail.com', '88218821', SYSDATE , 20, 13000, NULL, 101, 24); 
INSERT INTO EMPLOYEES VALUES (SQ_EMPLOYEES.NEXTVAL, 'ALEJANDRO', 'CRUZ', 'cruz.alejandro@gmail.com', '88117811', SYSDATE,  22, 10000, NULL, 100, 22);  

--ROLLBACK;
--COMMIT;