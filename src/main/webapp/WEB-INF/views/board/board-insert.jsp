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
<form method="POST" action="/boards" id="form">
	<table class="table">
		<thead>
			<tr>
				<th scope="col">제목</th>
				<td>
					<input type="text" name="boardTitle" id="boardTitle">
				</td>
			</tr>
			<tr>
				<th scope="col">내용</th>
				<td>
					<textarea name="boardContent" id="boardContent">
					</textarea>
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<button type="button" onclick="insertBoard()">등록</button>
					<button>뒤로가기</button>
				</th>
			</tr>
		</thead>
	</table>
	<input type="hidden" name="boardParentNum" value="0">
	<input type="hidden" name="creusr" value="1">
	<input type="hidden" name="modusr" value="1">
</form>
	<script>
		function insertBoard(){
			const data = {};
			$('[name]').each(function(idx, item){
				data[item.name] = item.value;
			})
			console.log(data);
			$.ajax({
				type:'POST',
				url:'/boards',
				contentType:'application/json',
				data:JSON.stringify(data),
				success:function(res){
					if(res==1){
						alert('정상 등록 되었습니다.');
						location.href='/views/board/board-list';
					}
				}
			})
		}
	</script>
</body>
</html>