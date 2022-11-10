package com.mentor.mentee.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mentor.mentee.domain.BoardFile;
import com.mentor.mentee.domain.User;
import com.mentor.mentee.service.BoardService;

@Controller
@RequestMapping(value = "/board")
public class BoardController {

    @Autowired
    private BoardService boardService;

    
    @Resource(name = "loginUserBean")
    private User loginUserBean;

    /** 게시판 - 목록 페이지 이동 */
    @GetMapping("/boardList")
    public String boardList(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return "board/boardList";
    }
    /** 게시판 - 목록 조회 */
    @GetMapping("/getBoardList")
    @ResponseBody
    public List<BoardFile> getBoardList(BoardFile boardForm) throws Exception {
        return boardService.selectBoards(boardForm);
    }	

    /** 게시판 - 상세 페이지 이동 */
    @GetMapping("/boardDetail")
    public String boardDetail(HttpServletRequest request, HttpServletResponse response) throws Exception {

        return "board/boardDetail";
    }


    /** 게시판 - 첨부파일 다운로드 */
    @GetMapping("/fileDownload")
    public ModelAndView fileDownload(@RequestParam("fileNameKey") String fileNameKey
            ,@RequestParam("fileName") String fileName
            ,@RequestParam("filePath") String filePath) throws Exception {

        /** 첨부파일 정보 조회 */
        Map<String, Object> fileInfo = new HashMap<String, Object>();
        fileInfo.put("fileNameKey", fileNameKey);
        fileInfo.put("fileName", fileName);
        fileInfo.put("filePath", filePath);

        return new ModelAndView("fileDownloadUtil", "fileInfo", fileInfo);
    }
}