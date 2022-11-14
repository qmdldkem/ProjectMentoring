package com.mentor.mentee.dao;

import com.mentor.mentee.mapper.MentorRoomMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mentor.mentee.domain.User;
import com.mentor.mentee.mapper.UserMapper;

@Repository
public class UserDao {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private MentorRoomMapper mentorRoomMapper;

    public String checkUserIdExist(String userId) {
        return userMapper.checkUserIdExist(userId);
    }

    public String checkUserEmailExist(String userEmail) {

        return userMapper.checkUserEmailExist(userEmail);
    }

    public void addUserInfo(User joinUser) {
        userMapper.addUserInfo(joinUser);
    }
    public User getLoginUserInfo(User tempLoginUserBean) {

        System.out.println("dao id : "+tempLoginUserBean.getUserId());
        System.out.println("dao pw : "+tempLoginUserBean.getUserPw());

        return userMapper.getLoginUserInfo(tempLoginUserBean);
    }
    public User getModifyUserInfo(int userIdx) {
        return userMapper.getModifyUserInfo(userIdx);
    }

    public void modifyUserInfo(User modifyUserBean) {
        userMapper.modifyUserInfo(modifyUserBean);
    }

    public User getDeleteUserInfo(int userIdx) {
        return userMapper.getDeleteUserInfo(userIdx);
    }
    public void deleteUserInfo(User deleteUserBean) {
        userMapper.deleteUserInfo(deleteUserBean);
    }


    public User getUserInfo(String userId){
        return userMapper.getUserInfo(userId);
    }


    public String getMentorId(String userId){
        User user = getUserInfo(userId);
        String mentorId = "";

        // 접속해 있는 유저가 멘티라면
        if(user.getUserRole() == 2){
            int mentorRoomNo = user.getMentorRoomNo();
            mentorId = mentorRoomMapper.getRoomInfoByNum(mentorRoomNo).getUserId();
        }else{ // 멘티가 아니라면(멘토라면
            mentorId = userId;
        }
        return mentorId;
    }

}
