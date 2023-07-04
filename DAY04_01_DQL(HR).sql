
-- 1. ��� ���̺����� FIRST_NAME, LAST_ NAME ��ȸ�ϱ�.

SELECT E.FIRST_NAME AS �̸�, LAST_NAME AS ��
  FROM EMPLOYEES E;
  
-- 2. ��� ���̺����� DEPARTMENT_ID�� �ߺ��� �����ϰ� ��ȸ�ϱ�
SELECT DISTINCT DEPARTMENT_ID
  FROM EMPLOYEES;
  
-- 3. ��� ���̺����� EMPLOYEE_ID�� 150�� ����� ���� ��ȸ�ϱ�
SELECT *
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID = 150;

SELECT *                                --����Ŭ�� �����ϴ� ���
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID = T0_NUMBER('150');
 
SELECT *
  FROM EMPLOYEES
 WHERE TO_CHAR (EMPLOYEE_ID) ='150';
  
 
 -- 4. ��� ���̺����� ������ 10000 �̻��� ����� ���� ��ȸ�ϱ�
 SELECT *
   FROM EMPLOYEES
  WHERE SALARY >=10000;
  
 -- 5. ��� ���̺����� ������ 10000 �̻�, 20000 ������ ����� ���� ��ȸ�ϱ�
 SELECT *
  FROM EMPLOYEES
 WHERE SALARY >= 10000 AND SALARY <= 20000;
 
 SELECT *
   FROM EMPLOYEES
  WHERE SALARY  BETWEEN 10000 AND 20000;  --��õ
 
 -- 6. ��� ���̺����� �μ���ȣ�� 30, 40, 50�� ����� ���� ��ȸ�ϱ�
 SELECT *
   FROM EMPLOYEES
  WHERE DEPARTMENT_ID = 30 OR DEPARTMENT_ID = 40 OR DEPARTMENT_ID= 50;
 
 SELECT *
   FROM EMPLOYEES
   WHERE DEPARTMENT_ID IN(30,40,50); -- ��õ
   
 -- 7. ��� ���̺����� �μ���ȣ�� ���� ����� ���� ��ȸ�ϱ�
SELECT *
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IS NULL;
 
 -- 8. ��� ���̺����� Ŀ�̼��� �޴� ����� ���� ��ȸ�ϱ�
SELECT *
  FROM EMPLOYEES
 WHERE COMMISSION_PCT IS NOT NULL;
 
--��ü ��� ��ȸ�ϴ� Į��
SELECT * FROM EMPLOYEES;

-- 9. ��� ���̺����� ��ȭ��ȣ�� '515'�� �����ϴ� ����� ���� ��ȸ�ϱ�
SELECT * 
  FROM EMPLOYEES
 WHERE PHONE_NUMBER LIKE '515'|| '%';
  
-- 10. ��� ���̺����� ��ȭ��ȣ�� '515' �� �����ϴ� ��ȭ��ȣ�� �ߺ��� �����ϰ� ��ȸ�ϱ�
SELECT DISTINCT PHONE_NUMBER
  FROM EMPLOYEES
WHERE PHONE_NUMBER   LIKE  '515' || '%';

--11. ��� ���̺��� ������� ���������� ��ȸ�ϱ� (���� ������ ���� ��ȸ)
SELECT *
  FROM EMPLOYEES
 ORDER BY SALARY;  -- �⺻ ���� ����� ���������̴�.
 
 SELECT *
  FROM EMPLOYEES
 ORDER BY SALARY ASC;  -- ASC : Ascending(��������) ACS ������ �����ϴ�.

 SELECT *
  FROM EMPLOYEES
 ORDER BY SALARY DESC; -- DESC: Descending(��������)
 
 
--12. ��� ���̺��� ������� �Ի������ ��ȸ�ϱ� (���� �Ի��� ����� ���� ��ȸ)
SELECT *
  FROM EMPLOYEES
 ORDER BY HIRE_DATE; -- ASC(��������)�� ������ �� �ִ�.
 
 --13. ��� ���̺��� ������� �μ����� ���� �� �ֵ��� ���� �μ��� ������� ��Ƽ� ��ȸ�ѵ�
 --���� �μ� ���� ������� ���������� ��ȸ�ϱ�
 --1�� ���� ���� : �μ�, ��������
 --2�� ���� ���� : ����, ��������
 
SELECT *
  FROM EMPLOYEES
 ORDER BY DEPARTMENT_ID, SALARY DESC;
 
 