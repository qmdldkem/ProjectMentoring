package com.mentor.mentee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.mentor.mentee.service.UserService;

@RestController
public class RestApiController {

    @Autowired
    private UserService userService;

    @GetMapping("/user/checkUserIdExist/{user_id}")
    public String checkUserIdExist(@PathVariable String user_id) {

        boolean chk = userService.checkuserIdExist(user_id);

        return chk + "";
    }

    @GetMapping("/user/checkUserEmailExist/{user_email}")
    public String checkUserEmailExist(@PathVariable String user_email) {
        System.out.println(user_email);
        boolean chk1 = userService.checkuserEmailExist(user_email);
        System.out.println(chk1);
        return chk1 + "";
    }

}


