package com.mentor.mentee.service;
import com.mentor.mentee.dao.UserDao;
import com.mentor.mentee.domain.MentorRoom;
import com.mentor.mentee.domain.User;
import lombok.RequiredArgsConstructor;
import com.mentor.mentee.mapper.MentorRoomMapper;
import com.mentor.mentee.mapper.UserMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Service
@RequiredArgsConstructor
public class MentorRoomService {

    @Resource(name = "loginUserBean")
    private User loginUserBean;

    final UserDao userDAO;
    final UserMapper userMapper;
    final MentorRoomMapper roomMapper;

    // GET userInfo BY userId
    public User getUserByID(String userId){
        return userDAO.getUserInfo(userId);
    }

    // GET roomInfo BY userId
    public MentorRoom getRoomInfoByID(String userId){
        return roomMapper.getRoomInfoByID(userId);
    }

    // Insert roomInfo
    @Transactional
    public void createRoom(MentorRoom roomInfo, String userId) {
        if(roomInfo.getUserId()==null){
            roomInfo.setUserId(userId);
        }
        roomInfo.setNum(0);
        roomMapper.createRoom(roomInfo);
        int roomNo = getRoomNoByID(userId); //id로 만들어진 roomNum 조회
        usersAddRoomNo(roomNo, userId);
    }

    // Delete roomInfo
    public void delRoomInfo(String userId){
        roomMapper.delRoomInfo(userId);
        userMapper.updateRoomNo(0, userId);
        loginUserBean.setMentorRoomNo(0);
    }

    // Update roomInfo
    public void updateRoom(MentorRoom mentorRoom){
        mentorRoom.setUserId(loginUserBean.getUserId());
        roomMapper.updateRoom(mentorRoom);
    }

    // Update RoomNUM TO users (BY userId)
    public void usersAddRoomNo(int mentorRoomNo, String userId){
        userMapper.updateRoomNo(mentorRoomNo, userId);
        loginUserBean.setMentorRoomNo(mentorRoomNo);
    }

    // Select RoomNUM (BY userId)
    public int getRoomNoByID(String userId){
        int roomNum = roomMapper.getRoomInfoByID(userId).getNum();
        return roomNum;
    }

    //CHECK RoomNum BY userId
    public boolean getAssignedRoomNo(String userId){
        if(roomMapper.getRoomInfoByID(userId) == null){
            return false;
        } else{
            return true;
        }
    }

}
