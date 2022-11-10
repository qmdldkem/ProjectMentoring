package com.mentor.mentee.mapper;

import com.mentor.mentee.domain.MentorRoom;
import org.apache.ibatis.annotations.*;

@Mapper
public interface MentorRoomMapper {

    //Insert MentorRoom
    int createRoom(MentorRoom mentorRoom);

    // Update MentorRoom
    int updateRoom(MentorRoom mentorRoom);

    // Select RoomINFO BY num
    MentorRoom getRoomInfoByNum(int num);

    // Select RoomINFO BY user_id
    MentorRoom getRoomInfoByID(String user_id);

    // Select RoomNUM BY user_id
    int getRoomNoByID(String user_id);

    // Delete RoomINFO BY user_id
    int delRoomInfo(String user_id);




}

