-- 테이블 삭제(초기화)
drop table homework;

-- 테이블 생성
create table homework(
    mentorId varchar2(30), --HomeWork를 내준 멘토 이름
    user_id varchar2(30), -- HomeWork 제출자
    content varchar2(3000), -- 내용
    hwRegDate date, -- 제출일, 수정일
    uuid varchar2(200), -- 파일명 중복방지 id
    filename varchar2(200), -- 제출 파일 이름
    uploadPath varchar2(200) -- 서버에 저장된 경로
);

-- 테이블 확인
select * from homework;

insert into homework values('a', 'a', 'a,', sysdate, '1', '1', '1');

-- 커밋
commit ;