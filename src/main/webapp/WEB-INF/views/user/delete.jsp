<%--
  Created by IntelliJ IDEA.
  User: Lee
  Date: 2022-10-31
  Time: 오전 11:32
  To change this template use File | Settings | File Templates.
--%>
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
  <title>회원 탈퇴</title>
  <style>
    .shadow{
      margin-bottom: 70px;
    }

  </style>
  <!-- Bootstrap CDN -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

</head>
<script>
  function checkUserEmailExist(){

    var user_email = $("#user_email").val()

    if(user_email.length == 0){
      alert('이메일을 입력해주세요')
      return
    }
    $.ajax({
      url : '${root}user/checkUserEmailExist/' + user_email+'.',
      type : 'get',
      // data : {'email' : user_email},
      dataType : 'text',


      success : function(result){
        if(result.trim() == 'true'){
          alert('사용할 수 있는 이메일입니다')
          $("#userEmailExist").val('true')
        } else {
          alert('사용할 수 없는 이메일 입니다')
          $("#userEmailExist").val('false')
        }
      }
    })
  }


  function resetUserEmailExist(){
    $("#userEmailExist").val('false')
  }


</script>
<body>

<c:import url="/WEB-INF/views/includes/header.jsp"/>
<div class="container" style="margin-top:100px">
  <div class="row">
    <div class="col-sm-3"></div>
    <div class="col-sm-6">
      <div class="card shadow">
        <div class="card-body">
          <form:form action='${root}user/delete_pro' method='post' modelAttribute="deleteUserBean">
<%--            <form:hidden path="userEmailExist"/>--%>
            <div class="form-group">
              <form:label path="user_name">이름</form:label>
              <form:input path="user_name" class='form-control' readonly="true"/>
            </div>
            <div class="form-group">
              <form:label path="user_id">아이디</form:label>
              <form:input path="user_id" class='form-control' readonly="true"/>
            </div>
            <div class="form-group">
              <form:label path="user_pw">현재 비밀번호</form:label>
              <form:password path="user_pw" class='form-control'/>
              <form:errors path='user_pw' style='color:red'/>
            </div>
            <div class="form-group">
              <form:label path="user_pw2">비밀번호 확인</form:label>
              <form:password path="user_pw2" class='form-control'/>
              <form:errors path='user_pw2' style='color:red'/>
            </div>
<%--            <!-- 이메일 & 중복확인 -->--%>
<%--            <div class="form-group">--%>
<%--              <form:label path="user_email">이메일</form:label>--%>
<%--              <div class="input-group">--%>
<%--                <form:input path="user_email" class='form-control' onkeypress="resetUserEmailExist()"/>--%>
<%--                <div class="input-group-append">--%>
<%--                  <button type="button" class="btn btn-primary" onclick='checkUserEmailExist()'>중복확인</button>--%>
<%--                </div>--%>
<%--              </div>--%>
<%--              <form:errors path="user_email" style='color:red'/>--%>
              <!-- 전화번호 -->
<%--              <div class="form-group">--%>
<%--                <form:label path="user_phone">전화번호 ( - 포함 13자리 입력)</form:label>--%>
<%--                <form:input path="user_phone" class='form-control' width="80px"/>--%>
<%--                <form:errors path="user_phone" style='color:red'/>--%>
<%--              </div>--%>
              <br>
              <div class="form-group">
              <div class="text-right">
                <form:button class='btn btn-primary'>회원탈퇴</form:button>
              </div>
            </div>
          </form:form>
        </div>
      </div>
    </div>
    <div class="col-sm-3"></div>
  </div>
</div>

<c:import url="/WEB-INF/views/includes/footer.jsp"/>

</body>
</html>
