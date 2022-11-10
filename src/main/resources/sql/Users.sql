--테이블 초기화 용
drop table users;
drop sequence user_idx_seq;

-- 테이블 , 시퀀스 생성
create sequence user_idx_seq start with 1 increment by 1;
CREATE TABLE USERS
(
    user_idx    number       Not null,
    mentorRoomNo number,
    user_role   NUMBER       NOT NULL,
    user_name   VARCHAR2(30) NOT NULL,
    user_id     VARCHAR2(30) NOT NULL primary key,
    user_pw     VARCHAR2(35) NOT NULL,
    user_pw2    VARCHAR2(35) NOT NULL,
    user_email  VARCHAR2(30) NOT NULL,
    user_phone  VARCHAR2(30) NOT NULL,
    user_gender NUMBER NOT NULL,
    user_school VARCHAR2(30) NOT NULL
);

-- 테이블 확인용
select * from users;



-- 커밋
commit;





