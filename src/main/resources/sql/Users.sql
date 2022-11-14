--테이블 초기화 용
drop table USERS;
drop sequence USER_idx_seq;

-- 테이블 , 시퀀스 생성
create sequence USER_idx_seq start with 1 increment by 1;
CREATE TABLE USERS
(
    USER_IDX    INT       NOT NULL,
    MENTORROOMNO INT,
    USER_ROLE   INT       NOT NULL,
    USER_NAME   VARCHAR2(30) NOT NULL,
    USER_ID     VARCHAR2(30) NOT NULL,
    USER_PW     VARCHAR2(35) NOT NULL,
    USER_PW2    VARCHAR2(35) NOT NULL,
    USER_EMAIL  VARCHAR2(30) NOT NULL,
    USER_PHONE  VARCHAR2(30) NOT NULL,
    USER_GENDER INT NOT NULL,
    USER_SCHOOL VARCHAR2(30) NOT NULL,
    PRIMARY KEY(USER_ID)
);
-- 테이블 확인용
select * from USERS;



-- 커밋
commit;





