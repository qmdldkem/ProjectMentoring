package com.mentor.mentee.dao;


import java.util.List;

import org.springframework.stereotype.Repository;

import com.mentor.mentee.domain.HomeWork;
import com.mentor.mentee.domain.HomeWorkInfo;
import com.mentor.mentee.domain.MentorRoom;
import com.mentor.mentee.mapper.MyStudyMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
@RequiredArgsConstructor
public class MyStudyDao {

    final MyStudyMapper mapper;

    public MentorRoom getMyStudyRoom(String mentor_id){
        return mapper.getMyStudyRoom(mentor_id);
    }

    public int uploadHomeWorkInfo(HomeWorkInfo homeWorkInfo) {
        return mapper.uploadHomeWorkInfo(homeWorkInfo);
    }

    public HomeWorkInfo getHomeWorkInfo(String mentor_id) {
        return mapper.getHomeWorkInfo(mentor_id);
    }

    public void homeWorkSubmit(HomeWork homeWork) {
        mapper.homeWorkSubmit(homeWork);
    }

    public int checkHomeWork(String mentor_id) {
        return mapper.checkHomeWork(mentor_id); // count HomeWorkInfo table
    }

    public List<HomeWork> getHomeWorkList(String user_id) {
        return mapper.getHomeWorkList(user_id);
    }

    public int modifyHwInfo(HomeWorkInfo hwInfo) {
        log.info("MyStudyMapper의 modifyHwInfo 실행");
        return mapper.modifyHwInfo(hwInfo);
    }

    public int deleteHwInfo(String writer) {
        return mapper.deleteHwInfo(writer);
    }

    public HomeWork getHomeWork(String user_id) {
        return mapper.getHomeWork(user_id);
    }
}
