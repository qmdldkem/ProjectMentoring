-- BOARDFILE 테이블 생성 및 코멘트 추가

CREATE TABLE BOARDFILE
(
    BOARD_SEQ NUMBER NOT NULL '게시글 번호'
    , FILE_NO NUMBER NOT NULL '첨부파일 번호'
    , FILE_NAME_KEY VARCHAR2(200) '첨부파일 암호화명'
    , FILE_NAME VARCHAR2(100) '첨부파일명'
    , FILE_PATH VARCHAR2(200) '첨부파일 경로'
    , FILE_SIZE VARCHAR2(50)  '첨부파일 크기'
    , REMARK VARCHAR2(1000) '비고'
    , DEL_YN VARCHAR2(1) '삭제유무'
    , INS_USER_ID VARCHAR2(20) '입력자ID'
    , INS_DATE DATE '입력일시'
    , UPD_USER_ID VARCHAR2(20) '수정자ID'
    , UPD_DATE DATE  '수정일시'
    , CONSTRAINT BOARDFILE_PK PRIMARY KEY
    (
     BOARD_SEQ
        , FILE_NO
        )
    ENABLE
);

-- BOARDFILE 저장

commit;


-- BOARDFILE 테이블 조회
SELECT *  FROM BOARDFILE;