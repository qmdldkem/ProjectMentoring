package com.mentor.mentee.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.sql.Date;

@Data
public class HomeWork {

    private String mentorId; //  HomeWork를 내준 멘토 이름
    private String user_id; // HomeWork 제출자
    private String content; // 내용

    @JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    private Date hwRegDate; // 제출일, 수정일
    private String uuid; // 파일명 중복방지 id
    private String filename; // 제출 파일 이름
    private String uploadPath; // 서버에 저장된 경로

    public void setUuid(String uuid) {
        this.uuid += uuid+",";
        this.uuid = this.uuid.replace("null", "");
    }

    public void setFilename(String filename){
        this.filename += filename+",";
        this.filename = this.filename.replace("null", "");
    }

    public void setUploadPath(String uploadPath){
        this.uploadPath += uploadPath +",";
        this.uploadPath = this.uploadPath.replace("null", "");
    }

}
