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
<c:import url="/WEB-INF/views/includes/header.jsp"/>
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
				<td data-col="credate"></td>
			</tr>
			<tr>
				<td colspan="2" data-col="boardContent"></td>
			</tr>
			<tr>
				<th colspan="2">
					<button onclick="location.href='/views/board/board-update'">수정</button>
					<button onclick="deleteBoard()">삭제</button>
				</th>
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

		function deleteBoard(){
			const data = {
					boardNum : ${param.boardNum}
			}
			$.ajax({
				type : 'DELETE',
				url : '/boards',
				accept : "application/json",
				data : JSON.stringify(data),
				contentType:'application/json',
				success : function(res) {
					if(res==1){
						alert('정상적으로 삭제 되었습니다.');
						location.href='/views/board/board-list';
					}
				}
			})
		}
	</script>
	<c:import url="/WEB-INF/views/includes/footer.jsp"/>
</body>
</html>