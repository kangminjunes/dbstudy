--DEPARTMENT_T ,EMPLOYEE_T

-- 1. �����ȣ�� 1001�� ����� ������ ����(POSITION)�� ���� ����� ��ȸ�Ͻÿ�.
SELECT *
  FROM EMPLOYEE_T
 WHERE POSITION = (SELECT POSITION
                     FROM EMPLOYEE_T
                    WHERE EMP_NO= 1001);

-- 2. �μ���ȣ�� 2�� �μ��� ������ ������ �ִ� �μ��� ��ȸ�Ͻÿ�.
SELECT *
  FROM EMPLOYEE_T
 WHERE DEPART IN (SELECT DEPART
                   FROM EMPLOYEE_T
                  WHERE DEPARTMENT_T  IN (SELECT LOCATION
                                     FROM  DEPARTMENT_T
                                    WHERE  DEPT_NO = '2'));
 
-- 3. ���� ���� �޿��� �޴� ����� ��ȸ�Ͻÿ�.
SELECT *
  FROM EMPLOYEE_T
 WHERE SALARY = (SELECT MAX (SALARY)
                   FROM EMPLOYEE_T);
-- 4. ��� �޿� ���ϸ� �޴� ����� ��ȸ�Ͻÿ�.
SELECT *
  FROM EMPLOYEE_T
 WHERE SALARY  <= (SELECT AVG(SALARY)
                     FROM EMPLOYEE_T);

-- 5. ��� �ټ� ���� �� �̻��� �ٹ��� ����� ��ȸ�Ͻÿ�.
SELECT *
 FROM EMPLOYEE_T
WHERE HIRE_DATE >= (SELECT AVG(HIRE_DATE)
                      FROM EMPLOYEE_T);

-- 6. �μ���ȣ�� 2�� �μ��� �ٹ��ϴ� ������� ���ް� ��ġ�ϴ� ����� ��ȸ�Ͻÿ�.
SELECT *
  FROM EMPLOYEE_T
 WHERE DEPART IN (SELECT DEPART
                    FROM DEPARTMENT_T
                    WHERE DEPT_NO = '2');
 
-- 7. �μ����� '������'�� �μ��� �ٹ��ϴ� ����� ��ȸ�Ͻÿ�.
SELECT *
  FROM EMPLOYEE_T
 WHERE  DEPART IN (SELECT DEPART
                    FROM DEPARTMENT_T
                   WHERE DEPT_NAME = '������');

-- 8. ������ '����'�� ������� �ٹ��ϴ� �μ� ������ ��ȸ�Ͻÿ�.
SELECT  DEPT_NO,
        DEPT_NAME,
        (SELECT DEPART
          FROM EMPLOYEE_T
        WHERE DEPART = '����')  AS DEPT_NAME
  FROM EMPLOYEE_T
 WHERE DEPART= '����';

-- 9. '������'���� ���� ���� �޿��� �޴� ������� �� ���� �޿��� �޴� ����� ��ȸ�Ͻÿ�.
SELECT *
  FROM EMPLOYEE_T
 WHERE SALARY = (SELECT MAX (SALARY)
                   FROM EMPLOYEE_T);

-- 10. 3 ~ 4��°�� �Ի��� ����� ��ȸ�Ͻÿ�.
SELECT HD, EMP_NO
 FROM (SELECT ROW_NUMBER() OVER(ORDER BY HIRE_DATE DESC) HD, EMP_NO
         FROM EMPLOYEE_T)
 WHERE HD BETWEEN 3 AND 4;