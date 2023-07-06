-- 1. EMPLOYEES ���̺��� JOB_ID�� ��ȸ�Ͻÿ�. ������ JOB_ID�� �� ���� ����ϰ� ���ĺ� ������ �����Ͽ� ��ȸ�Ͻÿ�.

SELECT DISTINCT JOB_ID
  FROM EMPLOYEES;

-- 2. EMPLOYEES ���̺��� DEPARTMENT_ID�� 50�� ��� �߿��� SALARY�� 5000 �̻��� ����� ��ȸ�Ͻÿ�.
SELECT DEPARTMENT_ID, SALARY
 FROM EMPLOYEES
WHERE DEPARTMENT_ID =50 AND SALARY >5000;

-- 3. EMPLOYEES ���̺��� FIRST_NAME�� 'Steven', LAST_NAME�� 'King'�� ����� ��ȸ�Ͻÿ�.
SELECT FIRST_NAME , LAST_NAME 
  FROM EMPLOYEES
 WHERE FIRST_NAME= 'Steven' AND LAST_NAME = 'King';

-- 4. EMPLOYEES ���̺��� EMPLOYEE_ID�� 151 ~ 200�� ����� ��ȸ�Ͻÿ�.
SELECT *
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID BETWEEN 151 AND 200;

-- 5. EMPLOYEES ���̺��� JOB_ID�� 'IT_PROG', 'ST_MAN'�� ����� ��ȸ�Ͻÿ�.
SELECT *
  FROM EMPLOYEES
 WHERE JOB_ID = 'IT_PROG' OR JOB_ID = 'ST_MAN';

-- 6. EMPLOYEES ���̺��� HIRE_DATE�� 2005�⵵�� ����� ��ȸ�Ͻÿ�.
SELECT * 
  FROM EMPLOYEES
 WHERE HIRE_DATE LIKE '05'|| '%';

-- 7. EMPLOYEES ���̺��� MANAGER_ID�� ���� ����� ��ȸ�Ͻÿ�.
SELECT *
  FROM EMPLOYEES
 WHERE MANAGER_ID IS NULL;

-- 8. EMPLOYEES ���̺��� COMMISSION_PCT�� �޴� ������� ���� Ŀ�̼��� ��ȸ�Ͻÿ�. Ŀ�̼��� COMMISSION_PCT * SALARY�� ����Ͻÿ�.
SELECT MAX(COMMISSION_PCT * SALARY)
  FROM EMPLOYEES;

-- 9. EMPLOYEES ���̺��� FIRST_NAME�� 'J'�� �����ϴ� ����� ��ȸ�Ͻÿ�.
SELECT *
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE 'J' || '%';

-- 10. EMPLOYEES ���̺��� JOB_ID�� 'MAN'���� ������ ������� MANAGER_ID�� �ߺ��� �����Ͽ� ��ȸ�Ͻÿ�.
SELECT DISTINCT MANAGER_ID , JOB_ID
  FROM EMPLOYEES
 WHERE JOB_ID  LIKE   '%MAN';

-- 11. EMPLOYEES ���̺��� ��ü ����� DEPARTMENT_ID�� ������������ ��ȸ�ϵ�, ������ DEPARTMENT_ID �������� HIRE_DATE�� ������������ ��ȸ�Ͻÿ�.
SELECT *
  FROM EMPLOYEES
 ORDER BY DEPARTMENT_ID, HIRE_DATE ASC; 

-- 12. EMPLOYEES ���̺��� DEPARTMENT_ID�� 80�� ������� ���� SALARY������ ��ȸ�Ͻÿ�. SALARY�� 9,000ó�� õ ���� ���б�ȣ�� ǥ���ؼ� ��ȸ�Ͻÿ�.
SELECT TO_CHAR(SALARY) 
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 80
--80�� ������ SALARY ��� ���������� 00,000 �� �ִ°� ������

-- 13. EMPLOYEES ���̺��� ��ü ����� �ٹ� ���� ���� ������ ��ȸ�Ͻÿ�. 1���� 1���� �ٹ��ߴٸ� 2������ �ٹ��� ������ ó���ؼ� ��ȸ�Ͻÿ�.
SELECT TO_CHAR(HIRE_DATE,'YYYYMMDD')
  FROM EMPLOYEES;

-- 14. EMPLOYEES ���̺��� PHONE_NUMBER�� ���� ����(REGION)�� ��ȸ�Ͻÿ�.
-- PHONE_NUMBER�� 011�� �����ϸ� 'MOBILE', 515�� �����ϸ� 'EAST', 590���� �����ϸ� 'WEST', 603���� �����ϸ� 'SOUTH', 650���� �����ϸ� 'NORTH'�� ��ȸ�Ͻÿ�.
SELECT 

-- 15. EMPLOYEES ���̺��� �ٹ� ���� ���� 240���� �̻��̸� '������������', �ƴϸ� �� ���ڿ�('')�� ��ȸ�Ͻÿ�.


-- 16. EMPLOYEES ���̺��� SALARY ����� 10000 �̻��� �μ��� DEPARTMENT_ID�� SALARY ����� ��ȸ�Ͻÿ�. ����� ������ ����ó���Ͻÿ�.


-- 17. EMPLOYEES ���̺��� DEPARTMENT_ID�� JOB_ID�� ��� ���� ������� �׷�ȭ�Ͽ� �� �׷��� ������� ��ȸ�Ͻÿ�. DEPARTMENT_ID�� NULL�� ����� �����Ͻÿ�.


-- 18. EMPLOYEES ���̺��� ��ü ������� �μ��� ���� ������ ��ȸ�Ͻÿ�. 


-- 19. DEPARTMENTS ���̺��� LOCATION_ID�� �׷�ȭ�Ͽ� �� �׷��� �μ����� ��ȸ�Ͻÿ�. MANAGER_ID�� ���� ������ �����Ͻÿ�.


-- 20. DEPARTMENTS ���̺��� DEPARTMENT_NAME�� ù 2���ڷ� �׷�ȭ�Ͽ� �� �׷��� �μ����� ��ȸ�Ͻÿ�. 'IT'�� 'Co'�� �μ��� ��ȸ�Ͻÿ�.