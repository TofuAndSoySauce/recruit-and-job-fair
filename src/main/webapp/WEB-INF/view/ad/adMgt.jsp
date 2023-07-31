<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>채용공고 관리</title>
<!-- sweet alert import -->
<script src='${CTX_PATH}/js/sweetalert/sweetalert.min.js'></script>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<!-- sweet swal import -->

<script type="text/javascript">

	//유효성 검사
	function validation () {
	
		if ($("#ad_title").val() == "") {
			alert("채용공고 제목을 입력해주세요.");
			$("#ad_title").focus();
			return false;
		}
	
		if ($("#ad_experience").val() == "0") {
			alert("경력을 선택해주세요.");
			$("#ad_experience").focus();
			return false;
		}
		
		if ($("#ad_salary").val() == "0") {
			alert("급여를 입력해주세요.");
			$("#ad_salary").focus();
			return false;
		}
		
		if ($("#ad_education").val() == "0") {
			alert("학력을 선택해주세요.");
			$("#ad_education").focus();
			return false;
		}
		
		if ($("#ad_role").val() == "0") {
			alert("직책을 선택해주세요.");
			$("#ad_role").focus();
			return false;
		}
		
		if ($("#ad_position").val() == "0") {
			alert("직무를 선택해주세요.");
			$("#ad_position").focus();
			return false;
		}
		
		if ($("#ad_type").val() == "0") {
			alert("근무형태를 선택해주세요.");
			$("#ad_type").focus();
			return false;
		}
		
		if ($("#ad_location").val() == "0") {
			alert("근무지역을 선택해주세요.");
			$("#ad_location").focus();
			return false;
		}
		
		if ($("#ad_perference").val() == "") {
			alert("우대사항을 선택해주세요.");
			$("#ad_perference").focus();
			return false;
		}
		
		if ($("#ad_date").val() == "") {
			alert("마감기한을 입력해주세요.");
			$("#ad_date").focus();
			return false;
		}
		
		if ($("#ad_content").val() == "") {
			alert("공고내용을 입력해주세요.");
			$("#ad_content").focus();
			return false;
		}
		
		savefile();
		
	}

	// 오늘의 년,월,일
	let today = new Date();   
	
	let year = today.getFullYear(); 
	let month = today.getMonth() + 1;  
	if (month < 10) month = "0" + month;
	let date = today.getDate(); 
	if (date < 10) date = "0" + date;
	
	let now = year + '-' + month + '-' + date


	// 페이징 설정
	var pageSize = 5;
	var pageBlockSize = 5;

	
	// 버튼 이벤트와 리스트 새로 불러오기
	$(function() {
		buttonClickEvent();
 		searchAd(); 
 		$("#searchBtn").click(function(){
 			$("#searchCase").val("2");
 		});
	});
	
	
	// 버튼 이벤트
	function buttonClickEvent() {
		$("a[name=btn]").click(function(e) {
			e.preventDefault();

			var btnId = $(this).attr("id");

			switch (btnId) {
			case "btnSavefile":
				alert("채용공고를 등록했습니다.");
				$("#searchCase").val("1");
				validation();
				break;
			case "btnUpdatefile":
				alert("채용공고를 수정했습니다.");
				$("#action").val("U");
				$("#searchCase").val("1");
				validation();
				break;
			case "btnDeletefile":
				alert("채용공고를 삭제했습니다.");
				$("#action").val("D");
				$("#searchCase").val("1");
				savefile();
				break;
			case "btnCancel":
				alert("공고 취소 상태로 변경했습니다.");
				$("#action").val("C");
				$("#searchCase").val("1");
				savefile();
				break;
			case "btnComplete":
				alert("모집 완료 상태로 변경했습니다.");
				$("#action").val("P");
				$("#searchCase").val("1");
				savefile();
				break;
			case "btnRestart":
				alert("공고 중 상태로 변경했습니다.");
				$("#action").val("R");
				$("#searchCase").val("1");
				savefile();
				break;
			case "btnClosefile":
				$("#searchCase").val("1");
			 	searchAd();  
				gfCloseModal();
				break;
			}
			
		});
		
 		
		// 파일 미리보기
		var upfile = document.getElementById("addfile");
		upfile.addEventListener("change", function(event){
			
			$("#fileview").empty();
			var image = event.target;
			var imgpath = "";
			
			if(image.files[0]){
				imgpath = window.URL.createObjectURL(image.files[0]);
				var filearr = $("#addfile").val().split(".");
				var previewhtml = "";

				if(filearr[1] == "jpg" || filearr[1] == "png") previewhtml = "<img src='" + imgpath + "' style='width: 200px; height: 130px;' />";
				$("#fileview").empty().append(previewhtml);
			}
		});
		 
	}
	
	
	

	
	// 채용공고 불러오기 (검색, 새로고침, 인서트, 업데이트, 딜리트 버튼 클릭시 실행됨)
	function searchAd(cpage) {

		var param = null;
		
/* 		
		console.log("");
		console.log("cpage : " + cpage);
		console.log("srctitle : " + $("#srctitle").val());
		console.log("srcsdate : " + $("#srcsdate").val());
		console.log("srcedate : " + $("#srcedate").val());
		console.log("srcedate : " + $("#srcedate").val());
		console.log("searchCase : " + $("#searchCase").val());
		console.log("searchCheck : " + $("#searchCheck").val());
		 */
		
		// 새로고침, 제출버튼, 검색
		if (cpage == undefined) {

			
			if($("#searchCase").val() == "") {
			/* 	console.log("새로고침 했습니다."); */
				
				cpage = cpage || 1; 
				
				param = {
						srctitle : $("#srctitle").val(),
						srcsdate : $("#srcsdate").val(),
						srcedate : $("#srcedate").val(),
						loginId : $("#loginId").val(),
				 		pageSize : pageSize,
						cpage : cpage 
						
				}	
				
				
			}
			else if($("#searchCase").val() == 1) {
			/* 	console.log("제출버튼을 클릭했습니다."); */
				
				if ($("#searchCheck").val() == 1) {
				/* 	console.log("검색을 하고 제출버튼을 클릭했습니다."); */
					
					
					// 검색을 한 뒤 모든 검색어를 다시 지우고 제출버튼을 클릭한 경우
					if ($("#srctitle").val() == "" && $("#srcsdate").val() == "" && $("#srcedate").val() == "" ) {
					/* 	console.log("검색을 한 뒤 모든 검색어를 다시 지우고 제출버튼을 클릭한 경우. "); */
					
						cpage = $("#cpageRepo").val();
						cpage = cpage || 1; 
						
						param = {
								srctitle : $("#srctitleRepo").val(),
								srcsdate : $("#srcsdateRepo").val(),
								srcedate : $("#srcedateRepo").val(),
								loginId : $("#loginId").val(),
						 		pageSize : pageSize,
								cpage : cpage 
								
						}		

						$("#cpageRepo").val(cpage);
					}
					else {
						
						cpage = $("#cpageRepo").val();
						
						cpage = cpage || 1; 
						
						param = {
								srctitle : $("#srctitle").val(),
								srcsdate : $("#srcsdate").val(),
								srcedate : $("#srcedate").val(),
								loginId : $("#loginId").val(),
						 		pageSize : pageSize,
								cpage : cpage 
								
						}	
						
					}

				}
				else {
					/* console.log("검색은 하지 않고 제출버튼을 클릭했습니다."); */
					
					cpage = $("#cpageRepo").val();
					
					cpage = cpage || 1; 
					
					param = {
							loginId : $("#loginId").val(),
					 		pageSize : pageSize,
							cpage : cpage 
					}	

				}

			}
			else if($("#searchCase").val() == 2) {
			/* 	console.log("검색을 클릭했습니다."); */
				
				$("#searchCheck").val("1");
				
				cpage = cpage || 1; 
				
				param = {
						srctitle : $("#srctitle").val(),
						srcsdate : $("#srcsdate").val(),
						srcedate : $("#srcedate").val(),
						loginId : $("#loginId").val(),
				 		pageSize : pageSize,
						cpage : cpage 
						
				}
				
				$("#srctitleRepo").val($("#srctitle").val());
				$("#srcsdateRepo").val($("#srcsdate").val());
				$("#srcedateRepo").val($("#srcedate").val());

			}
			
		}
		// 페이지 클릭
		else {
		/* 	console.log("페이지를 클릭했습니다."); */
			
			if ($("#searchCheck").val() == 1) {
			/* 	console.log("검색을 한 뒤 페이지를 클릭했습니다. "); */
				
				// 검색을 한 뒤 모든 검색어를 다시 지우고 페이지를 클릭한 경우
				if ($("#srctitle").val() == "" && $("#srcsdate").val() == "" && $("#srcedate").val() == "" ) {
				/* 	console.log("검색을 한 뒤 모든 검색어를 다시 지우고 페이지를 클릭한 경우. "); */

					cpage = cpage || 1; 
					
					param = {
							srctitle : $("#srctitleRepo").val(),
							srcsdate : $("#srcsdateRepo").val(),
							srcedate : $("#srcedateRepo").val(),
							loginId : $("#loginId").val(),
					 		pageSize : pageSize,
							cpage : cpage 
							
					}		

					$("#cpageRepo").val(cpage);
				}
				else {
					
					/* console.log("검색을 한 뒤 검색어를 지우지 않고 페이지를 클릭한 경우. "); */
				
					cpage = cpage || 1; 
					
					param = {
							srctitle : $("#srctitle").val(),
							srcsdate : $("#srcsdate").val(),
							srcedate : $("#srcedate").val(),
							loginId : $("#loginId").val(),
					 		pageSize : pageSize,
							cpage : cpage 
							
					}		

					$("#cpageRepo").val(cpage);
				}

				
			}
			else {
			/* 	console.log("검색을 하지 않고 페이지를 클릭했습니다. "); */
				
				cpage = cpage || 1; 
				
				param = {
						loginId : $("#loginId").val(),
				 		pageSize : pageSize,
						cpage : cpage 
						
				}	
				
				$("#cpageRepo").val(cpage);
				
			}

		}
		

		var listcallback = function(res) {

		 	$("#listAd").empty().append(res); 

			var countAdList = $("#totcnt").val();
			var paging = getPaginationHtml(cpage, countAdList, pageSize, pageBlockSize, 'searchAd');
			$("#adPagination").empty().append(paging);
			$("#currentpage").val(cpage);
 
			if($("#searchCase").val() == 2 && $("#totcnt").val() == 0) alert("검색되는 채용공고가 없습니다.");  

		}

		callAjax("/ad/adList.do", "post", "text", "false", param, listcallback);
		
	} 
	
	

	// 등록 버튼을 클릭하여 모달창을 팝업하는 경우
	function openPop(res) {
		// 등록 버튼 클릭시 인적사항만 초기화하기 위한 함수다.
	  	initUserInfo(res);  
		initpopup();
		gfModalPop("#adRegfile");
	}
	
	
	// 팝업 초기 데이터 설정
	function initpopup(object) {
		
		// 등록버튼, 새로고침으로 팝업하는 경우
		if(object == "" || object == null || object == undefined) {

			// 버튼, 히든 input 초기화
			$("#btnSavefile").show();
			$("#btnDeletefile").hide();
			$("#btnUpdatefile").hide();
			$("#acceptBox").hide();
			$("#reg_date").val(getToday());
			$("#action").val("I");	
			
			// ad 데이터 초기화
			$("#fileview").empty();
			$("#addfile").val("");
 			$("#ad_title").val("");
			$("#ad_experience").val("0");
			$("#ad_salary").val("0");
			$("#ad_education").val("0");
			$("#ad_role").val("0");
			$("#ad_position").val("0");
			$("#ad_type").val("0");
			$("#ad_location").val("0");
			$("#ad_perference").val("");
			$("#ad_date").val("");
			$("#ad_content").val("");
			
			// 채용공고 기한 입력 min 속성 추가
			$("#ad_date").prop("min", now);

		}
		// 제목을 클릭하여 상세보기로 팝업하는 경우
		else {
			
			// 버튼, 히든 input 초기화
			$("#btnUpdatefile").show();
			$("#btnSavefile").hide();
			$("#btnDeletefile").show();
			$("#update_date").val(getToday());
			$("#ad_no").val(object.ad_no);
			$("#filecd").val(object.file_cd);
			$("#addfile").show();

			// ad 데이터 초기화
			$("#addfile").val("");
			$("#ad_title").val(object.ad_title);
			$("#ad_experience").val(object.ad_experience);
			$("#ad_salary").val(object.ad_salary);
			$("#ad_education").val(object.ad_education);
			$("#ad_role").val(object.ad_role);
			$("#ad_position").val(object.ad_position);
			$("#ad_type").val(object.ad_type);
			$("#ad_location").val(object.ad_location);
			$("#ad_perference").val(object.ad_perference);
			$("#ad_date").val(object.ad_date);
			$("#ad_content").val(object.ad_content);
			
			// ad 데이터 readonly 취소
			$("#ad_title").prop("readonly", false);
			$("#ad_perference").prop("readonly", false);
			$("#ad_date").prop("readonly", false);
			$("#ad_content").prop("readonly", false);
			
			// ad 데이터 show
			$("#ad_experience option").show();
			$("#ad_salary option").show();
			$("#ad_education option").show();
			$("#ad_role option").show();
			$("#ad_position option").show();
			$("#ad_type option").show();
			$("#ad_location option").show();
			
			// 채용공고 기한 입력 min 속성 추가
			$("#ad_date").prop("min", now);
			
			// userinfo 데이터 초기화
 			$("#name").val(object.name);
			$("#user_phone").val(object.user_phone);
			$("#user_birthday").val(object.user_birthday);
			$("#user_company_size").val(object.user_company_size);
			$("#user_email").val(object.user_email);
			$("#user_company_category").val(object.user_company_category);
			$("#user_zipcode").val(object.user_zipcode);
			$("#user_address1").val(object.user_address1);
			$("#user_address2").val(object.user_address2); 
			
			
			
			// 관리자가 반려했거나 기간이 만료되면 삭제 버튼만 생성되고 모든 input은 readonly가 된다.
			if (object.ad_yn == 2 || object.ad_date < now) {
				$("#btnUpdatefile").hide();
				$("#addfile").hide();
				$("#ad_title").prop("readonly", true);
				$("#ad_experience option").hide();
				$("#ad_salary option").hide();
				$("#ad_education option").hide();
				$("#ad_role option").hide();
				$("#ad_position option").hide();
				$("#ad_type option").hide();
				$("#ad_location option").hide();
				$("#ad_perference").prop("readonly", true);
				$("#ad_date").prop("readonly", true);
				$("#ad_content").prop("readonly", true);
				
			}
			
			// 관리자가 채용공고 승인을 한 상태에서 기간만료가 아닌 경우 공고 상태를 조작할 수 있다.
			if (object.ad_yn == 3) {
				if (object.ad_date >= now) {
					$("#acceptBox").show();
				}
				else $("#acceptBox").hide();
			}
			else $("#acceptBox").hide();
			
			
			
			// 저장된 파일 미리보기
  			var file_name = object.file_name;
			var filearr = [];
			var previewhtml = "";
			
			if( file_name == "" || file_name == null || file_name == undefined) previewhtml = "";
			else {
				filearr = file_name.split(".");
				if (filearr[1] == "jpg" || filearr[1] == "png") previewhtml = "<a href='javascript:fn_downaload()'>   <img src='" + object.file_nadd + "' style='width: 200px; height: 130px;' />  </a>";
				else previewhtml = "<a href='javascript:fn_downaload()'>" + object.file_name  + "</a>";
			}
			
			$("#fileview").empty().append(previewhtml); 
 
		}
 			
	}

	// 오늘 날짜 가져오는 함수
	function getToday() {
		var date = new Date();
		var year = date.getFullYear();
		var month = ("0" + (1 + date.getMonth())).slice(-2);
		var day = ("0" + date.getDate()).slice(-2);

		return year + "-" + month + "-" + day;
	}
	
	// 채용공고 인서트, 업데이트, 딜리트 버튼 클릭시 실행됨.
	function savefile(){
		var frm = document.getElementById("myForm");
		frm.enctype = "multipart/form-data";
		var param = new FormData(frm);
		
		var savecallback = function(res){
			if(res.result == "SUCCESS"){
				gfCloseModal();
		 		searchAd(); 
			}
		}
		
		callAjaxFileUploadSetFormData("/ad/adSaveFile.do", "post", "json", true, param, savecallback);
	}
	
	
	// 채용공고 인적사항 초기화
	function initUserInfo(loginID) {
 		var param = {
				loginID : loginID
			}
		
		var detailcallback = function(object){

			// userinfo 데이터 초기화
			$("#name").val(object.name);
			$("#user_phone").val(object.user_phone);
			$("#user_birthday").val(object.user_birthday);
			$("#user_company_size").val(object.user_company_size);
			$("#user_email").val(object.user_email);
			$("#user_company_category").val(object.user_company_category);
			$("#user_zipcode").val(object.user_zipcode);
			$("#user_address1").val(object.user_address1);
			$("#user_address2").val(object.user_address2); 

		}
		
		callAjax("/ad/userDetail.do", "post", "json", "false", param, detailcallback); 
	}
	

	// 채용공고 상세보기 초기화
	function openDetail(ad_no){
 		var param = {
 				ad_no : ad_no
			}
		
		var detailcallback = function(res){
	 	 	initpopup(res); 
			gfModalPop("#adRegfile");  
		}
		
		callAjax("/ad/adDetail.do", "post", "json", "false", param, detailcallback); 
	}
	
	
	// 검색 날짜 이벤트
	$(function(){
		
		// 시작일 선택시 종료일에게 min 속성 부여
		$("#srcsdate").change(function(){$("#srcedate").prop("min", $("#srcsdate").val());});
		
		// 종료일 선택시 시작일에게 max 속성 부여
		$("#srcedate").change(function(){$("#srcsdate").prop("max", $("#srcedate").val());});
		
	});


