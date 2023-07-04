/*
    DML
    1. Data Manipulation Language
    2. ������(��,Row)�� ����(����, ����, ����)�ϴ� ����̴�.
    3.Ʈ����� ����̴�.(�۾��� �Ϸ�Ǹ� COMMIT, �۾��� ����ҷ��� ROOLLBACK �ʿ��ϴ�.)
        1)COMMIT   : �۾��� �����Ѵ�. COMMIT�� �Ϸ�� �۾��� ROLLBACK���� ����� �� ����.
        2)ROLLBACK : �۾��� ����Ѵ�. COMMIT ���� �۾��� ����Ѵ�.
    4. ����
        1) ���� : INSERT INTO VALUES
        2) ���� : UPDATE SET WHERE
        3) ���� : DELETE FROM WHERE
*/

--����.
-- �ڰ��������� DML�� ���ָ� INSERT, UPDATE, DELETE + SELECT�� ���⵵ �Ѵ�.
-- ���̺� ����
DROP TABLE EMPLOYEE_T;
DROP TABLE DEPARTMENT_T;

-- DEPARTMENT_T ���̺� ����
CREATE TABLE DEPARTMENT_T (
    DEPT_NO   NUMBER            NOT NULL,
    DEPT_NAME VARCHAR2(15 BYTE) NOT NULL,
    LOCATION  VARCHAR2(15 BYTE) NOT NULL,
    CONSTRAINT PK_DEPART PRIMARY KEY(DEPT_NO)
);

-- EMPLOYEE_T ���̺� ����
CREATE TABLE EMPLOYEE_T (
    EMP_NO    NUMBER           NOT NULL,
   NAME      VARCHAR2(20 BYTE) NOT NULL,
   DEPART    NUMBER            NULL,
   POSITION  VARCHAR2(20 BYTE) NULL,
   GENDER    CHAR(2 BYTE)      NULL,
   HIRE_DATE DATE              NULL,
   SALARY    NUMBER            NULL,
   CONSTRAINT PK_EMPLOYEE PRIMARY KEY(EMP_NO),
   CONSTRAINT FK_DEPART_EMP FOREIGN KEY(DEPART) REFERENCES DEPARTMENT_T(DEPT_NO) ON DELETE SET NULL
);

-- �μ���ȣ�� �����ϴ� ������ �����
/*
CREATE SEQUENCE DEPT_SEQ
    INCREMENT BY 1  -- 1�� �����ϴ� ��ȣ�� �����.(����Ʈ)
    START WITH 1    -- 1���� ��ȣ�� �����.(����Ʈ)
    NOMAXVALUE      -- ��ȣ�� ���Ѽ��� ����.(����Ʈ)
    NOMINVALUE      -- ��ȣ�� ���Ѽ��� ����.(����Ʈ)
    NOCYCLE         -- ��ȣ ��ȯ�� ����.(����Ʈ)
    CACHE 20        -- 20���� ��ȣ�� �̸� ����� �д�.(����Ʈ)
    NOORDER         -- ��ȣ�� ������� ������� �ʴ´�.(����Ʈ) - ��ȣ�� ������� ����ϴ� ORDER �ɼ����� �ٲ㼭 �������� �����Ѵ�.
;
*/
DROP SEQUENCE DEPT_SEQ;
CREATE SEQUENCE DEPT_SEQ ORDER;

INSERT INTO DEPARTMENT_T(DEPT_NO, DEPT_NAME, LOCATION) VALUES(DEPT_SEQ.NEXTVAL, '������', '�뱸');
INSERT INTO DEPARTMENT_T(DEPT_NO, DEPT_NAME, LOCATION) VALUES(DEPT_SEQ.NEXTVAL, '�λ��', '����');
INSERT INTO DEPARTMENT_T(DEPT_NO, DEPT_NAME, LOCATION) VALUES(DEPT_SEQ.NEXTVAL, '�ѹ���', '�뱸');
INSERT INTO DEPARTMENT_T(DEPT_NO, DEPT_NAME, LOCATION) VALUES(DEPT_SEQ.NEXTVAL, '��ȹ��', '����');

COMMIT;

DROP SEQUENCE  EMP_SEQ;
CREATE SEQUENCE EMP_SEQ 
    START WITH 1001
    ORDER;

--��� ������ �Է�
INSERT INTO EMPLOYEE_T (EMP_NO, NAME, DEPART, POSITION, GENDER, HIRE_DATE, SALARY) VALUES(EMP_SEQ.NEXTVAL,'��â��',1,'����','M','95/05/01', '5000000');
INSERT INTO EMPLOYEE_T (EMP_NO, NAME, DEPART, POSITION, GENDER, HIRE_DATE, SALARY) VALUES(EMP_SEQ.NEXTVAL,'��μ�',2,'���','M','17/09/01', '2500000');
INSERT INTO EMPLOYEE_T (EMP_NO, NAME, DEPART, POSITION, GENDER, HIRE_DATE, SALARY) VALUES(EMP_SEQ.NEXTVAL,'������',3,'����','F','90/09/01', '5500000');
INSERT INTO EMPLOYEE_T (EMP_NO, NAME, DEPART, POSITION, GENDER, HIRE_DATE, SALARY) VALUES(EMP_SEQ.NEXTVAL,'�Ѽ���',4,'����','M','93/04/01', '5000000');

COMMIT;

ROLLBACK;

-- ����
/*
    UPDATE ���̺�
    SET ������Ʈ�� ����, ������Ʈ�� ����
    WHERE ���ǽ�
*/

-- 1. �μ���ȣ�� 3�� �μ��� ������  '��õ'���� �����Ͻÿ�.

UPDATE DEPARTMENT_T
   SET LOCATION = '��õ'--SET���� ��ȣ(=)�� ���Կ�����
 WHERE DEPT_NO = 3;   --WHERE���� ��ȣ(=)�� ����񱳿�����

ROLLBACK;

-- 2. �μ���ȣ�� 2�� �μ��� �ٹ��ϴ� ��� ������� ������ 500000 ������Ű�ÿ�
UPDATE EMPLOYEE_T
   SET SALARY = SALARY+500000
 WHERE DEPART = 2;  

-- ����
/*
    DELETE
      FROM ���̺�
     WHERE ���ǽ�
*/

--1. ������ '��õ'�� �μ��� �����Ͻÿ�. ('��õ' �ٹ��ϴ� ����� ����.)
    
DELETE
  FROM DEPARTMENT_T
 WHERE LOCATION ='��õ';

--2. ������ '����'�� �μ��� �����Ͻÿ�. ('����' �ٹ��ϴ� ����� �ִ�. ->ON DELETE SET NULL �ɼǿ� ���ؼ� �μ� ������ NULL ������ ó���ȴ�.)
DELETE
  FROM DEPARTMENT_T
 WHERE LOCATION = '����';

