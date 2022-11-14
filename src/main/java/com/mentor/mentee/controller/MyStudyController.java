package com.mentor.mentee.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.mentor.mentee.domain.HomeWork;
import com.mentor.mentee.domain.HomeWorkInfo;
import com.mentor.mentee.domain.MentorRoom;
import com.mentor.mentee.domain.User;
import com.mentor.mentee.service.MyStudyService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/MyStudy")
@RequiredArgsConstructor
public class MyStudyController {

    final MyStudyService myStudyService;

    @Resource(name = "loginUserBean")
    private User loginUserBean;

    @GetMapping("/StudyInfo")
    public String myStudy(Model model){
        // 접속한 회원의 멘토룸 정보
        log.info("접속한 loginUserBean : "+loginUserBean);
        String userId = loginUserBean.getUserId();
        MentorRoom mentorRoom =  myStudyService.getMyStudyRoom(userId);
        //접속한 회원의 과제 유무 체크
        boolean checkHomeWork = myStudyService.checkHomeWork(userId);

        model.addAttribute("mentorRoom", mentorRoom);
        model.addAttribute("checkHomeWork", checkHomeWork);
        return "/MyStudy/StudyInfo";
    }

    @GetMapping("/UploadHomeWork")
    public String uploadHomeWork(User user){
        return "/MyStudy/UploadHomeWork";
    }

    @PostMapping("/UploadSuccess")
    public String uploadSuccess(HomeWorkInfo homeWorkInfo, Model model){

        String userId = loginUserBean.getUserId();

        homeWorkInfo.setWriter(userId);

        int success = myStudyService.uploadHomeWorkInfo(homeWorkInfo);
        model.addAttribute("homeWork", homeWorkInfo);

        return "redirect:/MyStudy/MentorHomeWorkInfo";
    }

    @GetMapping("/MentorHomeWorkInfo")
    public String mentorHomeWorkInfo (Model model) {

        String userId = loginUserBean.getUserId();

        HomeWorkInfo homeWorkInfo = myStudyService.getHomeWorkInfo(userId);
        MentorRoom mentorRoom = myStudyService.getMyStudyRoom(userId);
        List<HomeWork> hwList = myStudyService.getHomeWorkList(userId);

        model.addAttribute("hwList", hwList);
        model.addAttribute("homeWork", homeWorkInfo);
        model.addAttribute("mentorRoom", mentorRoom);

        return "/MyStudy/MentorHomeWorkInfo";
    }

    @GetMapping("/MenteeHomeWorkInfo")
    public String menteeHomeWorkInfo(Model model){

        String userId = loginUserBean.getUserId();
        HomeWorkInfo homeWorkInfo = myStudyService.getHomeWorkInfo(userId);
        HomeWork homeWork = myStudyService.getHomeWork(userId);

        model.addAttribute("homeWork", homeWork);
        model.addAttribute("homeWorkInfo", homeWorkInfo);

        return "/MyStudy/MenteeHomeWorkInfo";
    }

    @GetMapping("/HomeWorkSubmitForm")
    public String homeWorkSubmit(Model model){

        String userId = loginUserBean.getUserId();
        HomeWorkInfo homeWorkInfo = myStudyService.getHomeWorkInfo(userId);

        model.addAttribute("homeWorkInfo", homeWorkInfo);

        return "/MyStudy/HomeWorkSubmitForm";
    }

    @PostMapping("/HomeWorkSubmit")
    public String homeWorkSubmit(HomeWork homeWork, MultipartFile[] uploadFile){

        myStudyService.homeWorkSubmit(homeWork, uploadFile);

        return "redirect:/MyStudy/MenteeHomeWorkInfo";
    }

    @GetMapping("/HomeWorkModifyForm")
    public String homeWorkModify(Model model){

        String userId = loginUserBean.getUserId();
        HomeWorkInfo homeWorkInfo = myStudyService.getHomeWorkInfo(userId);

        model.addAttribute("homeWorkInfo", homeWorkInfo);

        return "/MyStudy/HomeWorkModifyForm";
    }

}
