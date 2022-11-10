package com.mentor.mentee.domain;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.constraints.*;

@Data
public class User {
    public User() {
        this.userIdExist = false;
        this.userEmailExist = false;
        this.userLogin = false;
    }
    private int user_idx;
    private int mentorRoomNo;
    private int user_role;
    @Size(min=2, max=5)
    @Pattern(regexp = "[가-힣]*")
    private String user_name;
    @Size(min=4, max=20)
    @Pattern(regexp = "[a-zA-Z0-9]*")
    private String user_id;
    @Size(min=4, max=20)
    @Pattern(regexp = "[a-zA-Z0-9]*")
    private String user_pw;
    @Size(min=4, max=20)
    @Pattern(regexp = "[a-zA-Z0-9]*")
    private String user_pw2;

    @Email(message = "올바른 이메일 주소를 입력해주세요.")
    private String user_email;
    @Size(min=13, max=13)
    @Pattern(regexp = "^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$")
    private String user_phone;
    @Pattern(regexp = "[1-2]")
    private String user_gender;
    @Size(min=4, max=20)
    private String user_school;

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
