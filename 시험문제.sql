-- ���� ������ �а� �־��� ������ �ذ��Ͻÿ�.

DROP TABLE CUST_T;
DROP TABLE BANK_T;
-- 1. ���� ���û��׿� ���� BANK_T ���̺�� CUST_T ���̺��� �����Ͻÿ�.(30��)
--    1) BANK_T ���̺�
--        (1) BANK_CODE : �����ڵ�, �������̹��ڿ� �ִ� 20����Ʈ, �ʼ�, �⺻Ű(PK_BANK)
--        (2) BANK_NAME : �����̸�, �������̹��ڿ� �ִ� 30����Ʈ
--        (3) BANK_TEL  : ��ȭ��ȣ, �������̹��ڿ� �ִ� 30����Ʈ

CREATE TABLE BANK_T(
        BANK_CODE VARCHAR2(20 BYTE) NOT NULL ,
        BANK_NAME VARCHAR2(30 BYTE) NULL,
        BANK_TEL  VARCHAR2(30 BYTE) NULL,
        CONSTRAINT PK_BANK PRIMARY KEY(BANK_CODE) 
);

--    2) CUST_T ���̺�
--        (1) CUST_NO   : ����ȣ, ����, �ʼ�, �⺻Ű(PK_CUST)
--        (2) CUST_NAME : ����, �������̹��ڿ� �ִ� 30����Ʈ, �ʼ�
--        (3) CUST_TEL  : ����ó, �������̹��ڿ� �ִ� 30����Ʈ, �ߺ� ����
--        (4) CUST_BORN : ����, ��¥
--        (5) BANK_CODE : �����ڵ�, �������̹��ڿ� �ִ� 20����Ʈ, �ܷ�Ű(BANK_T ���̺��� BANK_CODE Į���� �����Ѵ�. BANK_T ���̺��� ���� �����Ǹ� �ش� BANK_CODE�� �������� CUST_T ���̺��� �൵ �Բ� �����ǵ��� ó���Ѵ�.)

CREATE TABLE CUST_T (
    CUST_NO     NUMBER              NOT NULL,
    CUST_NAME   VARCHAR2(30 BYTE)   NOT NULL,
    CUST_TEL    VARCHAR2(30 BYTE)   NULL UNIQUE,
    CUST_BORN   DATE                NULL,
    BANK_CODE   VARCHAR2(20 BYTE)  NULL,
    CONSTRAINT PK_CUST PRIMARY KEY(CUST_NO),
    CONSTRAINT FK_CUS_CODE FOREIGN KEY(BANK_CODE) REFERENCES BANK_T(BANK_CODE) ON DELETE CASCADE
);

-- 2. ���� ������ �����ϴ� CUST_SQ �������� �����Ͻÿ�.(5��)
--     1) ���۰� : 100
--     2) ������ : 1
--     3) �ִ� : ����
--     4) �ּڰ� : ����
--     5) ĳ�� : 50���� ĳ��
--     6) ��ȯ : ����
--     7) ���� : ��ȣ ������� ���

DROP SEQUENCE CUST_SEQ;
CREATE SEQUENCE CUST_SEQ
    START WITH 100
    INCREMENT BY 1
    NOMAXVALUE
    NOMINVALUE
    CACHE 50
    NOCYCLE
    ORDER;


-- 3. ���� �����͸� BANK_T ���̺�� CUST_T ���̺� INSERT�Ͻÿ�. ����ȣ�� CUST_SQ �������� �̿��Ͻÿ�.(10��)
--    1) BANK_T ���̺�
--       BANK_CODE  BANK_NAME  BANK_TEL
--       BANK001    �ѱ�����   02-123-4567
--       BANK002    ��������   02-321-9876
--       BANK003    �������   031-654-3210

INSERT INTO BANK_T(BANK_CODE, BANK_NAME, BANK_TEL) VALUES('BANK001', '�ѱ�����', '02-123-4567');
INSERT INTO BANK_T(BANK_CODE, BANK_NAME, BANK_TEL) VALUES('BANK002', '��������', '02-321-9876');
INSERT INTO BANK_T(BANK_CODE, BANK_NAME, BANK_TEL) VALUES('BANK003', '�������', '031-654-3210');
COMMIT;

--    2) CUST_T ���̺�
--       CUST_NO  CUST_NAME  CUST_TEL     CUST_BORN  BANK_CODE
--       100      ��浿     01011111111  95/10/05   BANK003
--       101      ������     01022222222  98/12/17   BANK002
--       102      �ֺ���     01033333333  02/03/05   BANK002
--       103      ������     01044444444  05/05/08   BANK003

