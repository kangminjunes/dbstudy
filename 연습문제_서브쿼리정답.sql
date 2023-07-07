-- 1. �����ȣ�� 1001�� ����� ������ ����(POSITION)�� ���� ����� ��ȸ�Ͻÿ�.
SELECT EMP_NO, NAME, DEPART, GENDER, POSITION, HIRE_DATE, SALARY
  FROM EMPLOYEE_TBL
 WHERE POSITION = (SELECT POSITION
                     FROM EMPLOYEE_TBL
                    WHERE EMP_NO = 1001);


-- 2. �μ���ȣ�� 2�� �μ��� ������ ������ �ִ� �μ��� ��ȸ�Ͻÿ�.
SELECT DEPT_NO, DEPT_NAME, LOCATION
  FROM DEPARTMENT_TBL
 WHERE LOCATION = (SELECT LOCATION
                     FROM DEPARTMENT_TBL
                    WHERE DEPT_NO = 2);


-- 3. ���� ���� �޿��� �޴� ����� ��ȸ�Ͻÿ�.
SELECT EMP_NO, NAME, DEPART, GENDER, POSITION, HIRE_DATE, SALARY
  FROM EMPLOYEE_TBL
 WHERE SALARY = (SELECT MAX(SALARY)
                   FROM EMPLOYEE_TBL);


-- 4. ��� �޿� ���ϸ� �޴� ����� ��ȸ�Ͻÿ�.
SELECT EMP_NO, NAME, DEPART, GENDER, POSITION, HIRE_DATE, SALARY
  FROM EMPLOYEE_TBL
 WHERE SALARY <= (SELECT AVG(SALARY)
                    FROM EMPLOYEE_TBL);


-- 5. ��� �ټ� ���� �� �̻��� �ٹ��� ����� ��ȸ�Ͻÿ�.
SELECT EMP_NO, NAME, DEPART, GENDER, POSITION, HIRE_DATE, SALARY
  FROM EMPLOYEE_TBL
 WHERE MONTHS_BETWEEN(SYSDATE, HIRE_DATE) >= (SELECT AVG(MONTHS_BETWEEN(SYSDATE, HIRE_DATE))
                                                FROM EMPLOYEE_TBL);


-- 6. �μ���ȣ�� 2�� �μ��� �ٹ��ϴ� ������� ���ް� ��ġ�ϴ� ����� ��ȸ�Ͻÿ�.
SELECT EMP_NO, NAME, DEPART, GENDER, POSITION, HIRE_DATE, SALARY
  FROM EMPLOYEE_TBL
 WHERE POSITION IN (SELECT POSITION
                      FROM EMPLOYEE_TBL
                     WHERE DEPART = 2);  -- WHERE������ ����� DEPART Į���� PK/UNIQUE Į���� �ƴϹǷ� ���� �� ���������� ó���Ѵ�.


-- 7. �μ����� '������'�� �μ��� �ٹ��ϴ� ����� ��ȸ�Ͻÿ�.
SELECT EMP_NO, NAME, DEPART, GENDER, POSITION, HIRE_DATE, SALARY
  FROM EMPLOYEE_TBL
 WHERE DEPART IN (SELECT DEPT_NO
                    FROM DEPARTMENT_TBL
                   WHERE DEPT_NAME = '������');  -- WHERE������ ����� DEPART_NAME Į���� PK/UNIQUE�� �ƴϹǷ� ���� �� ���������� ó���Ѵ�.

-- ����) �������� Ǯ��
SELECT E.EMP_NO, E.NAME, E.DEPART, E.GENDER, E.POSITION, E.HIRE_DATE, E.SALARY
  FROM DEPARTMENT_TBL D INNER JOIN EMPLOYEE_TBL E
    ON D.DEPT_NO = E.DEPART
 WHERE D.DEPT_NAME = '������';


-- 8. ������ '����'�� ������� �ٹ��ϴ� �μ� ������ ��ȸ�Ͻÿ�.
SELECT DEPT_NO, DEPT_NAME, LOCATION
  FROM DEPARTMENT_TBL
 WHERE DEPT_NO IN (SELECT DEPART
                     FROM EMPLOYEE_TBL
                    WHERE POSITION = '����');  -- WHERE������ ����� POSITION Į���� PK/UNIQUE�� �ƴϹǷ� ���� �� ���������� ó���Ѵ�.

-- ����) �������� Ǯ��
SELECT D.DEPT_NO, D.DEPT_NAME, D.LOCATION
  FROM DEPARTMENT_TBL D INNER JOIN EMPLOYEE_TBL E
    ON D.DEPT_NO = E.DEPART
 WHERE E.POSITION = '����';


-- 9. '������'���� ���� ���� �޿��� �޴� ������� �� ���� �޿��� �޴� ����� ��ȸ�Ͻÿ�.
SELECT EMP_NO, NAME, DEPART, GENDER, POSITION, HIRE_DATE, SALARY
  FROM EMPLOYEE_TBL
 WHERE SALARY > (SELECT MAX(SALARY)
                   FROM EMPLOYEE_TBL
                  WHERE DEPART IN (SELECT DEPT_NO
                                     FROM DEPARTMENT_TBL
                                    WHERE DEPT_NAME = '������'));

-- ����) ���������� �������� Ǯ��
SELECT EMP_NO, NAME, DEPART, GENDER, POSITION, HIRE_DATE, SALARY
  FROM EMPLOYEE_TBL
 WHERE SALARY > (SELECT MAX(E.SALARY)
                   FROM DEPARTMENT_TBL D INNER JOIN EMPLOYEE_TBL E
                     ON D.DEPT_NO = E.DEPART
                  WHERE D.DEPT_NAME = '������');


-- 10. 3 ~ 4��°�� �Ի��� ����� ��ȸ�Ͻÿ�.
SELECT EMP_NO, NAME, DEPART, GENDER, POSITION, HIRE_DATE, SALARY
  FROM (SELECT ROW_NUMBER() OVER(ORDER BY HIRE_DATE ASC) AS RN, EMP_NO, NAME, DEPART, GENDER, POSITION, HIRE_DATE, SALARY
          FROM EMPLOYEE_TBL)
 WHERE RN BETWEEN 3 AND 4;