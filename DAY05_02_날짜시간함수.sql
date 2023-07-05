-- 1. ���� ��¥ �� �ð�

-- ����Ŭ ��ġ�� ���� ���� �ð�
SELECT SYSDATE ,        -- DATE ����
       SYSTIMESTAMP     -- TIMESTAMP ����
  FROM DUAL;
  
-- ����Ÿ���� ���� �ð�  �ؿ� ���� ��ġ�� �Ǹ� �츮����� �ð��� �ٸ�������
SELECT SESSIONTIMEZONE ,
       CURRENT_DATE ,       -- DATE ����
       CURRENT_TIMESTAMP    -- TIMESTAMP ����
  FROM DUAL;
  
-- 2. ��¥�� ���ϴ� �������� ��ȸ�ϱ�
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD'),
       TO_CHAR(SYSDATE, 'YYYY-MM-DD AM HH:MI:SS'),
       TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS'),
       TO_CHAR(SYSTIMESTAMP, 'YYYY-MM-DD HH24:MI;SS.FF3') -- �и��� õ���� 1�� ����
  FROM DUAL;

-- 3. DATE ������ ��¥ ����
--  1) 1���� ���� 1�� ó���Ѵ�.
--  2) 1=1��, 1/24=1�ð�, 1/24/60=1��, 1/24/60/60=1��
SELECT T0_CHAR(SYSDATE + 1,          'YYYY--MM-DD AM HH:MI:SS'), -- 1����
       T0_CHAR(SYSDATE + 1/24,       'YYYY--MM-DD AM HH:MI:SS'), -- 1�ð� ��
       T0_CHAR(SYSDATE + 1/24/60,    'YYYY--MM-DD AM HH:MI:SS'), -- 1�� ��
       T0_CHAR(SYSDATE + 1/24/60/60, 'YYYY--MM-DD AM HH:MI:SS')  -- 1�� ��
  FROM DUAL;
  
SELECT SYSDATE - TO_DATE('23/07/01', 'YY/MM/DD'),
       TRUNC(SYSDATE -  TO_DATE('23/07/01', 'YY/MM/DD'))    -- ����� �ϼ� 
  FROM DUAL;
-- EX) ��й�ȣ ���� �ȳ�â(90�� ����Ǿ����ϴ�.)  

-- 4. TIMESTAMP ������ ��¥ ����
--    1) INTERVAL Ű���带 �̿��Ѵ�.
--    2) YEAR, MONTH, DAY, HOUR, MINUTE, SECOND ������ ����Ѵ�.
SELECT SYSTIMESTAMP + INTERVAL '1' YEAR,    -- 1�� ��
       SYSTIMESTAMP + INTERVAL '1' MONTH,   -- 1���� ��
       SYSTIMESTAMP + INTERVAL '1' DAY,     -- 1�� ��
       SYSTIMESTAMP + INTERVAL '1' HOUR,    -- 1�ð� ��
       SYSTIMESTAMP + INTERVAL '1' SECOND   -- 1�� ��
  FROM DUAL;

SELECT SYSTIMESTAMP - TO_TIMESTAMP('23/07/01' , 'YY/MM/DD'),                   -- ����� �Ⱓ�� TIMESTAMP �������� ��ȯ �ȴ�.
       EXTRACT(DAY FROM SYSTIMESTAMP - TO_TIMESTAMP('23/07/01' , 'YY/MM/DD'))  -- ����� �Ⱓ���� �ϼ��� ����
  FROM DUAL;
  
-- 5. �ʿ��� ���� �����ϱ�
SELECT EXTRACT(YEAR   FROM SYSDATE), --��
       EXTRACT(MONTH  FROM SYSDATE), --��
       EXTRACT(DAY    FROM SYSDATE), --��
       EXTRACT(HOUR   FROM SYSTIMESTAMP),   -- ��, UTC(ǥ�ؽ�) ����
       EXTRACT(HOUR   FROM SYSTIMESTAMP)+9, -- ��, Asia/Seoul ����
       EXTRACT(MINUTE FROM SYSTIMESTAMP), --��
       EXTRACT(SECOND FROM SYSTIMESTAMP), --��
       TRUNC(EXTRACT(SECOND FROM SYSTIMESTAMP)),
       TO_CHAR(SYSDATE, 'YYYY') -- TO_CHAR �Լ��� ����뵵�� ���
 FROM  DUAL;
 
-- 6. ������ �������� Ư�� ��¥ ���ϱ�
SELECT NEXT_DAY(SYSDATE,  '��'), -- ���� ������
       NEXT_DAY(SYSDATE-8, '��') -- ���� ������(SYSDATE-7�� �ƴ��� ����)
  FROM DUAL;
  
-- 7. N���� ���� ��¥ ���ϱ�
SELECT ADD_MONTHS(SYSDATE,  1),  -- 1���� ��
       ADD_MONTHS(SYSDATE, -1),  -- 1���� ��
       ADD_MONTHS(SYSDATE, 5 * 12) -- 5�� ��
  FROM DUAL;

-- 8. ����� ���� �� ���ϱ�
SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('23/01/01', 'YY/MM/DD'))
  FROM DUAL;
  
  
  