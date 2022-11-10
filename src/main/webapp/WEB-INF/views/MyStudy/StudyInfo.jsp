<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../includes/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="root"/>
<style>
    .study-information{
        margin-top: 40px;
        margin-bottom: 40px;
        width: 70%;
    }

    table{
        height: 70%;
        width: 50%;
    }

    th, td {
        vertical-align : middle;
    }

    th{
        text-align: center;
        width:30%;
    }
    .centerBtn{
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .hwBtn{
        display: flex;
        justify-content: space-between;
        align-items: center;
        height: 100%;
    }
</style>

<div class="container-sm study-information">
<table class="table">
    <thead class="thead-light">
    <tr style="background-color: #066173">
        <th scope="col" colspan="2" style="color:white; height:70px" >스터디 정보</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <th scope="row" >스터디 이름</th>
        <td><c:out value=" ${mentorRoom.title}" /></td>
    </tr>
    <tr>
        <th scope="row">멘토</th>
        <td><c:out value=" ${mentorRoom.user_id}" /></td>
    </tr>
    <tr>
        <th scope="row">멘토님 학교</th>
        <td><c:out value=" ${mentorRoom.school}" /></td>
    </tr>
    <tr>
        <th scope="row">멘토 경력</th>
        <td><c:out value=" ${mentorRoom.career}" /></td>
    </tr>
    <tr>
        <th scope="row"> 기간 </th>
        <td><c:out value=" ${mentorRoom.studyPeriod}" /></td>
    </tr>
    <tr>
        <th scope="row">스터디 내용</th>
        <td><c:out value=" ${mentorRoom.content}" /></td>
    </tr>
    <tr>
        <th scope="row">현재인원 / <br> 모집인원</th>
        <td><c:out value="${mentorRoom.nowCapacity}  /  ${mentorRoom.capacity} 명" /> </td>
    </tr>
    <tr>
        <th scope="row">진행중인 과제</th>
        <%--<c:if test="${과제 == null}">버튼 넣기</c:if> 과제 있는지 없는지 체크할것 --%>
        <td class="hwBtn">
            <c:choose>
                <%--멘토일때--%>
                <c:when test="${loginUser.user_role == 1}">
                    <c:choose>
                        <%--과제가 있을때(멘토)--%>
                        <c:when test="${checkHomeWork}">
                            <c:out value="현재 진행중인 과제가 있습니다"/>
                            <button type="button" class="btn btn-outline-success btn-sm"
                                    onclick="location.href='/MyStudy/MentorHomeWorkInfo'" >과제 정보</button><br><br>
                        </c:when>
                        <%-- 과제가 없을때--%>
                        <c:otherwise>
                            <c:out value="현재 진행중인 과제가 없습니다"/>
                            <button type="button" class="btn btn-outline-success btn-sm"
                                    onclick="location.href='/MyStudy/UploadHomeWork'">과제 생성</button><br><br>
                        </c:otherwise>
                    </c:choose>
                </c:when>

                <%--멘티일때--%>
                <c:when test="${loginUser.user_role == 2}">
                    <c:choose>
                        <%--과제가 있을때(멘티)--%>
                        <c:when test="${checkHomeWork}">
                            <c:out value="현재 진행중인 과제가 있습니다"/>
                            <button type="button" class="btn btn-outline-success btn-sm"\
                                    onclick="location.href='/MyStudy/MenteeHomeWorkInfo'">과제 정보 </button>
                        </c:when>
                        <%-- 과제가 없을때--%>
                        <c:otherwise>
                            <c:out value="현재 진행중인 과제가 없습니다"/>
                        </c:otherwise>
                    </c:choose>
                </c:when>
            </c:choose>
        </td>
    </tr>
    </tbody>
</table>
    <div class="centerBtn">
    <c:if test="${loginUser.user_role == 1}">
        <button type="button" class="btn btn-outline-success btn-sm"
                onclick="location.href='/MentorRoom/modifyRoom'">스터디 정보 수정하기</button>
    </c:if>
    </div>
</div>
<%@ include file="../includes/footer.jsp"%>