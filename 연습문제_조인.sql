-- 1. LOCATION_ID�� 1700�� �μ��� �ٹ��ϴ� ������� EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_NAME�� ��ȸ�Ͻÿ�.
-- 1) ANSI


-- 2) ����Ŭ


-- 2. DEPARTMENT_NAME�� 'Executive'�� �μ��� �ٹ��ϴ� ������� EMPLOYEE_ID, FIRST_NAME�� ��ȸ�Ͻÿ�.
-- 1) ANSI


-- 2) ����Ŭ



-- 3. ��� ������� EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_NAME, STREET_ADDRESS, CITY�� ��ȸ�Ͻÿ�.
-- 1) ANSI


-- 2) ����Ŭ



-- 4. �μ��� DEPARTMENT_NAME�� ��� ���� ��� ������ ��ȸ�Ͻÿ�.
-- 1) ANSI


-- 2) ����Ŭ



-- 5. ��� ������� EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_NAME�� ��ȸ�Ͻÿ�. �μ��� ���� ����� �μ����� 'None'���� ��ȸ�ǵ��� ó���Ͻÿ�.
-- 1) ANSI


-- 2) ����Ŭ



-- 6. ��� �μ��� DEPARTMENT_NAME�� �ٹ� ���� ��� ���� ��ȸ�Ͻÿ�. �ٹ��ϴ� ����� ������ 0���� ��ȸ�Ͻÿ�.
-- 1) ANSI


-- 2) ����Ŭ



-- 7. ��� �μ��� DEPARTMENT_ID, DEPARTMENT_NAME, STATE_PROVINCE, COUNTRY_NAME, REGION_NAME�� ��ȸ�Ͻÿ�.
-- 1) ANSI


-- 2) ����Ŭ



-- 8. ��� ������� EMPLOYEE_ID, FIRST_NAME, LAST_NAME, MANAGER�� FIRST_NAME�� ��ȸ�Ͻÿ�. (SELF JOIN)
-- 1) ANSI

--FROM
-- EMPLOYEES E : ��� ���̺�
-- EMPLOYEES M : ��� ���̺�

-- ON
-- ������̺��� �Ŵ�����ȣ = ������̺��� �����ȣ

-- ������̺� E                   | ������̺� M
-- �����ȣ �̸�  �Ŵ�����ȣ       | �����ȣ �̸�  �Ŵ�����ȣ
-- 1        KIM   NULL            |  1       KIM    NULL
-- 2        LEE   1               |  2       LEE    1
-- 3        PARK  1               |  3       PARM   1

SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.LAST_NAME,    --��� ����
       M.EMPLOYEE_ID, M.FIRST_NAME, M.LAST_NAME
  FROM EMPLOYEES M RIGHT OUTER JOIN EMPLOYEES E
    ON M.EMPLOYEE_ID = E.MANAGER_ID;

-- 2) ����Ŭ
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.LAST_NAME,    --��� ����
       M.EMPLOYEE_ID, M.FIRST_NAME, M.LAST_NAME
  FROM EMPLOYEES M , EMPLOYEES E
 WHERE M.EMPLOYEE_ID(+) = E.MANAGER_ID;


-- 9. �� ��� �߿��� �Ŵ������� ���� �Ի��� ����� ��ȸ�Ͻÿ�. (SELF JOIN)
-- 1) ANSI


-- 2) ����Ŭ



-- 10. ���� �μ��� �ٹ��ϴ� ��� �߿��� ������ SALARY�� ���� ��� ������ ��ȸ�Ͻÿ�. (SELF JOIN)
-- 1) ANSI

-- 2) ����Ŭ
