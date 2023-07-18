/*
    ���� ������ �غ�
    HR ������ EMPLOYEES ���̺��� GD �������� �����ؼ� ���
*/
DROP TABLE EMPLOYEES;

-- ���̺� HR EMPLOYEES �����ؼ� GD �������� ��������
CREATE TABLE EMPLOYEES AS (
    SELECT *
      FROM HR.EMPLOYEES
);
-- �⺻Ű/�ܷ�Ű ���������� ���簡 ���� �ʴ´�.
ALTER TABLE EMPLOYEES ADD CONSTRAINT PK_EMP PRIMARY KEY(EMPLOYEE_ID);


/*
    PL/SQL
    1. ����Ŭ �����̴�.
    2. ���α׷����� ������ SQL�� �ۼ� ����̴�.
    3. ���ν���, ����� �Լ� ���� ����� �Ǵ� ����̴�.
    4. �׻� ����� ��� �����Ѵ�.
    5. ���� ������ ���� [ ] ������ ��������
         [DECLARE ���� ����]
         BEGIN
             ���๮
         END;
*/

/*
    ���� �����ϱ�
    1. ���� ������ �� ���� ������(:=)�� ����Ѵ�.
    2. Ÿ���� �����ϴ� ���
        1) ��Į�� ���� : Ÿ���� ���� �����Ѵ�.
        2) ���� ����   : Ư�� Į���� Ÿ���� �״�� ����Ѵ�.
*/

/*
    ���� �޽��� ����ϱ�
    1. �⺻������ ���� �޽����� ��µ��� �ʴ´�.
    2. ���� �޽��� ����� ���ؼ� ���� 1ȸ �Ʒ� �������� �����Ѵ�.
        SET SERVEROUTPUT ON;
    3. ����ϴ� ���
        DBMS_OUTPUT.PUT_LINE(����ҳ���);
*/

-- ���� �޽��� ��� ON    
SET SERVEROUTPUT ON;

-- Hello World ����ϱ�
BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello World');
END;


-- 1. ��Į�� ����(���� Ÿ���� ����ϴ� ���)
DECLARE
    NAME VARCHAR2(20 BYTE);
    AGE  NUMBER(3);
BEGIN
    NAME := 'tom';
    AGE  := 30;
    DBMS_OUTPUT.PUT_LINE('�̸��� ' || NAME || ' �Դϴ�.');
    DBMS_OUTPUT.PUT_LINE('���̴� ' || AGE || ' ���Դϴ�.');
END;



-- 2. ���� ����(Ư�� Į���� Ÿ���� ���)
DECLARE
     EMPLOYEEID EMPLOYEES.EMPLOYEE_ID%TYPE;
     FIRSTNAME  EMPLOYEES.FIRST_NAME%TYPE;
     LASTNAME   EMPLOYEES.LAST_NAME%TYPE;
BEGIN
    SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME
      INTO EMPLOYEEID, FIRSTNAME, LASTNAME
      FROM EMPLOYEES
     WHERE EMPLOYEE_ID = 100;
    DBMS_OUTPUT.PUT_LINE(EMPLOYEEID || ',' || FIRSTNAME || ',' || LASTNAME);
END;


/*
    IF ����
    
    IF ���ǽ�1 THEN
        ���๮1
    ELSIF ���ǽ�2 THEN
        ���๮2
    ...
    ELSE
        ���๮N
    END IF;
*/

-- 1. ��Į�� ������ �̿��� IF�� ó���ϱ�
DECLARE
    SCORE NUMBER(3);
    GRADE VARCHAR2(1 BYTE);
BEGIN
    SCORE := 100;  --������ ���� ����
    IF  SCORE >=90 THEN
        GRADE := 'A';
    ELSIF SCORE >80 THEN
        GRADE := 'B';
    ELSIF SCORE >=70 THEN
        GRADE := 'C';
    ELSIF SCORE >= 60 THEN
        GRADE := 'D';
    ELSE
        GRADE := 'F';
    END IF;
    DBMS_OUTPUT.PUT_LINE (SCORE || '����' || GRADE || '�����Դϴ�.');
