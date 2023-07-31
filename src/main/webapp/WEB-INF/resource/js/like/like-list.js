var pageSize = 5;
var pageBlockSize = 5;

$(function () {
  fetchLikeList();
  deleteCheckboxEvent();
  updateEvent();
  setSearchEvent();
});

// 즐겨찾기 목록 조회
function fetchLikeList(currentPage, search) {
  // param 설정
  currentPage = currentPage || 1;

  let param = '';
  let excludesAppliedCheckbox = '';
  let excludesExpiredCheckbox = '';
  let keyword = '';
  
  if (typeof search !== undefined && search === true){
	 
	  excludesAppliedCheckbox = $("#excludesApplied");
	  excludesExpiredCheckbox = $("#excludesExpired");
	  keyword = $("#keyword").val();

	  excludesAppliedCheckbox.val(
	    excludesAppliedCheckbox.is(":checked") ? "true" : "false"
	  );
	  excludesExpiredCheckbox.val(
	    excludesExpiredCheckbox.is(":checked") ? "true" : "false"
	  );

	  param = {
	    currentPage: 1,
	    pageSize: pageSize,
	    excludesApplied: excludesAppliedCheckbox.val(),
	    excludesExpired: excludesExpiredCheckbox.val(),
	    keyword: keyword,
	  };  
  
  } else {
	  
	  excludesAppliedCheckbox = $('#queryexcludesApplied');
	  excludesExpiredCheckbox = $('#queryexcludesExpired');
	  keyword = $('#queryKeyword');
	  
	  excludesAppliedCheckbox.val(
			    excludesAppliedCheckbox.is(":checked") ? "true" : "false"
			  );
	  excludesExpiredCheckbox.val(
	    excludesExpiredCheckbox.is(":checked") ? "true" : "false"
	  );
	  
	  param = {
	    currentPage: currentPage,
	    pageSize: pageSize,
	    excludesApplied: excludesAppliedCheckbox.val(),
	    excludesExpired: excludesExpiredCheckbox.val(),
	    keyword: keyword.val(),
	  };  
	  
  }
  

  // callback after request
  var likeListCallback = function (response) {
    $("#listNotice").empty().append(response);

    var countnoticelist = $("#totcnt").val();

    if(countnoticelist){
    	var paging = getPaginationHtml(
    		      currentPage,
    		      countnoticelist,
    		      pageSize,
    		      pageBlockSize,
    		      "fetchLikeList"
    		    ); 

  	    $("#noticePagination").empty().append(paging);

  	    $("#currentpage").val(currentPage);
         	
    } else {
    	const message = $("<div id='emptyResultArea'><p>즐겨찾기가 없습니다</p></div>")
    	$('#listNotice').empty().append(message);
    	$("#noticePagination").empty();
    }
  };

  callAjax("/like/list.do", "GET", "text", "false", param, likeListCallback);
}

const selectedAdNos = [];

function deleteCheckboxEvent() {
  $(document).on("change", ".deleteCheckbox", eventHandler);

  function eventHandler() {
    const adNo = $(this).closest("tr").find(".adNo").val();
    console.log("삭제에 선택된 채용공고번호 : " + adNo);

    if (this.checked) {
      selectedAdNos.push(adNo);
    } else {
      const index = selectedAdNos.indexOf(adNo);
      if (index > -1) {
        selectedAdNos.splice(index, 1);
      }
    }

    console.log(`현재 선택된 공고번호: ${selectedAdNos}`);

    const deleteButton = $(".deleteLikesButtonArea");

    selectedAdNos.length > 0 ? deleteButton.show() : deleteButton.hide();
  }
}

function updateEvent() {
  $(document).on("click", "#deleteLikesButton", updateHandler);
}

function updateHandler() {
  const redirectPageUrl = window.location.href;
  const loginId = $("#loginId").val();

  const param = {
    adNoList: selectedAdNos,
    loginId: loginId,
  };

  var updateCallback = function (response) {
    console.log(response);
    alert("즐겨찾기가 삭제되었습니다.");
    window.location.replace(response);
  };

  $.ajax({
    url: "/like/update.do",
    type: "PATCH",
    dataType: "text",
    async: true,
    data: JSON.stringify(param),
    contentType: "application/json",
    beforeSend: function (xhr) {
      xhr.setRequestHeader("AJAX", "true");
      $.blockUI({
        message:
          '<h1><img src="/images/admin/comm/busy.gif" /> Just a moment...</h1>',
        T: 99999,
      });
    },
    success: function (data) {
      updateCallback(data);
    },
    error: function (xhr, status, err) {
      console.log("xhr : " + xhr);
      console.log("status : " + status);
      console.log("err : " + err);

      if (xhr.status == 901) {
        alert("로그인 정보가 없습니다.\n다시 로그인 해 주시기 바랍니다.");
        location.replace("/login.do");
      } else if (xhr.status == 500) {
        alert("서버에러.");
        location.replace(redirectPageUrl);
      } else {
        alert("A system error has occurred." + err);
      }
    },
    complete: function (data) {
      $.unblockUI();
    },
  });
}

function setSearchEvent(){
	
	$(document).on('click', '#searchLikeListBtn', function(event) {
		event.preventDefault();
		fetchLikeList(1, true);
	})
	
}
