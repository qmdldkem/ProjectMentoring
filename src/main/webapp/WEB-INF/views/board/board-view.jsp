<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/views/common/import.jsp"></c:import>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table class="table">
		<thead>
			<tr>
				<th scope="col">번호</th>
				<td data-col="boardNum"></td>
			</tr>
			<tr>
				<th scope="col">제목</th>
				<td data-col="boardTitle"></td>
			</tr>
			<tr>
				<th scope="col">작성자</th>
				<td data-col="crename"></td>
			</tr>
			<tr>
				<th scope="col">작성시간</th>
				<td data-col="credat"></td>
			</tr>
			<tr>
				<td colspan="2" data-col="boardContent"></td>
			</tr>
		</thead>
	</table>
	<script>
		$(document).ready(function() {
			getBoard();
		})

		function getBoard() {
			$.ajax({
				type : 'GET',
				url : '/boards/${param.boardNum}',
				accept : "application/json",
				success : function(res) {
					const keys = Object.keys(res);
					for(let i=0;i<keys.length;i++){
						const key = keys[i];
						$('[data-col="' + key + '"]').html(res[key]);
					}
				}
			})
		}

		function goBoardView(boardNum) {
			location.href = '/views/board/board-view?boardNum=' + boardNum;
		}
	</script>
</body>
</html>