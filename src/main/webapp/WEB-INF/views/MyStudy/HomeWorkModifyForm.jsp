<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/includes/header.jsp"/>
<html>
<head>
    <title>과제 수정</title>
    <style>
        body {
            height: 100%;
        }

        .submit {
            width: 60vw;
            min-height: 100%;
        }

        form {
            margin: 40px 0;
        }

        footer {
            padding: 0;
        }

        .btn {
            margin: 5px;
        }

        .form-row {
            margin: 10px 0;
        }

        textarea {
            resize: none;
        }

        .uploadedFileList{
            padding: 5px;
        }
        .uploadedFileWrapper{
            margin : 15px 0;
        }
    </style>
</head>
<body>

<%-- 아래로 수정 필요--%>
<div class="container submit">
    <form action="/MyStudy/HomeWorkModify" class="submit" method="post" enctype="multipart/form-data">
       <div class="form-row">
            <div class="form-group col-md-6">
                <label for="mentorId">멘토</label>
                <input type="text" class="form-control" id="mentorId" name="mentorId" value="${homeWorkInfo.writer}"
                       readonly>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="hwDeadLine">제출기한</label>
                <input type="text" class="form-control" id="hwDeadLine" name="hwDeadLine" value="${homeWorkInfo.hwDeadLine}"
                       readonly>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="user_id">제출자(멘티)</label>
                <input type="text" class="form-control" id="user_id" name="user_id" value="${sessionScope.loginUser.user_id}"
                       readonly>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="hwName">과제명</label>
                <input type="text" class="form-control" id="hwName" name="hwName" value="${homeWorkInfo.hwName}" readonly>
            </div>
        </div>
        <div class="form-row">
            <label for="content">과제내용 / 멘토에게 전할말</label>
            <textarea type="text" rows="15" class="form-control" id="content" name="content"
                      placeholder=""></textarea>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6 uploadedFileWrapper">
                <label>기존 첨부파일<strong style="color:red">(과제 수정시 파일을 다시 첨부해주세요)</strong></label>
            <ul class="uploadedFileList">
                현재 첨부된 파일이 없습니다
            </ul>
            </div>
        </div>
        <div class="form-row">
            <label for="uploadFile">파일 첨부</label>
            <input type="file" class="form-control" id="uploadFile" name="uploadFile" placeholder="첨부파일(5MB 용량제한)">
            <input type="file" class="form-control" name="uploadFile" placeholder="첨부파일">
            <input type="file" class="form-control" name="uploadFile" placeholder="첨부파일">
        </div>
        <button type="submit" id="submitButton" class="btn btn-primary">수정</button>
        <button type="reset" class="btn btn-primary">삭제</button>
    </form>
</div>
</body>
<script>

    const writer = '<c:out value="${homeWorkInfo.writer}"/>';
    const user_id = '<c:out value="${sessionScope.loginUser.user_id}"/>';

    $(function(){
        $.getJSON("/MyStudy/getHomeWork", {writer, user_id}, function(homeWork) {
            console.log(homeWork);
            showUploadedHw(homeWork);
        });
    })

    const showUploadedHw = (homeWork) => {
        $("#content").html(homeWork.content);
        const filenames = homeWork.filename.split(",");
        let str = "";
        filenames.forEach((file) => {
            if(file.length!==0){
                console.log(file);
                str += "<li>"+file+"</li>"
            }
        })

    }

    const maxSize = 5242880; // 5mb

    function checkFile(filename, fileSize) {
        if (fileSize >= maxSize) {
            alert("파일 사이즈가 너무 큽니다")
            return false
        }

        if (fileSize === 0) {
            return confirm("첨부된 파일의 내용이 없습니다. 등록하시겠습니까?");
        }

        return true;
    }

    $("#submitButton").on("click", function (e) {
        if(!confirm("과제 수정시 기존 첨부파일은 삭제 됩니다.")) {
            e.preventDefault();
            return;
        }

        let inputFile = $("input[name='uploadFile']");
        let files = inputFile[0].files;
        console.log(files);

        for (let i = 0; i < files.length; i++) {
            if (!checkFile(files[i].name, files[i].size)) {
                e.preventDefault();
                return false;
            }
        }

        return true;
    })

</script>
</html>
<c:import url="/WEB-INF/views/includes/footer.jsp"/>