INSERT INTO CUST_T(CUST_NO, CUST_NAME, CUST_TEL, CUST_BORN, BANK_CODE) VALUES(CUST_SEQ.NEXTVAL, '��浿', '01011111111', '95/10/05', 'BANK003');
INSERT INTO CUST_T(CUST_NO, CUST_NAME, CUST_TEL, CUST_BORN, BANK_CODE) VALUES(CUST_SEQ.NEXTVAL, '������', '01022222222', '98/12/17', 'BANK002');
INSERT INTO CUST_T(CUST_NO, CUST_NAME, CUST_TEL, CUST_BORN, BANK_CODE) VALUES(CUST_SEQ.NEXTVAL, '�ֺ���', '01033333333', '02/03/05', 'BANK002');
INSERT INTO CUST_T(CUST_NO, CUST_NAME, CUST_TEL, CUST_BORN, BANK_CODE) VALUES(CUST_SEQ.NEXTVAL, '������', '01044444444', '05/05/08', 'BANK003');
COMMIT;

-- 4. ���� ���û��״�� ���ο� �ε����� �����Ͻÿ�.(5��)
--    1) ��� ���̺� : CUST_T
--    2) ��� Į�� : CUST_NAME
--    3) �ε��� �̸� : CUST_NAME_IX
DROP INDEX CUST_NAME_IX;

CREATE INDEX CUST_NAME_IX
    ON CUST_T(CUST_NAME);

-- 5. ���� ������ �����(USER)�� ������ �ε��� ������ ������ �ִ� ������ ������ ��ȸ�Ͽ� 
-- CUST_T ���̺� �����ϴ� �ε����� �̸��� �ش� �ε����� ������ Į�� �̸��� ��ȸ�Ͻÿ�.(5��)
SELECT * FROM USER_INDEXES;

-- 6. ���� �並 �����Ͻÿ�.(5��)
--    1) ���̸� : V_SEOUL_BANK
--    2) ������ : '��������'�� BANK_CODE, BANK_NAME, BANK_TEL ������ ��ȸ�� �� �ִ� SELECT��
DROP VIEW V_SEOUL_BANK;

CREATE VIEW V_SEOUL_BANK AS( 
SELECT BANK_CODE, BANK_NAME, BANK_TEL
FROM BANK_T
);
-- 7. BANK_T ���̺��� ��� Į���� ��ȸ�Ͻÿ�. ��� Į���� �ǹ��ϴ� "*"�� ������� ���ÿ�.(10��)
-- BANK_CODE  BANK_NAME  BANK_TEL
-- BANK001    �ѱ�����   02-123-4567
-- BANK002    ��������   02-321-9876
-- BANK003    �������   031-654-3210

-- �Ϲ����� ���̺� Ȱ���Ͽ� ��ȸ
SELECT BANK_CODE, BANK_NAME, BANK_TEL
FROM BANK_T;

-- �並 Ȱ���Ͽ� ��ȸ
SELECT BANK_CODE, BANK_NAME, BANK_TEL
FROM V_SEOUL_BANK;

-- 8. ���� ���̰� ���� ���� ��ȸ�Ͻÿ�.(10��)
-- CUST_NO  CUST_NAME  CUST_TEL     CUST_BORN  BANK_CODE
-- 100      ��浿     01011111111  95/10/05   BANK003
SELECT C.CUST_NO ,
       C.CUST_NAME,
       C.CUST_TEL,
       C.CUST_BORN,
       B.BANK_CODE
  FROM BANK_T B INNER JOIN CUST_T C
    ON B.BANK_CODE = C.BANK_CODE
 WHERE C.CUST_BORN = (SELECT MIN(CUST_BORN)
                        FROM CUST_T);


-- 9. ������ ���� ��ȸ�Ͻÿ�.(10��)
-- CUST_NO  CUST_NAME  CUST_TEL     CUST_BORN  BANK_NAME
-- 100      ��浿     01011111111  95/10/05   �������
-- 101      ������     01022222222  98/12/17   ��������
-- 102      �ֺ���     01033333333  02/03/05   ��������
-- 103      ������     01044444444  05/05/08   �������

SELECT C.CUST_NO, C.CUST_NAME, C.CUST_TEL, C.CUST_BORN, B.BANK_NAME
  FROM CUST_T C INNER JOIN BANK_T B 
    ON C.BANK_CODE = B.BANK_CODE;

-- 10. ������ ���� ��ȸ�Ͻÿ�.(10��)
-- BANK_CODE  BANK_NAME  BANK_TEL      CUST_COUNT
-- BANK001    �ѱ�����   02-123-4567   0
-- BANK002    ��������   02-321-9876   2
-- BANK003    �������   031-654-3210  2

SELECT B.BANK_CODE, B.BANK_NAME, B.BANK_TEL, COUNT(C.CUST_NO) AS CUST_COUNT
  FROM BANK_T B LEFT OUTER JOIN CUST_T C 
    ON B.BANK_CODE = C.BANK_CODE
 GROUP BY B.BANK_CODE, B.BANK_NAME, B.BANK_TEL
 ORDER BY BANK_CODE ASC;