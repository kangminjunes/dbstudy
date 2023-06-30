/*
    테이블(table)
    1.데이터베이스에서 데이터를 저장하는 객체이다.
    2.표 형식으로 가진다.
    3.행(row)과 열(column)의 집합 형태이다.
*/

/*
    데이터타입
    1.NUMBER(p,s) p: 정밀도 ,s:스케일로 표현하는 숫자 형식
        1) 정밀도 p: 전체 유효 숫자의 갯수 
            ex: 1,01,001 다음중에서 유효숫자는1 하나뿐이다. 
                0.99->정밀도 2이다.
        2) 스케일 s: 소수부의 유효 숫자의 갯수
            ex: 0.1->1, 0.01->2, 0.10->1의 스케일을 가진다.
    2.CHAR(size) : 고정 문자(character)
        1) 글자 수가 고정된 타입
            ex: 핸드폰번호, 주민번호 등
        2) size: 최대 2000 byte까지 지정 가능
    3. VARCHAR2(size) : 가변 문자
        1) 글자 수가 고정되지 않은 타입(예시 : 이름, 이메일, 주소 등)
        2) size: 최대 4000 byte까지 지정 가능
    4. CLOB: 큰 텍스트 타입 
        1) size :4기가 까지 저장 가능
    5. DATE: 날짜와 시간을 동시에 표현하는 타입
            ex:년,월,일,시,분,초
    6. TIMESTEP: 날짜와 시간을 동시에 표현하는 타입(좀더 세부 단위까지 가능)
            ex:년,월,일,시,분,초,마이크로초(백만분의 1초)
*/

/*
    테이블의 제약조건 5가지
    1. NOT NULL    : 필수
    2. UNIQUE      : 중복 불가
    3. PRIMARY KEY : 기본키
    4. FREIGEN KEY : 외래키
    5. CHECK       : 값의 제한 (중요X 그냥 알기만 하기)
        ex) 성별의 제한: 남,여, 제한없음 
*/

CREATE TABLE CUSTOMER_T (
    NO NUMBER NOT NULL PRIMARY KEY,
    ID   VARCHAR2(32 BYTE) NOT NULL UNIQUE , 
    NAME VARCHAR2(32 BYTE) NOT NULL ,
    JOB   VARCHAR2(32 BYTE) NULL         ,
    PHONE VARCHAR2(32 BYTE)  NULL UNIQUE,
    REGISSTRATIO  VARCHAR2(32 BYTE)  NULL UNIQUE
);




