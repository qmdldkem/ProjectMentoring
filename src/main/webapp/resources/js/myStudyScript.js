
function getFormatDate(date){
    var year = date.getFullYear();              //yyyy
    var month = (1 + date.getMonth());          //M
    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
    var day = date.getDate();                   //d
    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
    return  year + '-' + month + '-' + day;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
}

const checkSubmit = () => {

    let today = new Date();
    let date = getFormatDate(today);
    let hwName = $("input[id='hwName']");
    let hwDeadLine = $("input[id='hwDeadLine']");
    let hwContent = $("textarea[id='hwContent']");

    if(hwName.val().trim().length <= 0){
        alert("과제명을 입력해주세요");
        hwName.onfocus;
        return false;
    }

    if(hwDeadLine.val().length <= 0){
        alert("제출 기한을 입력해주세요");
        return false;
    }

    if(hwDeadLine.val() <= date){
        alert("제출 기한일이 적절치 않습니다.(과제 등록 이후 날짜로 지정해주세요)")
        return false;
    }

    if(hwContent.val().trim().length <= 0){
        alert("과제 내용을 입력해주세요");
        $("#hwContent").onfocus;
        return false;
    }

    return true;
}

const hwInfoModifyAjax = (hwInfo, callback, error) => (

    $.ajax({
        type :'patch',
        url :'/MyStudy/' + writer,
        data : JSON.stringify(hwInfo),

        contentType : "application/json;charset=utf-8",
        success : function(result, status, xhr) {
            if (callback) {
                console.log(result);
                callback(result);
            }
        },
        error : function(xhr, status, er){
            if(error){
                error(er);
            }
        }
    })
)

const hwInfoDeleteAjax = (callback, error) => (

    $.ajax({
        type :'delete',
        url :'/MyStudy/' + writer,
        contentType : "application/json;charset=utf-8",
        success : function(result, status, xhr) {
            if (callback) {
                console.log(result);
                callback(result);
            }
        },
        error : function(xhr, status, er){
            if(error){
                error(er);
            }
        }
    })
)