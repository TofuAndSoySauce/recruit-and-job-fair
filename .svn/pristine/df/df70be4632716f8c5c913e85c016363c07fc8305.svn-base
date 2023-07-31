var pageSize = 5;
var pageBlockSize = 5;

$(function () {
  fetchAdList();
  setSearchEvent();
});

// 채용공고 리스트 조회
function fetchAdList(currentPage, search) {
  // param 설정
  currentPage = currentPage || 1;

  let param = '';
  
  if (typeof search !== undefined && search === true){
	  param = {
	    currentPage: 1,
	    pageSize: pageSize,
	    hireType: $("#hireType").val(),
	    location: $("#location").val(),
	    education: $("#education").val(),
	    keyword: $("#keyword").val(),
	  }
  } else {
	  
	  const hireType = $("#queryHireType").val();
	  const location = $("#queryLocation").val();
	  const education = $("#queryEducation").val();
	  const keyword = $("#queryKeyword").val();
	  
	  param = {
		  currentPage: currentPage,
		  pageSize: pageSize,
		  hireType : hireType,
		  location: location,
		  education: education,
		  keyword: keyword
	  }
	  
  }
  
  // callback after request
  var adListCallback = function (response) {
    $("#listNotice").empty().append(response);

    var countnoticelist = $("#totcnt").val();
    
    if(countnoticelist){
    	var paging = getPaginationHtml(
    		      currentPage,
    		      countnoticelist,
    		      pageSize,
    		      pageBlockSize,
    		      "fetchAdList"
    		    ); 
    		    
  	    if(search !== true){
  	    	$('input#keyword').val("");
  	    }

  	    $("#noticePagination").empty().append(paging);

  	    $("#currentpage").val(currentPage);
         	
    } else {
    	const message = $("<div id='emptyResultArea'><p>검색결과가없습니다.</p></div>")
    	$('#listNotice').empty().append(message);
    	$("#noticePagination").empty();
    }

  };

  callAjax("/ad/list.do", "GET", "text", "false", param, adListCallback);
}

function setSearchEvent(){
	
	$(document).on('click', '#searchBtn', function(event) {
		event.preventDefault();
		fetchAdList(1, true);
	})
	
}
