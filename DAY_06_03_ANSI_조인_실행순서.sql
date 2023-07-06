/*
    ����
    
    1. 2�� �̻��� ���̺��� �� ���� ��ȸ�ϴ� ����̴�.
    2. �� ���̺��� ����(1:M)�� �̿��ؼ� ���� ������ �����.
    3. ��������
        1) ���� ���� : 2�� ���̺� ��� �����ϴ� �����͸� ��ȸ�ϴ� ���
        2) �ܺ� ���� : 2�� ���̺� ��� �������� �ʴ��� ��ȸ�ϴ� ���
    
    * ������ �������� �ƴ� ����,�ܺ� ���� �Ǵ��ϴ°��� ��ƴ�.
        
    EX)
            ȸ��  ����
         1   a    1  a  �����
         2   b    2  a  ������
         3   c    3  b  �����

�ش��� 1:M ����� ���� ȸ�� ���̵� a,b,c�� ������ ���°��� ����

    ���ų����� �̾ƺ���(��������)
    a �����
    a ������
    b �����
  
    ���ų����� ���� ����� �����ؼ� ���ų����� �̾ƺ���(�ܺ� ����)
    a �����
    a ������
    b �����
    c null  
*/

/*
    ����̺� ���̺� VS �帮�� ���̺�
    
    1. ����̺� ���̺�
        1) ���� ���踦 ó���ϴ� ���� ���̺�
        2) 1:M ���迡�� 1�� �ش��ϴ� ���̺�
        3) �Ϲ������� �������� ������ ����.
        4) PK�� ���� �������� ����ϱ� ������ �ε���(INDEX) ����� �����ϴ�. (�����ٴ� �ǹ�)
    2. �帮�����̺�
        1) 1:M ���迡�� M�� �ش��ϴ� ���̺�
        2) �Ϲ������� �������� ������ ����.
        3) FK�� ���� �������� ����ϱ� ������ �ε���(INDEX) ����� �Ұ����ϴ�.(�����ٴ� �ǹ�)
    3. ����̺� ���̺��� �帮�� ���̺��� ���� �ۼ��ϸ� ���ɿ� ������ �ȴ�.
*/
-- ���� ���� INNER JOIN

-- 1. �����ȣ, �����, �μ���ȣ, �μ����� ��ȸ�Ͻÿ�.
SELECT EMPLOYEE_ID ,
       FIRST_NAME ,
       LAST_NAME ,
       D.DEPARTMENT_ID, -- 2���� ���̺� ��� �ִ�Į���� �ݵ�� ���̺�(����)�� ����ؾ��Ѵ�.
       DEPARTMENT_NAME
  FROM DEPARTMENTS D INNER JOIN EMPLOYEES E
    ON D.DEPARTMENT_ID  = E.DEPARTMENT_ID;

-- 2. �����ȣ, �����, ����, ������ �ִ뿬��, ������ �ּ� ������ ��ȸ�Ͻÿ�.
SELECT EMPLOYEE_ID,
       FIRST_NAME || ' ' || LAST_NAME AS FULL_NAME,
       J.JOB_ID,
       SALARY,
       MAX_SALARY,
       MIN_SALARY
  FROM JOBS J INNER JOIN EMPLOYEES E
    ON J.JOB_ID = E.JOB_ID;
    
-- �ܺ����� OUTER JOIN

-- 3. ��� �������(�μ��� ���� ����� ����) �����ȣ, �����, �μ���ȣ, �μ����� ��ȸ�Ͻÿ�.
SELECT EMPLOYEE_ID,
       FIRST_NAME,
       LAST_NAME,
       D.DEPARTMENT_ID
       DEPARTMENT_NAME
  FROM DEPARTMENTS D RIGHT OUTER JOIN EMPLOYEES E 
  -- ������ ���̺�(EMPLOYEES)�� ��� �����͸� ��ȸ�Ͻÿ�(�μ���ȣ�� ���� ����� ��ȸ�Ͻÿ�) ��� �ǹ��̴�.
    ON D.DEPARTMENT_ID = E.DEPARTMENT_ID;

-- 4. �����ȣ, �����, �μ���ȣ, �μ����� ��ȸ�Ͻÿ�. ����� �ٹ����� �ʴ� ���� �μ��� ��ȸ�Ͻÿ�
SELECT EMPLOYEE_ID,
       FIRST_NAME,
       LAST_NAME,
       D.DEPARTMENT_ID
       DEPARTMENT_NAME
  FROM  DEPARTMENTS D LEFT OUTER JOIN EMPLOYEES E
  -- ���� ���̺�(DEPARTMENTS)�� ��� �����͸� ��ȸ�Ͻÿ�(����� �ٹ����� �ʴ� �μ��� ��ȸ�Ͻÿ�) ��� �ǹ��̴�.
    ON D.DEPARTMENT_ID = E.DEPARTMENT_ID;
    
-- 3���̻� ���̺� �����ϱ�

-- 5. �����ȣ, �����, �μ���ȣ, �μ���, �ٹ������� ��ȸ�Ͻÿ�.
SELECT EMPLOYEE_ID,
       FIRST_NAME ,
       LAST_NAME ,
      D.DEPARTMENT_ID ,
       DEPARTMENT_NAME ,
      L.LOCATION_ID , 
       CITY
  FROM LOCATIONS L INNER JOIN DEPARTMENTS D
    ON L.LOCATION_ID = D.LOCATION_ID  INNER JOIN EMPLOYEES E
    ON D.DEPARTMENT_ID = E.DEPARTMENT_ID;

-- 6.�μ���ȣ, �μ���, �ٹ����� �ٹ����� ��ȸ�Ͻÿ�.
SELECT DEPARTMENT_ID ,
       DEPARTMENT_NAME, 
       CITY
       COUNTRY_NAME
  FROM COUNTRIES C INNER JOIN LOCATIONS L
    ON C.COUNTRY_ID = L.COUNTRY_ID INNER JOIN DEPARTMENTS D
    ON L.LOCATION_ID = D.LOCATION_ID;

    