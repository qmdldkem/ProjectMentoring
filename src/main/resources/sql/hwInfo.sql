-- 테이블 삭제(초기화용)
drop table hwInfo;

-- 테이블 생성(생성용)
CREATE TABLE hwInfo
(
    HWNAME         VARCHAR2(300) NOT NULL,
    HWCONTENT      VARCHAR2(300) NOT NULL,
    WRITER         VARCHAR2(50)  NOT NULL primary key,
    HWREGDATE      DATE,
    HWDEADLINE     DATE,
    CompleteMentee NUMBER DEFAULT 0
);

-- 테이블 확인
select *
from hwInfo;


--커밋
commit;

delete
from hwInfo;
