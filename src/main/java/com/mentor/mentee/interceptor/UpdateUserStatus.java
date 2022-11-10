//package com.mentor.mentee.interceptor;
//
//import com.mentor.mentee.domain.User;
//import com.mentor.mentee.dao.UserDao;
//import lombok.extern.log4j.Log4j;
//import org.springframework.lang.Nullable;
//import org.springframework.web.servlet.HandlerInterceptor;
//import org.springframework.web.servlet.ModelAndView;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//@Slf4j
//public class UpdateUserStatus implements HandlerInterceptor{
//
//    private User loginUserBean;
//    private UserDao userDao;
//
//    public UpdateUserStatus(User loginUserBean, UserDao userDao) {
//        // TODO Auto-generated constructor stub
//        this.loginUserBean = loginUserBean;
//        this.userDao = userDao;
//    }
//
//    @Override
//    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
//                            @Nullable ModelAndView modelAndView) throws Exception {
//        if(loginUserBean.isUserLogin()) {
//            User updateUser = userDao.getUserInfo(loginUserBean.getUser_id());
//            loginUserBean.setUser_idx(updateUser.getUser_idx());
//            loginUserBean.setUser_name(updateUser.getUser_name());
//            loginUserBean.setUser_id(updateUser.getUser_id());
//            loginUserBean.setUser_role(updateUser.getUser_role());
//            loginUserBean.setUser_school(updateUser.getUser_school());
//            loginUserBean.setMentorRoomNo(updateUser.getMentorRoomNo());
//            log.info(loginUserBean);
//        }
////        if(loginUserBean.isUserLogin() == false) {
////            String contextPath = request.getContextPath();
////            response.sendRedirect(contextPath + "/user/not_login");
////            return false;
////        }
//    }
//}
//
//
//
//
//
//
//
//
