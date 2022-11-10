<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 작성</title>
	<style>
		.shadow{
			margin-bottom: 70px;
		}

	</style>
<!-- 공통 CSS -->

	<link rel = stylesheet href="/css/bootstrap.css" >



<!-- 공통 JavaScript -->
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"
			integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
			crossorigin="anonymous"></script>

	<script type="text/javascript" src="/js/common/jquery.js"></script>
	<script type="text/javascript" src="/js/common/jquery.form.js"></script>
	<script type="text/javascript">

	$(document).ready(function(){

	});
		
	/** 게시판 - 목록 페이지 이동 */
	function goBoardList(){				
		location.href = "/board/boardList";
	}
	
	/** 게시판 - 작성  */
	function insertBoard(){

		var boardSubject = $("#board_subject").val();
		var boardContent = $("#board_content").val();
		var boardWriter = $("#board_writer").val();

		if (boardSubject == ""){			
			alert("제목을 입력해주세요.");
			$("#board_subject").focus();
			return;
		}

		if (boardWriter == ""){
			alert("작성자를 입력해주세요.");
			$("#board_writer").focus();
			return;
		}
		
		if (boardContent == ""){			
			alert("내용을 입력해주세요.");
			$("#board_content").focus();
			return;
		}
			
		var yn = confirm("게시글을 등록하시겠습니까?");		
		if(yn){
				
			var filesChk = $("input[name='files[0]']").val();
			if(filesChk == ""){
				$("input[name='files[0]']").remove();
			}
			
			$("#boardForm").ajaxForm({
		    
				url		: "/board/insertBoard",
				enctype	: "multipart/form-data",
				cache   : false,
		        async   : true,
				type	: "POST",					 	
				success : function(obj) {
			    	insertBoardCallback(obj);				
			    },	       
			    error 	: function(xhr, status, error) {}
			    
		    }).submit();
		}
	}

	/** 게시판 - 작성 콜백 함수 */
	function insertBoardCallback(obj){
	
		if(obj != null){		
			
			var result = obj.result;
			
			if(result == "SUCCESS"){				
				alert("게시글 등록을 성공하였습니다.");				
				goBoardList();				 
			} else {				
				alert("게시글 등록을 실패하였습니다.");	
				return;
			}
		}
	}

</script>
</head>
<body>
<%@ include file="../includes/header.jsp" %>
<div class="container" style="margin-top:100px">
	<div class="container" id="shadow">

		<div>
			<div class="card shadow">
				<div class="card-body">
			<h2 align="center">게시글 작성</h2>
			<form id="boardForm" name="boardForm" action="/board/insertBoard" enctype="multipart/form-data" method="post" onsubmit="return false;">
				<table class="table table-success table-sm">
				<caption><strong><span class="$danger">*</span> 표시는 필수입력 항목입니다.</strong></caption>
				    <colgroup>
				        <col width="20%">
				        <col width="*">
				    </colgroup>
				    <tbody id="tbody">
						<tr>
							<th>제목<span class="$danger" >*</span></th>
							<td><input id="board_subject" name="board_subject" value="" class="tbox01"
									   placeholder="제목을 입력해주세요"/></td>
						</tr>
						<tr>
							<th>작성자<span class="$danger">*</span></th>
							<td><input id="board_writer" name="board_writer" value="" class="tbox01"
									   placeholder="작성자를 입력해주세요"/></td>
						</tr>
						<tr>
							<th>내용<span class="$danger">*</span></th>
							<td><textarea id="board_content" name="board_content" style="height: 100px; weight:450px" class="form-floating"
										  placeholder="내용을 입력해주세요"></textarea></td>
						</tr>
						<tr>
							<th scope="row">첨부파일</th>
							<td><input type="file" id="files[0]" name="files[0]" value=""></td>
						</tr>
				    </tbody>
				</table>
				<div style="text-align: right; margin-bottom: 1%;">
					<button type="button" class="btn btn-primary" onclick="javascript:goBoardList();">목록으로</button>
					&nbsp;
					<button type="button" class="btn btn-primary" onclick="javascript:insertBoard();">등록하기</button>
				</div>
			</form>

		</div>
	</div>
</div>
<%@ include file="../includes/footer.jsp" %>
</body>
</html>