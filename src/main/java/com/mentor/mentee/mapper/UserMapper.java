package com.mentor.mentee.mapper;

import com.mentor.mentee.domain.MentorRoom;
import com.mentor.mentee.domain.User;
import org.apache.ibatis.annotations.*;

@Mapper
public interface UserMapper {

    @Select("select userId " +
            "from users " +
            "where userId = #{userId}")
    String checkUserIdExist(String userId);

    @Select("select userEmail " +
            "from users " +
            "where userEmail = #{userEmail}")
    String checkUserEmailExist(String userEmail);

    @Select("select * from users " +
            "where userId=#{userId} and userPw=#{userPw}")
    User getLoginUserInfo(User tempLoginUserBean);

    @Select("select userId, userName from users where userIdx = #{userIdx}")
    User getModifyUserInfo(int userIdx);


    @Update("update users set userPw = #{userPw}, userPw2 = #{userPw2}, userEmail = #{userEmail}, userPhone = #{userPhone} where userIdx = #{userIdx}")
    void modifyUserInfo(User modifyUserBean);

    @Insert("insert into users (userIdx,mentorRoomNo, userRole, userName, userId, userPw, userPw2, userEmail, userPhone, userGender, userSchool) " + "values (userIdx_seq.nextval, 0, #{userRole}, #{userName}, #{userId}, #{userPw}, #{userPw2}, #{userEmail}, #{userPhone}, #{userGender}, #{userSchool})")
    void addUserInfo(User joinUserBean);

    @Select("select * from users where userId = #{userId}")
    User getUserInfo(String userId);

    // 매퍼 테스트용
    @Select("select sysdate from dual")
    public String getTime();

    // mentorRoom 생성 후 users에 mentorRoomNo update
    @Update("update USERS set MENTORROOMNO = #{mentorRoomNo} where userId = #{userId}")
    public int updateRoomNo(@Param("mentorRoomNo") int mentorRoomNo, @Param("userId") String userId);


    @Select("select userId, userName from users where userIdx = #{userIdx}")
    User getDeleteUserInfo(int userIdx);;

    @Delete("delete from users where userIdx = #{userIdx} ")
    void deleteUserInfo(User deleteUserBean);
}

