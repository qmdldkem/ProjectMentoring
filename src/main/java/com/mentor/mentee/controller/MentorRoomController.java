package com.mentor.mentee.controller;

import com.mentor.mentee.dao.UserDao;
import com.mentor.mentee.domain.MentorRoom;
import com.mentor.mentee.domain.User;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.mentor.mentee.service.MentorRoomService;
import com.mentor.mentee.service.MyStudyService;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


@Controller
@RequestMapping("/MentorRoom")
@RequiredArgsConstructor
public class MentorRoomController {

    @Resource(name = "loginUserBean")
    private User loginUserBean;

    final UserDao userDao;
    final MentorRoomService mentorRoomService;
    final MyStudyService myStudyService;
    final HomeController homeController;

    //스터디개설
    @GetMapping("/createRoom")
    public String CreateMentorRoom(HttpServletResponse response) throws IOException {
        //userId 앞으로 개설된 방 있는지 확인
        boolean result = mentorRoomService.getAssignedRoomNo(loginUserBean.getUserId());
        if(result){
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('스터디는 한개만 개설할 수 있습니다.');</script>");
            out.close();
//            request.setAttribute("message", "스터디는 한개만 개설할 수 있습니다.");
            return "redirect:/";
        }else{
            return "/MentorRoom/createRoom";
        }
    }

    //스터디개설 후 이동
    @PostMapping("/roomInfo")
    public String createRoom(MentorRoom mentorRoom, Model model){
        mentorRoomService.createRoom(mentorRoom, loginUserBean.getUserId());
        return "redirect:/MyStudy/StudyInfo";
    }

    @GetMapping("/modifyRoom")
    public String modifyRoom(Model model){
        MentorRoom roomInfo = mentorRoomService.getRoomInfoByID(loginUserBean.getUserId());
        model.addAttribute("mentorRoom",roomInfo);
        return "/MentorRoom/modifyRoom";
    }

    @GetMapping("/delRoom")
    public String deleteRoom(){
        mentorRoomService.delRoomInfo(loginUserBean.getUserId());
        return "redirect:/";
    }

    @PostMapping("/modifyedRoom")
    public String modifyedRoom(MentorRoom mentorRoom){
        mentorRoom.toString();
        mentorRoomService.updateRoom(mentorRoom);
        return "redirect:/MyStudy/StudyInfo/";
    }


    @GetMapping("/getRoomInfo")
    public @ResponseBody MentorRoom getRoomInfoByJSON (){
        System.out.println(loginUserBean.getUserId());
        MentorRoom roomInfo = mentorRoomService.getRoomInfoByID(loginUserBean.getUserId());
        System.out.println(roomInfo.toString());
    return roomInfo;
    }

}