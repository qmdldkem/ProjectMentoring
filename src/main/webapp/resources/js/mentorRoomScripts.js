$(function() {
    $('input[name="studyPeriod"]').daterangepicker({
        autoUpdateInput: false,
        minDate: new Date(),
        // changeMonth: true,
        locale: {
            format: "YYYY-MM-DD",
            applyLabel :"선택",
            cancelLabel:"취소",
            daysOfWeek:['일','월','화','수','목','금','토'],
            monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
        }
    });
    $('input[name="studyPeriod"]').on('apply.daterangepicker', function(ev, picker) {
        $(this).val(picker.startDate.format('YYYY/MM/DD') + ' - ' + picker.endDate.format('YYYY/MM/DD'));
    });
    $('input[name="studyPeriod"]').on('cancel.daterangepicker', function(ev, picker) {
        $(this).val('');
    });
});



function addCreerList() {
    const addstr = document.getElementById('addCareer');
    const li = document.createElement('li');
    const input = document.createElement('input');
    const del = document.createElement('a');

    //<input type="hidden" name="carrer" value=add.value>
    input.setAttribute('type',"hidden");
    input.setAttribute('name','career');
    input.setAttribute('value',addstr.value);

    //<a id="delByn">삭제</a>
    del.append("삭제");
    del.setAttribute('id','delBtn');
    del.addEventListener("click", delAct);

    //<p>str<input type="hidden" name="carrer" value=add.value><a>삭제</a></p>
    const str = document.createTextNode(addstr.value);
    li.appendChild(str);
    li.append(" ");
    li.appendChild(input);

    document.getElementById('careerList').appendChild(li).appendChild(del);
    addstr.value=""; //추가 후 input 비우기
};

//호출한 라인 삭제
function delAct(event){
    const removeLine = event.target.parentElement;
    removeLine.remove();
}

//입력값이 잘못된 경우 false를 리턴.
function doCheck(){
    let enWeekly = document.querySelectorAll("input[type=checkbox][name=studyWeekly]:checked"); //체크된 요일리스트 불러오기
    if(document.getElementById("title").value.length == 0){
        alert('스터디 이름을 입력해주세요.')
        document.getElementById("title").focus();
        return false;
    }else if(document.getElementById("studyPeriod").value.length == 0){
        alert('스터디 기간을 입력해주세요.');
        document.getElementById("studyPeriod").focus();
        return false;
    }
    //요일이 선택되었는지 확인
    else if(enWeekly.length == 0 | enWeekly==null){
        alert('요일을 선택해 주세요.');
        return false;
    }

    else if(document.getElementById('studyTimeStart').value.length == 0){
        alert('스터디 시작 시간을 입력해주세요.');
        document.getElementById('studyTimeStart').focus();
        return false;
    }

    else if(document.getElementById('studyTimeEnd').value.length == 0){
        alert('스터디 종료 시간을 입력해주세요.');
        document.getElementById('studyTimeEnd').focus();
        return false;
    }

    else if(document.getElementById('studyTimeEnd').value < document.getElementById('studyTimeStart').value){
        alert('스터디 종료 시간은 스터디 시작 시간보다 빠를 수 없습니다.');
        document.getElementById('studyTimeStart').focus();
        return false;
    }

    else if(document.getElementById("capacity").value.length == 0){
        alert('모집인원을 입력해주세요.');
        document.getElementById("capacity").focus();
        return false;
    }

    else if(document.getElementById("content").value.length == 0){
        alert('상세설명을 입력해주세요.');
        document.getElementById("content").focus();
        return false;
    }else{return lastCheck();}

}

function lastCheck() {
    if (confirm("스터디를 등록하시겠습니까?") == true){    //확인
        return true;
    }else{   //취소
        return false;
    }
}

//////////////////
// let enPeriod = document.getElementById("studyPeriod");
// let periodRule = /\d{4}\/\d{2}\/\d{2} - \d{4}\/\d{2}\/\d{2}/; //폼양식

// //스터디 기간 양식에 맞는지 확인
// if(!periodRule.test(enPeriod.value)){
//         alert('스터디 기간을 정확히 입력해주세요.\r(YYYY/MM/DD - YYYY/MM/DD)')
//         document.getElementById("studyPeriod").focus();
//     return false;
// }
//
// // 기간 오늘자 이후로 선택가능
// // period1이 period2보다 빠른날이면 false
// let period1 = enPeriod.value.slice(0, 10);
// let period2 = enPeriod.value.slice(13, 23);
//
// function getFormatDate(date){
//     let year = date.getFullYear();              //yyyy
//     let month = (1 + date.getMonth());          //M
//     month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
//     let day = date.getDate();                   //d
//     day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
//     return  year + '/' + month + '/' + day;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
// }
//
// // A기간 - B기간 중
// if(!period1>period2){
//     alert('스터디 종료일이 시작일보다 빠릅니다.')
//     document.getElementById("studyPeriod").focus();
//     return false;
// }
//
// //오늘자 이후로 선택
// if(!getFormatDate(new Date(period1))>getFormatDate(new Date)){
//     alert('스터디 시작일은 오늘보다 빠를 수 없습니다.')
//     document.getElementById("studyPeriod").focus();
//     return false;
// }
//
// $(function () {
//     $('input[name="studyTimeStart"]').timepicker({
//         timeFormat: 'HH:mm',
//         interval: 10,
//         startTime: '00:00',
//         dynamic: false,
//         dropdown: true,
//         scrollbar: true
//     });
// });