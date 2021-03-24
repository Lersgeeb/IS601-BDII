CREATE OR REPLACE FUNCTION FN_INF_MAX_SALARY
RETURN SYS_REFCURSOR
IS
    CDATOS SYS_REFCURSOR;
    MAX_SALARY NUMBER(8,2);
BEGIN
    SELECT MAX(SALARY) INTO MAX_SALARY FROM EMPLOYEES;

    OPEN CDATOS FOR 
    SELECT 
        FIRST_NAME || ' ' || LAST_NAME, 
        EMPLOYEE_ID, 
        SALARY, 
        DEPARTMENT_ID 
    FROM EMPLOYEES 
    WHERE SALARY = MAX_SALARY;

    RETURN CDATOS;
END;
/