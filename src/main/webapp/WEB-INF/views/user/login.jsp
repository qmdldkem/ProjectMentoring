<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>로그인</title>
  <!-- Bootstrap CDN -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>

<c:import url="/WEB-INF/views/includes/header.jsp"/>

<div class="container" style="margin-top:50px">
  <div class="row">
    <div class="col-sm-3"></div>
    <div class="col-sm-6">
      <div class="card shadow">
        <div class="card-body">
          <c:if test="${fail == true }">
            <div class="alert alert-danger">
              <h3>로그인 실패</h3>
              <p>아이디 비밀번호를 확인해주세요</p>
            </div>
          </c:if>
          <form:form action="${root }user/login_pro" method='post' modelAttribute="tempLoginUserBean">
            <div class="form-group">
              <form:label path="user_id">아이디</form:label>
              <form:input path="user_id" class='form-control'/>
              <form:errors path='user_id' style='color:red'/>
            </div>
            <div class="form-group">
              <form:label path="user_pw">비밀번호</form:label>
              <form:password path="user_pw" class='form-control'/>
              <form:errors path='user_pw' style='color:red'/>
            </div>
            <div class="form-group text-right">
              <form:button class='btn btn-primary'>로그인</form:button>
              <a href="${root }user/join" class="btn btn-danger">회원가입</a>
            </div>
            <div id="naverIdLogin">
              <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
              <div class="form-group text-right">
              <ul>
                  <!-- 아래와같이 아이디를 꼭 써준다. -->
                  <a id="naverIdLogin_loginButton" href="javascript:void(0)">
                    <form:button type="button" class="btn btn-outline-success">네이버 로그인</form:button>
                  </a>

                  <a onclick="naverLogout(); return false;" href="javascript:void(0)">
<%--                    <form:button class='btn btn-primary'>네이버 로그아웃</form:button>--%>
                    <form:button type="button" class="btn btn-outline-success">네이버 로그아웃</form:button>
                  </a>
              </ul>
              </div>
              <!-- 네이버 스크립트 -->
              <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>

              <script>

                var naverLogin = new naver.LoginWithNaverId(
                        {
                          clientId: "kQdrOUvQGmn8tnGuvYYE", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
                          callbackUrl: "http://localhost:8080/user/login", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
                          isPopup: false,
                          callbackHandle: true
                        }
                );

                naverLogin.init();

                window.addEventListener('load', function () {
                  naverLogin.getLoginStatus(function (status) {
                    if (status) {
                      var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.

                      console.log(naverLogin.user);

                      if( email == undefined || email == null) {
                        alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
                        naverLogin.reprompt();
                        return;
                      }
                    } else {
                      console.log("callback 처리에 실패하였습니다.");
                    }
                  });
                });


                var testPopUp;
                function openPopUp() {
                  testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
                }
                function closePopUp(){
                  testPopUp.close();
                }

                function naverLogout() {
                  openPopUp();
                  setTimeout(function() {
                    closePopUp();
                  }, 1000);


                }

              </script>
            </div>
          </form:form>
        </div>
      </div>
    </div>
    <div class="col-sm-3"></div>
  </div>
</div>
<br>
<br>
<c:import url="/WEB-INF/views/includes/footer.jsp"/>

</body>

</html>