</script>




</head>
<body>
	<form id="myForm" action="" method="">
		<input type="hidden" name="action" id="action" value=""> 
		<input type="hidden" name="loginId" id="loginId" value="${loginId}">
		<input type="hidden" name="userNm" id="userNm" value="${userNm}">
		<input type="hidden" name="currentpage" id="currentpage" value="">
		<input type="hidden" name="filecd" id="filecd" value="">
		<input type="hidden" name="reg_date" id="reg_date" value="">
		<input type="hidden" name="update_date" id="update_date" value="">
		<input type="hidden" name="ad_no" id="ad_no" value="">
		<!-- 페이지 유지를 위한 설정입니다. -->
		<input type="hidden" name="searchCheck" id="searchCheck" value="">
		<input type="hidden" name="searchCase" id="searchCase" value="">
		<input type="hidden" name="cpageRepo" id="cpageRepo" value="">
		<input type="hidden" name="srctitleRepo" id="srctitleRepo" value="">
		<input type="hidden" name="srcsdateRepo" id="srcsdateRepo" value="">
		<input type="hidden" name="srcedateRepo" id="srcedateRepo" value="">
		

		<!-- 모달 배경 -->
		<div id="mask"></div>

		<div id="wrap_area">

			<h2 class="hidden">header 영역</h2>
			<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>

			<h2 class="hidden">컨텐츠 영역</h2>
			<div id="container">
				<ul>
					<li class="lnb">
						<!-- lnb 영역 --> <jsp:include
							page="/WEB-INF/view/common/lnbMenu.jsp"></jsp:include> <!--// lnb 영역 -->
					</li>
					<li class="contents">
						<!-- contents -->
						<h3 class="hidden">contents 영역</h3> <!-- content -->
						<div class="content">

							<p class="Location">
								<a href="../dashboard/dashboard.do" class="btn_set home">메인으로</a>
								<span class="btn_nav bold">기업관리</span> <span class="btn_nav bold">채용공고
									관리</span> <a href="../system/notice.do" class="btn_set refresh">새로고침</a>
							</p>
							<p class="conTitle">
								<span class="btn_nav bold">채용공고 관리</span>
							</p>

							<p>
								<span class="fr"> 제목 <input type="text" id="srctitle"
									name="srctitle" /> <input type="date" id="srcsdate"
									name="srcsdate" /> ~ <input type="date" id="srcedate"
									name="srcedate" /> <a class="btnType blue"
									href="javascript:searchAd();" id="searchBtn" name="modal"><span>검색</span></a>
									<c:if test="${sessionScope.userType eq 'B'}">
										<a class="btnType blue" href="javascript:openPop('${loginId }');" name="modal"><span>등록</span></a>
									</c:if>
								</span>
							</p>
							<div class="divComGrpCodList">
								<table class="col">
									<caption>caption</caption>
									<colgroup>
										<col width="35%">
										<col width="10%">
										<col width="10%">
										<col width="10%">
										<col width="12.5%">
										<col width="12.5%">
										<col width="10%">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">제목</th>
											<th scope="col">고용형태</th>
											<th scope="col">연봉</th>
											<th scope="col">경력</th>
											<th scope="col">등록 일자</th>
											<th scope="col">공고 기한</th>
											<th scope="col">공고 상태</th>
										</tr>
									</thead>
									<tbody id="listAd"></tbody>
								</table>
							</div>

							<div class="paging_area" id="adPagination"></div>

						</div> <!--// content -->

						<h3 class="hidden">풋터 영역</h3> <jsp:include
							page="/WEB-INF/view/common/footer.jsp"></jsp:include>
					</li>
				</ul>
			</div>
		</div>

		<div id="adRegfile" class="layerPop layerType2"
			style="width: 750px; height:800px;">
			<dl>
				<dt>
					<strong>채용공고 등록</strong>
				</dt>
				
				<div style="width: 750px; height:750px; overflow:auto">
					<dd class="content">
					<!-- s : 여기에 내용입력 -->
					<table class="row">
						<caption>caption</caption>
						<colgroup>
							<col width="250px">
							<col width="250px">
							<col width="250px">
						</colgroup>
						<tbody>
						
							<!-- 채용공고 제목 -->
							<tr>
								<th colspan="3" style="background-color: #fff; height: 75px">채용공고 제목</th>
							</tr>
							<tr>
								<th scope="row">채용공고 제목 <span class="font_red">*</span></th>
								<td colspan="2"><input type="text" class="inputTxt p100"
								name="ad_title" id="ad_title" /></td>
							</tr>
							
							<!-- 기업정보 -->
							<tr>
								<th colspan="3" style="background-color: #fff; height: 75px">기업정보</th>
							</tr>
							<tr>
								<td>
									<div id="fileview"></div>
								</td>
								<th scope="row">기업 사진 등록 <span class="font_red"></span></th>
								<td>
									<input multiple="multiple" type="file" class="btnType blue" name="addfile"
									id="addfile" />
								</td>
							</tr>
							<tr>
								<th scope="row">회사명 <span class="font_red"></span></th>
								<td colspan="2"><input type="text" class="inputTxt p100"
									name="name" id="name" readonly /></td>
							</tr>
							<tr>
								<th scope="row">담당자 연락처 <span class="font_red"></span></th>
								<td colspan="2"><input type="text" class="inputTxt p100"
									name="user_phone" id="user_phone" readonly /></td>
							</tr>
							<tr>
								<th scope="row">설립일 <span class="font_red"></span></th>
								<td colspan="2"><input type="text" class="inputTxt p100"
									name="user_birthday" id="user_birthday" readonly /></td>
							</tr>
							<tr>
								<th scope="row">기업규모 <span class="font_red"></span></th>
								<td colspan="2"><input type="text" class="inputTxt p100"
									name="user_company_size" id="user_company_size" readonly /></td>
							</tr>
							<tr>
								<th scope="row">이메일 <span class="font_red"></span></th>
								<td colspan="2"><input type="text" class="inputTxt p100"
								name="user_email" id="user_email" readonly /></td>
							</tr>
							<tr>
								<th scope="row">업종 <span class="font_red"></span></th>
								<td colspan="2"><input type="text" class="inputTxt p100"
								name="user_company_category" id="user_company_category" readonly /></td>
							</tr>
							<tr>
								<th scope="row">우편번호 <span class="font_red"></span></th>
								<td colspan="2"><input type="text" class="inputTxt p100"
								name="user_zipcode" id="user_zipcode" readonly /></td>
							</tr>
							<tr>
								<th scope="row">주소 <span class="font_red"></span></th>
								<td colspan="2"><input type="text" class="inputTxt p100"
								name="user_address1" id="user_address1" readonly /></td>
							</tr>
							<tr>
								<th scope="row">상세주소 <span class="font_red"></span></th>
								<td colspan="2"><input type="text" class="inputTxt p100"
								name="user_address2" id="user_address2" readonly /></td>
							</tr>
							
							<!-- 채용정보 -->
							<tr style="margin-top:100px">
								<th colspan="3" style="background-color: #fff; height: 75px">채용정보</th>
							</tr>
							<tr>
								<th scope="row">경력<span class="font_red">*</span></th>
								<td colspan="2">
									<select name="ad_experience" id="ad_experience">
										<option value="0">선택하세요</option>
										<option value="1">신입</option>
										<option value="2">1~2년차</option>
										<option value="3">3~4년차</option>
										<option value="4">5년차 이상</option>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">급여 <span class="font_red">*</span></th>
								<td colspan="2">
									<select name="ad_salary" id="ad_salary">
										<option value="0">선택하세요</option>
										<option value="1">3000 ~ 4000 만원</option>
										<option value="2">4000 ~ 5000 만원</option>
										<option value="3">5000만원 이상</option>
										<option value="4">6000만원 이상</option>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">학력 <span class="font_red">*</span></th>
								<td colspan="2">
									<select name="ad_education" id="ad_education">
										<option value="0">선택하세요</option>
										<option value="1">고등학교 졸업</option>
										<option value="2">전문대 졸업</option>
										<option value="3">대학교 졸업</option>
										<option value="4">대학원 졸업</option>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">직책 <span class="font_red">*</span></th>
								<td colspan="2">
									<select name="ad_role" id="ad_role">
										<option value="0">선택하세요</option>
										<option value="1">사원급</option>
										<option value="2">대리급</option>
										<option value="3">부장급</option>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">직무 <span class="font_red">*</span></th>
								<td colspan="2">
									<select name="ad_position" id="ad_position">
										<option value="0">선택하세요</option>
										<option value="1">개발자</option>
										<option value="2">생산관리</option>
										<option value="3">재무회계</option>
										<option value="4">노무</option>
										<option value="5">영업</option>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">근무형태 <span class="font_red">*</span></th>
								<td colspan="2">
									<select name="ad_type" id="ad_type">
										<option value="0">선택하세요</option>
										<option value="1">정규직</option>
										<option value="2">계약직</option>
										<option value="3">인턴</option>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">근무지역 <span class="font_red">*</span></th>
								<td colspan="2">
									<select name="ad_location" id="ad_location">
										<option value="0">선택하세요</option>
										<option value="1">서울</option>
										<option value="2">경기</option>
										<option value="3">강원</option>
										<option value="4">경상</option>
										<option value="5">제주</option>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">우대사항 <span class="font_red">*</span></th>
								<td colspan="2"><input type="text" class="inputTxt p100"
								name="ad_perference" id="ad_perference" /></td>
							</tr>
							<tr>
								<th scope="row">마감기한 <span class="font_red">*</span></th>
								<td colspan="2">
									<input type="date" id="ad_date" name="ad_date" min="" style="font-size: 1.5em"/>
								</td>
							</tr>
							<!-- 공고내용 -->
							<tr>
								<th colspan="3" style="background-color: #fff; height: 75px">공고내용</th>
							</tr>
							<tr>
								<td colspan="3"><textarea id="ad_content" name="ad_content" rows="10" cols="500"></textarea></td>
							</tr>
						</tbody>
					</table>

					<!-- e : 여기에 내용입력 -->

					<div class="btn_areaC mt30">
						<a href="" class="btnType blue" id="btnSavefile" name="btn"><span>채용공고 등록</span></a>
						<a href="" class="btnType blue" id="btnUpdatefile" name="btn"><span>채용공고 수정</span></a>
						<a href="" class="btnType gray" id="btnDeletefile" name="btn"><span>채용공고 삭제</span></a>
						<a href="" class="btnType gray" id="btnClosefile" name="btn"><span>닫기</span></a>
					</div>
					<div class="btn_areaC mt30" id="acceptBox">
						<a href="" class="btnType blue" id="btnRestart" name="btn"><span>공고 재시작</span></a>
						<a href="" class="btnType blue" id="btnCancel" name="btn"><span>공고 취소</span></a>
						<a href="" class="btnType blue" id="btnComplete" name="btn"><span>모집 완료</span></a>
					</div>
				</dd>
				</div>

			</dl>
			<a href="" class="closePop"><span class="hidden">닫기</span></a>
		</div>

	</form>
</body>
</html>