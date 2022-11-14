package com.mentor.mentee.domain;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.constraints.*;

@Data
@Getter
@Setter
public class User {
    public User() {
        this.userIdExist = false;
        this.userEmailExist = false;
        this.userLogin = false;
    }
    private int userIdx;
    private int mentorRoomNo;
    private int userRole;
    @Size(min=2, max=5)
    @Pattern(regexp = "[가-힣]*")
    private String userName;
    @Size(min=4, max=20)
    @Pattern(regexp = "[a-zA-Z0-9]*")
    private String userId;
    @Size(min=4, max=20)
    @Pattern(regexp = "[a-zA-Z0-9]*")
    private String userPw;
    @Size(min=4, max=20)
    @Pattern(regexp = "[a-zA-Z0-9]*")
    private String userPw2;

    @Email(message = "올바른 이메일 주소를 입력해주세요.")
    private String userEmail;
    @Size(min=13, max=13)
    @Pattern(regexp = "^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$")
    private String userPhone;
    @Pattern(regexp = "[1-2]")
    private String userGender;
    @Size(min=4, max=20)
    private String userSchool;

    private boolean userIdExist;

    private boolean userLogin;

    private boolean userEmailExist;

    public boolean isUserIdExist() {
        return userIdExist;
    }
    public void setUserIdExist(boolean userIdExist) {
        this.userIdExist = userIdExist;
    }
    public boolean isUserLogin() {
        return userLogin;
    }

    public void setUserLogin(boolean userLogin) {
        this.userLogin = userLogin;
    }
}
