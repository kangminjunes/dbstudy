-- 1. �����ȣ, �����, �μ���ȣ, �μ����� ��ȸ�Ͻÿ�.
SELECT E.EMPLOYEE_ID ,
       E.FIRST_NAME ,
       E.LAST_NAME ,
       D.DEPARTMENT_ID, 
       D.DEPARTMENT_NAME
  FROM DEPARTMENTS D , EMPLOYEES E          -- INNER JOIN ��� �޸�(,)�� ����Ѵ�.
 WHERE D.DEPARTMENT_ID  = E.DEPARTMENT_ID;  -- ON ��� WHERE�� ����Ѵ�.

-- 2. �����ȣ, �����, ����, ������ �ִ뿬��, ������ �ּ� ������ ��ȸ�Ͻÿ�.
SELECT E.EMPLOYEE_ID,
       E.FIRST_NAME || ' ' || E.LAST_NAME AS FULL_NAME,
       J.JOB_ID,
       E.SALARY,
       J.MAX_SALARY,
       J.MIN_SALARY
  FROM JOBS J , EMPLOYEES E      -- INNER JOIN ��� �޸�(,)�� ����Ѵ�.
 WHERE J.JOB_ID = E.JOB_ID;      -- ON ��� WHERE�� ����Ѵ�.   
    
-- �ܺ����� OUTER JOIN

-- 3. ��� �������(�μ��� ���� ����� ����) �����ȣ, �����, �μ���ȣ, �μ����� ��ȸ�Ͻÿ�.
SELECT E.EMPLOYEE_ID,
       E.FIRST_NAME,
       E.LAST_NAME,
       D.DEPARTMENT_ID,
       D.DEPARTMENT_NAME
  FROM DEPARTMENTS D , EMPLOYEES E  --   RIGHT OUTER JOIN ���(,)�� ����Ѵ�.
  -- ������ ���̺�(EMPLOYEES)�� ��� �����͸� ��ȸ�Ͻÿ�(�μ���ȣ�� ���� ����� ��ȸ�Ͻÿ�) ��� �ǹ��̴�.
 WHERE D.DEPARTMENT_ID(+) = E.DEPARTMENT_ID; --RIGHT OUTER JOIN�� �ݴ����(LEFT)�� (+)�� �߰��Ѵ�. , ON ��� WHERE ��� 

-- 4. �����ȣ, �����, �μ���ȣ, �μ����� ��ȸ�Ͻÿ�. ����� �ٹ����� �ʴ� ���� �μ��� ��ȸ�Ͻÿ�
SELECT E.EMPLOYEE_ID,
       E.FIRST_NAME,
       E.LAST_NAME,
       D.DEPARTMENT_ID
       DEPARTMENT_NAME
  FROM  DEPARTMENTS D ,  EMPLOYEES E  --   RIGHT OUTER JOIN ���(,)�� ����Ѵ�.
  -- ���� ���̺�(DEPARTMENTS)�� ��� �����͸� ��ȸ�Ͻÿ�(����� �ٹ����� �ʴ� �μ��� ��ȸ�Ͻÿ�) ��� �ǹ��̴�.
   WHERE D.DEPARTMENT_ID = E.DEPARTMENT_ID(+); --LEFT OUTER JOIN�� �ݴ����(RIGHT)�� (+)�� �߰��Ѵ�. , ON ��� WHERE ��� 
    
-- 3���̻� ���̺� �����ϱ�

-- 5. �����ȣ, �����, �μ���ȣ, �μ���, �ٹ������� ��ȸ�Ͻÿ�.
SELECT E.EMPLOYEE_ID,
       E.FIRST_NAME ,
       E.LAST_NAME ,
       D.DEPARTMENT_ID ,
       D.DEPARTMENT_NAME ,
       L.LOCATION_ID , 
       L.CITY
  FROM LOCATIONS L , DEPARTMENTS D , EMPLOYEES E
 WHERE L.LOCATION_ID = D.LOCATION_ID  
   AND D.DEPARTMENT_ID = E.DEPARTMENT_ID;

-- 6.�μ���ȣ, �μ���, �ٹ����� �ٹ����� ��ȸ�Ͻÿ�.
SELECT D.DEPARTMENT_ID ,
       D.DEPARTMENT_NAME, 
       L.CITY,
       C.COUNTRY_NAME
  FROM COUNTRIES C , LOCATIONS L , DEPARTMENTS D
 WHERE C.COUNTRY_ID = L.COUNTRY_ID 
   AND L.LOCATION_ID = D.LOCATION_ID;