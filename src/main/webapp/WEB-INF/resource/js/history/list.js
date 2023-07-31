var pageSize = 5;
var pageBlockSize = 5;

$(function () {
  fetchHistoryList();
});

// 채용공고 리스트 조회
function fetchHistoryList(currentPage) {
  // param 설정
  currentPage = currentPage || 1;

  const param = {
    currentPage: currentPage,
    pageSize: pageSize,
    keyword: $("#keyword").val(),
  };

  // callback after request
  var historyListCallback = function (response) {
    $("#listNotice").empty().append(response);

    var countnoticelist = $("#totcnt").val();

    if(countnoticelist){
    	var paging = getPaginationHtml(
    		      currentPage,
    		      countnoticelist,
    		      pageSize,
    		      pageBlockSize,
    		      "fetchHistoryList"
    		    ); 

  	    $("#noticePagination").empty().append(paging);

  	    $("#currentpage").val(currentPage);
         	
    } else {
    	const message = $("<div id='emptyResultArea'><p>최근 본 공고가 없습니다.</p></div>")
    	$('#listNotice').empty().append(message);
    	$("#noticePagination").empty();
    }
  };

  callAjax(
    "/history/list.do",
    "GET",
    "text",
    "false",
    param,
    historyListCallback
  );
}