END;

-- 2. ���� ������ �̿��� IF�� ó��
DECLARE
    EMPLOYEEID EMPLOYEES.EMPLOYEE_ID%TYPE;
    SAL        EMPLOYEES.SALARY%TYPE;
BEGIN
    EMPLOYEEID := 150;  --������ �����ȣ ����
    SELECT SALARY
      INTO SAL
      FROM EMPLOYEES
     WHERE EMPLOYEE_ID = EMPLOYEEID;
    IF SAL >= 10000 THEN
        DBMS_OUTPUT.PUT_LINE('��׿���');
    ELSE
        DBMS_OUTPUT.PUT_LINE('���뿬��');
    END IF;
END;

/*
    IF ���� ��ü �������� ����
    CASE ����
    
    CASE
        WHEN ���ǽ�1 THEN
            ���๮1
        WHEN ���ǽ�2 THEN
            ���๮2
        ...
        ELSE
            ���๮N
    END CASE;
*/

-- 1) ������ ���� ���� ����� PHONE_NUMBER�� ���� ������ ���
-- 011 : MOBILE
-- 515 : EAST
-- 590 : WEST
-- 603 : SOUTH
-- 650 : NORTH
DECLARE
    PHONENUMBER EMPLOYEES.PHONE_NUMBER%TYPE;
    MESSAGE     VARCHAR2(6 BYTE);
BEGIN
    SELECT SUBSTR(PHONE_NUMBER, 1, 3)
      INTO PHONENUMBER
      FROM EMPLOYEES
    WHERE SALARY = (SELECT MAX(SALARY)
                      FROM  EMPLOYEES);
    CASE
        WHEN PHONENUMBER = '011' THEN
            MESSAGE := 'MOBILE';
        WHEN PHONENUMBER = '515' THEN
            MESSAGE := 'EAST';
        WHEN PHONENUMBER = '590' THEN
            MESSAGE := 'WEST';
        WHEN PHONENUMBER = '603' THEN
            MESSAGE := 'SOUTH';
        WHEN PHONENUMBER = '650' THEN
            MESSAGE := 'NORTH';
        END CASE;
        DBMS_OUTPUT.PUT_LINE(MESSAGE);
END;

/*
    WHILE ����
    
    WHILE ���ǽ� LOOP
        ���๮
    END LOOP;
*/

-- 1) 1 ~ 5 ����ϱ�
DECLARE
    N NUMBER(1);
BEGIN
    N := 1;
    WHILE N  <= 5 LOOP
        DBMS_OUTPUT.PUT_LINE(N);
        N := N + 1;
    END LOOP;
END;


-- 2. �����ȣ�� 100~109 ������ �����ȣ, ����� ����ϱ�
DECLARE
    EMPLOYEEID EMPLOYEES.EMPLOYEE_ID%TYPE;
    FIRSTNAME  EMPLOYEES.FIRST_NAME%TYPE;
    LASTNAME   EMPLOYEES.LAST_NAME%TYPE;
BEGIN 
    EMPLOYEEID := 100;
    WHILE EMPLOYEEID  <= 109 LOOP
        SELECT FIRST_NAME, LAST_NAME
          INTO FIRSTNAME, LASTNAME
          FROM EMPLOYEES
         WHERE EMPLOYEE_ID = EMPLOYEEID;
        DBMS_OUTPUT.PUT_LINE(FIRSTNAME || ' ' || LASTNAME);
        EMPLOYEEID := EMPLOYEEID  + 1;
    END LOOP;
END;

/*
    FOR ����
    
    FOR  ���� IN ���۰�..���ᰪ LOOP
        ���๮
    END LOOP;
*/

-- 1) 1~5 ����ϱ�
DECLARE
    N NUMBER(1);
BEGIN
    FOR N IN 1..5 LOOP
        DBMS_OUTPUT.PUT_LINE(N);
    END LOOP;
