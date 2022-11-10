package com.mentor.mentee.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.mentor.mentee.dao.MentorRoomDAO;
import com.mentor.mentee.dao.MyStudyDao;
import com.mentor.mentee.dao.UserDao;
import com.mentor.mentee.domain.HomeWork;
import com.mentor.mentee.domain.HomeWorkInfo;
import com.mentor.mentee.domain.MentorRoom;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class MyStudyService {

    final UserDao userDao;
    final MyStudyDao myStudyDao;
    final MentorRoomDAO mentorRoomDAO;

    public MentorRoom getMyStudyRoom(String user_id) {
        String mentor_id = userDao.getMentorId(user_id);
        return myStudyDao.getMyStudyRoom(mentor_id);
    }

    public int uploadHomeWorkInfo(HomeWorkInfo homeWorkInfo) {
        return myStudyDao.uploadHomeWorkInfo(homeWorkInfo);
    }

    public List<HomeWork> getHomeWorkList(String user_id) {
        return myStudyDao.getHomeWorkList(user_id);
    }

    public HomeWorkInfo getHomeWorkInfo(String user_id) {
        String mentor_id = userDao.getMentorId(user_id);
        return myStudyDao.getHomeWorkInfo(mentor_id);
    }

    public boolean checkHomeWork(String user_id){
        String mentor_id = userDao.getMentorId(user_id);

        if(myStudyDao.checkHomeWork(mentor_id) > 0)
            return true;

        return false;
    }

    public void homeWorkSubmit(HomeWork homeWork, MultipartFile[] uploadFile){
        HomeWork uploadedHomeWork = uploadFileToServer(homeWork, uploadFile);
        log.info("HomeWork 업로드실행 : "+uploadedHomeWork.toString());
        myStudyDao.homeWorkSubmit(homeWork);
    }

    private String getFolder(){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        String str = sdf.format(date);
        log.info("저장경로 c:upload\\temp\\" + str.replace("-", File.separator));
        return str.replace("-", File.separator);

    }

    public int modifyHwInfo(HomeWorkInfo hwInfo) {
        return myStudyDao.modifyHwInfo(hwInfo);
    }

    public int deleteHwInfo(String writer) {
        return myStudyDao.deleteHwInfo(writer);
    }

    public HomeWork getHomeWork(String user_id) {
        return myStudyDao.getHomeWork(user_id);
    }

    public HomeWork uploadFileToServer(HomeWork homeWork, MultipartFile[] uploadFile){
        String uploadFolder = "C:\\upload\\temp";
        log.info("첨부된 파일은 c:upload\\temp 폴더에 저장됩니다, 에러시 폴더가 있는지 확인");

        String uploadFolderPath = getFolder(); // 년/월/일
        // 폴더 생성
        File uploadPath = new File(uploadFolder, uploadFolderPath);
        if(!uploadPath.exists()){
            uploadPath.mkdirs();
        }

        for(MultipartFile multi : uploadFile){
            if(!multi.isEmpty()) {
                String originalFileName = multi.getOriginalFilename();
                log.info("==========================");
                log.info("upload File name :" + originalFileName);
                log.info("upload File Size : " + multi.getSize());

                //IE는 파일 경로도 같이 전송되므로 잘라준다
                String uploadFileName = originalFileName.substring(originalFileName.lastIndexOf("\\")+1);
                // 중복 파일명 방지를 위한 난수
                UUID uuid = UUID.randomUUID();

                homeWork.setUuid(uuid.toString());
                homeWork.setUploadPath(uploadFolderPath);
                homeWork.setFilename(uploadFileName);

                uploadFileName = uuid.toString() + "_" + uploadFileName;

                File saveFile = new File(uploadPath, uploadFileName);

                try{
                    multi.transferTo(saveFile);
                }catch (Exception e){
                    log.error(e.getMessage());
                }
            }

        }
        return homeWork;
    }
}
