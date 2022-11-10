-- 테이블 제거(초기화시 이용)
drop table board;
drop table reply;

-- 게시판 테이블 생성
CREATE TABLE board
(
    boardNo      NUMBER(20) primary key,
    boardTitle   VARCHAR2(200)  not null,
    boardContent VARCHAR2(3000) not null,
    user_name    VARCHAR2(50)   not null,
    regDate      DATE DEFAULT SYSDATE,
    updateDate   DATE DEFAULT SYSDATE,
    boardName    varchar2(50)   not null
);

-- 댓글 테이블
CREATE TABLE reply
(
    replayNo number(15) primary key,
    boardNo  number(15)     not null,
    reply    varchar2(3000) not null,
    replyer  varchar2(250)  not null
);


-- 테이블 확인
select *from board;
select*from reply;



