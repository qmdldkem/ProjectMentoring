package com.mentor.mentee.service;

import javax.annotation.Resource;

import com.mentor.mentee.dao.MentorRoomDAO;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mentor.mentee.domain.User;
import com.mentor.mentee.dao.UserDao;

@Service
@RequiredArgsConstructor
public class UserService {

    @Autowired
    final UserDao userDao;

    final MentorRoomDAO mentorRoomDAO;

    @Resource(name = "loginUserBean")
    private User loginUserBean;

    public boolean checkuserIdExist(String userId) {

        String userName = userDao.checkUserIdExist(userId);

        if(userName == null) {
            return true;
        } else {
            return false;
        }
    }

    public boolean checkuserEmailExist(String userEmail) {
        System.out.println(userEmail);
        String userEmailCheck = userDao.checkUserEmailExist(userEmail);
        
        if(userEmailCheck == null) {
            return true;
        } else {
            return false;
        }
    }

    public void addUserInfo(User joinUserBean) {
        userDao.addUserInfo(joinUserBean);
    }

    public void getLoginUserInfo(User tempLoginUserBean) {
        System.out.println("service : "+tempLoginUserBean.getUserId());
        System.out.println("service : "+tempLoginUserBean.getUserPw());

        User tempLoginUserBean2 = userDao.getLoginUserInfo(tempLoginUserBean);

        if(tempLoginUserBean2 != null) {
            loginUserBean.setUserIdx(tempLoginUserBean2.getUserIdx());
            loginUserBean.setUserName(tempLoginUserBean2.getUserName());
            loginUserBean.setUserId(tempLoginUserBean2.getUserId());
            loginUserBean.setUserRole(tempLoginUserBean2.getUserRole());
            loginUserBean.setUserSchool(tempLoginUserBean2.getUserSchool());
            loginUserBean.setMentorRoomNo(tempLoginUserBean2.getMentorRoomNo());
            loginUserBean.setUserLogin(true);
        }
    }

    public void getModifyUserInfo(User modifyUserBean) {
        User tempModifyUserBean = userDao.getModifyUserInfo(loginUserBean.getUserIdx());

        modifyUserBean.setUserId(tempModifyUserBean.getUserId());
        modifyUserBean.setUserName(tempModifyUserBean.getUserName());

        modifyUserBean.setUserIdx(loginUserBean.getUserIdx());
    }

    public void modifyUserInfo(User modifyUserBean) {

        modifyUserBean.setUserIdx(loginUserBean.getUserIdx());

        userDao.modifyUserInfo(modifyUserBean);
    }

    public void getDeleteUserInfo(User deleteUserBean) {
        User tempDeleteUserBean = userDao.getDeleteUserInfo(loginUserBean.getUserIdx());

        deleteUserBean.setUserId(tempDeleteUserBean.getUserId());
        deleteUserBean.setUserName(tempDeleteUserBean.getUserName());

        deleteUserBean.setUserIdx(loginUserBean.getUserIdx());
    }
    public void deleteUserInfo(User deleteUserBean) {

        deleteUserBean.setUserIdx(loginUserBean.getUserIdx());

        userDao.deleteUserInfo(deleteUserBean);
    }
    /**
     *  userId를 넣엇을때 mentee의 아이디면 mentor id를 알려주는 method
    */


}











