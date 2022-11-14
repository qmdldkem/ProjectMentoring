-- 멘토룸 테이블 삭제(초기화)
drop table MENTORROOM;
drop sequence mentor_room_seq;

-- 시퀀스, 테이블 생성
create sequence mentor_room_seq start with 1 increment by 1;
CREATE TABLE MENTORROOM
(
    NUM             NUMBER        NOT NULL primary key,
    USER_ID         VARCHAR2(20),
    TITLE           VARCHAR2(200) NOT NULL,
    STUDY_PERIOD     VARCHAR2(150) NOT NULL,
    STUDY_WEEKLY     VARCHAR(20),
    STUDYTIMESTART  VARCHAR2(10)  NOT NULL,
    STUDYTIMEEND    VARCHAR2(10)  NOT NULL,
    CAPACITY        NUMBER        NOT NULL,
    NOW_CAPACITY     NUMBER        DEFAULT 0,
    CAREER          VARCHAR2(1000),
    SCHOOL          VARCHAR2(30)  NOT NULL,
    CONTENT         VARCHAR2(1000)
);

-- 테이블 체크
select * from MENTORROOM;

-- 테스트용 더미
INSERT INTO MENTORROOM ( num, user_id, title, studyPeriod, studyWeekly, studytimestart, studyTimeEnd, capacity, nowcapacity, career, school, content)
values ( mentor_room_seq.nextval, '김멘토','김멘토의 스터디룸','2022/11/01 - 2022/11/02', '1,5', '09:00', '18:00',  30, 0, 1, '서울대학교', '열공을 하는 모임입니다.');


INSERT INTO MentorRoom
    (num, user_id,  title,
    studyPeriod, studyWeekly, studyTimeStart, studyTimeEnd,
    capacity, nowCapacity, career, school, content)
    values (mentor_room_seq.nextval,'mentor_id',  '스터디룸',
    '2022/01/01 - 2022/12/31', '2,3', '09:00', '18:00',
    30, 0, '경력1,경력2', '연세대', '스터디상세설명');
commit;