END;

/*
    EXIT : �ݺ���(WHILE, FOR) �����ϱ�
    CONTINUE : �ݺ����� ���ۺ��� �ٽ� �����ϱ�
    
*/

-- 1. 1���� �����ϱ� . ���� ����� 100�� �Ѿ�� �׸� �����ϰ� ����ϱ�
DECLARE
    N NUMBER;
    TOTAL NUMBER;
BEGIN
    N := 1;
    TOTAL := 0;
    -- ���ѷ���(������ ���� �� EXIT�� ������)
    WHILE TRUE LOOP
        IF TOTAL > 100 THEN
            EXIT;
        END IF;
        TOTAL := TOTAL + N;
        N := N + 1;
    END LOOP;
    -- ��� Ȯ��
    DBMS_OUTPUT.PUT_LINE(N || ', ' || TOTAL);
END;


-- 2) 1���� �����ϱ�, 3�� ����� �����ϰ� �����ϱ�. ��������� 100���Ѿ�� �׸� �����ϰ� ��� ����ϱ�
DECLARE
    N NUMBER;
    TOTAL NUMBER;
    MODULAR NUMBER;
BEGIN
    -- �ʱ갪
    N := 0;
    TOTAL := 0;
    MODULAR := 0;
    -- ���ѷ���
    WHILE TRUE LOOP
        -- N�� ����
        N := N+1;
        -- ���� ����� 100�� �Ѿ�� �׸� �����ϱ�
        IF TOTAL > 100 THEN
        EXIT;
        END IF;
        -- 3�� ����� �������� �����ϱ�
        SELECT MOD(N, 3) INTO MODULAR   -- 3���� ���� �������� MODULAR ������ ����
          FROM DUAL;
        IF MODULAR = 0 THEN 
            CONTINUE;   -- WHILE TRUE LOOP���� ù ���๮���� �ǵ��ư��� �����Ͻÿ�. (N := N+1;)���� �̵�
        END IF;
        -- ����
        TOTAL := TOTAL +N;
    END LOOP;
    -- ��� Ȯ��
     DBMS_OUTPUT.PUT_LINE(N || ', ' || TOTAL);
END;

/*
    ����ó�� ����
    
    EXCEPTION
        WHEN ��������1 THEN
            ����ó��1
        WHEN ��������2 THEN
            ����ó��2
        ...
        WHEN OTHERS THEN
            ����ó��N
*/

-- 1. �����͸� ã�� ���ϴ� ����� ���� : NO_DATA_FOUND
DECLARE
    EMPLOYEEID EMPLOYEES.EMPLOYEE_ID%TYPE;
    FIRSTNAME  EMPLOYEES.FIRST_NAME%TYPE;
BEGIN
    EMPLOYEEID := 0;
    SELECT FIRST_NAME INTO FIRSTNAME
      FROM EMPLOYEES
     WHERE EMPLOYEE_ID = EMPLOYEEID;   
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE(EMPLOYEEID || '����� �����ϴ�.');
END;

-- 2.�����Ͱ� �ʹ� ���� ��� : TOO_MANY_ROWS
DECLARE
    FIRSTNAME EMPLOYEES.FIRST_NAME%TYPE;
BEGIN
    SELECT FIRST_NAME INTO FIRSTNAME
      FROM EMPLOYEES
     WHERE EMPLOYEE_ID BETWEEN 100 AND 206;
EXCEPTION
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('����� �ʹ� ����.');
END;

-- 3. ��� ���ܸ� ó���ϴ� ��� : OTHERS
DECLARE
    FIRSTNAME EMPLOYEES.FIRST_NAME%TYPE;
BEGIN
    SELECT FIRST_NAME INTO FIRSTNAME
      FROM EMPLOYEES
     WHERE EMPLOYEE_ID BETWEEN 100 AND 206;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLCODE); -- �����ڵ�
        DBMS_OUTPUT.PUT_LINE(SQLERRM); -- ���ܸ޽���
END;


    

