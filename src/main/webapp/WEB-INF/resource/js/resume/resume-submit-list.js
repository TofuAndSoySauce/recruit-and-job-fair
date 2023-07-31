let resumeNo;
let pageSize = 5;
let pageBlockSize = 5;

$(function () {
  setResumeListButtonEvent();
  fetchSubmitList();
  setResumeNumberEvent();
});

// 지원현황 불러오기
function fetchSubmitList(currentPage) {
  // param 설정
  currentPage = currentPage || 1;

  const param = {
    currentPage: currentPage,
    pageSize: pageSize,
    keyword: $("#keyword").val(),
  };

  // callback after request
  var submitListCallback = function (response) {
    $("#listNotice").empty().append(response);

    var countsubmitlist = $("#totcnt").val();

    if(countsubmitlist){
    	var paging = getPaginationHtml(
    		      currentPage,
    		      countsubmitlist,
    		      pageSize,
    		      pageBlockSize,
    		      "fetchSubmitList"
    		    ); 
    	/*	    
  	    if(search !== true){
  	    	$('input#keyword').val("");
  	    }*/

  	    $("#noticePagination").empty().append(paging);

  	    $("#currentpage").val(currentPage);
         	
    } else {
    	const message = $("<div id='emptyResultArea'><p>지원한 이력이 없습니다.</p></div>")
    	$('#listNotice').empty().append(message);
    	$("#noticePagination").empty();
    }
  };

  callAjax(
    "/resume/submit/list.do",
    "GET",
    "text",
    "false",
    param,
    submitListCallback
  );
}

// 이력서 목록 불러오기 이벤트를 지원하기 버튼에 부착
function setResumeListButtonEvent() {
  var buttons = document.getElementsByClassName("resumeListButton");

  $(document).on("click", ".resumeListButton", popupResumeListModal);
  $(document).on(
    "click",
    '#resumeListModal input[type="radio"]',
    setValueForSubmit
  );

  function popupResumeListModal() {
    $("#resumeListModal").show();
    $('#resumeListModal input[type="radio"]').prop("checked", false);

    $(".submitArea > a.close").click(function (event) {
      if (!$(event.target).closest(".modal-content").length) {
        $("#resumeListModal").hide();
      }
    });
  }

  function setValueForSubmit() {
    resumeNo = $('#resumeListModal input[type="radio"]:checked').val();
    console.log(`adNo: ${adNo}, resumeNo: ${resumeNo}`);
  }
}

function setResumeNumberEvent() {
  $("#listNotice").on("click", ".resumeListButton", function (event) {
    event.preventDefault();

    adNo = $(this).closest("tr").find(".adNo").val();

    console.log(`공고번호 ${adNo}`);
  });
}

function fetchResumeDetail(resumeNo) {}
