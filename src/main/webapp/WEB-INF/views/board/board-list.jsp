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
      <th scope="col">제목</th>
      <th scope="col">작성자</th>
      <th scope="col">작성시간</th>
    </tr>
  </thead>
  <tbody id="tBody">
  </tbody>
</table>
<button onclick="location.href='/views/board/board-insert'">글작성</button>
<div id="totalDiv"></div>
<script>
	$(document).ready(function(){
		getBoards();
	})
	
	function getBoards(){
		const data = {
				page : 1,
				pageSize : 10
		}
		//http method post, get
		$.ajax({
			type:'GET',
			url:'/boards', //localhost~호출
			data : data,
			accept: "application/json", //빼도 무방
			success:function(res){ //get방식으로 /boards 갔다가 응답이 잘 왔으면 실행할 내용
				$('#totalDiv').html('총갯수:' + res.total);
				let html = '';
				let list = res.list;
				for(let i=0;i<list.length;i++){
					const board = list[i];
					console.log(board);
					html += '<tr style="cursor:pointer" onclick="goBoardView(' + board.boardNum + ')">';
					html += '<th scope="row">' + board.boardNum + '</th>';
					for(let le=1;le<board.level;le++){
						board.boardTitle = '&nbsp; ㄴ &nbsp;' + board.boardTitle;
					}
					html += '<td>' + board.boardTitle + '</td>';
					html += '<td>' + board.crename + '</td>';
					html += '<td>' + board.credate + '</td>';
					html += '</tr>';
				}
				console.log(html);
				$('#tBody').html(html);
			},
			error : function(err){ // 에러가 났을때 뜨게하기
				console.log(err);
			}

		})
	}
	
	function goBoardView(boardNum){
		location.href='/views/board/board-view?boardNum=' + boardNum;
	}
</script>
<c:import url="/WEB-INF/views/includes/footer.jsp"/>
</body>
</html>