<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/includes/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>과제 정보</title>
</head>
<style>
    .wrapper{
        margin: 5vh 0;
    }

    .study-information{
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .table{
        height: 50vh;
        vertical-align:middle;
    }
    .submitBtn{
        display: flex;
        justify-content: center;
    }
    th{
        text-align: center;
    }

</style>
<body>
    <div class="wrapper">
        <div class="container-sm study-information">
            <table class="table">
                <thead class="thead-dark">
                    <tr style="background-color: #066173">
                        <th scope="col" colspan="2" style="color:white; height:5vh" >과제 정보</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th scope="row" >과제명</th>
                        <td><c:out value="${homeWorkInfo.hwName}"/> </td>
                    </tr>

                    <tr>
                        <th scope="row">과제 기한</th>
                        <td><c:out value="${homeWorkInfo.hwDeadLine}"/> </td>
                    </tr>

                    <tr>
                        <th scope="row">과제 내용</th>
                        <td><c:out value="${homeWorkInfo.hwContent}"/> </td>
                    </tr>

                    <tr>
                        <th scope="row">제출 상태</th>
                        <c:choose>
                            <c:when test="${homeWork != null}">
                                <td><c:out value="${homeWork.hwRegDate} 제출완료"/> </td>
                            </c:when>
                            <c:otherwise>
                                <td><c:out value="과제를 제출해 주세요"/> </td>
                            </c:otherwise>
                        </c:choose>

                    </tr>

                </tbody>
            </table>
        </div>
        <div class="submitBtn">
            <c:choose>
                <c:when test="${homeWork != null}">
                    <button type="button" class="btn btn-outline-success btn-sm"
                            onclick="location.href='HomeWorkModifyForm'">제출 과제 수정 / 삭제</button>
                </c:when>
                <c:otherwise>
                    <button type="button" class="btn btn-outline-success btn-sm"
                            onclick="location.href='HomeWorkSubmitForm'">제출하기</button>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</body>

</html>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
