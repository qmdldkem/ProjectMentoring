<%--
  Created by IntelliJ IDEA.
  User: Lee
  Date: 2022-11-08
  Time: 오전 11:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value='${pageContext.request.contextPath}/'/>
<script>
  alert('탈퇴되었습니다')
  location.href = '${root}'
</script>