package com.mentor.mentee.domain;

import lombok.Data;
import lombok.RequiredArgsConstructor;

import java.sql.Date;


@Data
@RequiredArgsConstructor
public class HomeWorkInfo {

    private String hwName;
    private String hwContent;
    private String writer; // 숙제 내준 멘토
    private Date hwRegDate;
    private Date hwDeadLine;
    private int completeMentee;

}
