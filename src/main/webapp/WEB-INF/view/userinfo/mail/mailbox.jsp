<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>메일함</title>
<!-- sweet alert import -->
<script src='${CTX_PATH}/js/sweetalert/sweetalert.min.js'></script>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<!-- sweet swal import -->

<script type="text/javascript">

	var pageSize = 1; // 한 페이지당 보여줄 데이터
	var pageBlockSize = 5; // 한 화면에 몇 페이지를 보여줄지 (1~5 페이지 -> 6~10 페이지)
	
	function validation () {
		
		if ($("#mailother").val() == "") {
			alert("받는이를 입력해주세요.");
			$("#mailother").focus();
			return false;
		}

		if ($("#mail_title").val() == "") {
			alert("제목을 입력해주세요.");
			$("#mail_title").focus();
			return false;
		}
		
		if ($("#mail_content").val() == "") {
			alert("내용을 입력해주세요.");
			$("#mail_content").focus();
			return false;
		}
		
		fn_sendfile();
	}

	// 가장 먼저 실행되는 함수
	$(function() {
		
		// 버튼을 클릭시 실행되는 함수
		fn_buttonClickEvent();
		
		// 보낸 메일함 조회 함수
		fn_searchSendMail();
		
		// 메일함을 클릭시 초기에는 보낸메일함만 보여주게 하기 위해 받은 메일함 Form은 안보이게 하기
		$("#receiveMail").hide();
		
		initpopup();
		
	});
	
	function fn_buttonClickEvent() {
			
		$("[name=receMailBox]").click(function(e) {
			
			e.preventDefault();
			
			// 보낸 메일함 폼 숨기기
			$("#sendMail").hide();
			
			// 받은 메일함 폼 보이기
			$("#receiveMail").show();
			
			/*$("#sendMail2").addClass('color1');
			$("#sendMail2").removeClass('color2');
			$("#receiveMail2").addClass('color2');
			$("#receiveMail2").removeClass('color1');*/
			
			// 받은 메일함 조회 함수
			fn_searchReceMail();
			
		})
		
		// 보낸 메일함 클릭시 발생되는 함수
		$("[name=sendMailBox]").click(function(e) {
			
			e.preventDefault();
			
			// 받은 메일함 폼 숨기기
			$("#receiveMail").hide();
			
			// 보낸 메일함 폼 보이기
			$("#sendMail").show();
			
			/*$("#sendMail").addClass('color2');
			$("#sendMail").removeClass('color1');
			$("#receiveMail").addClass('color1');
			$("#receiveMail").removeClass('color2');*/
			
			// 보낸 메일함 조회 함수
			fn_searchSendMail();
			
		})
		
		// a 태그에서 name = btn인 것을 클릭시 발생되는 함수
		$("a[name=btn]").click(function(e) {
			
			// 기본 동작 실행 금지
			e.preventDefault();
			
			// a 태그에서 name = btn 중에서 버튼의 id를 변수로 한다
			var btnId = $(this).attr("id");
			
			console.log(btnId);
			
			switch (btnId) {
			
				case "btnSendSearch":
					
					$("#btnSendSearch").val("");
					
					$("#btnSendSearch").val("S")
					
					if($("#srcsdate").val()!= '' && $("#srcedate").val() != '') {
						
						if($("#srcsdate").val()>$("#srcedate").val()){
    						swal("종료일이 시작일 보다 빠를 수 없습니다.");
    						return;
    					}
						
						
    				}
					
					if($("#srctitle").val() == ''){
						
						swal("제목을 입력해 주세요!!");
						
						return;
						
					}
					
					fn_searchSendMail();
					
					break;
					
				case "btnReceSearch":
					
						if($("#Todate").val()!= '' && $("#Enddate").val() != '') {
						
							if($("#Todate").val()>$("#Enddate").val()){
    							swal("종료일이 시작일 보다 빠를 수 없습니다.");
    							return;
    						}
						
						
    					}
					
						if($("#mailTitle").val() == ""){
						
							swal("제목을 입력해 주세요!!");
						
							return;
						
						}
					
					fn_searchReceMail();
					
					break;
			
				case "btnSavefile":
					
					validation();
				
					//fn_sendfile(); // 메일을 보내는 함수
				
					break;
				
				case "btnClosefile":
				
					gfCloseModal(); // 모달창을 닫는 함수
				
					break; // case문을 빠져 나오는 키워드
				
			}
			
			
		})
		
			// 파일 미리보기
			var upfile = document.getElementById("addfile"); // 파일 추가 변수 정의
		
			upfile.addEventListener("change", function(event){
			
				$("#fileview").empty(); // 파일 미리보기 탭 내용을 비운다.
			
				var image = event.target; // ??
			
				var imgpath = ""; // 이미지 경로
			
				if(image.files[0]){
				
					imgpath = window.URL.createObjectURL(image.files[0]); // 이미지 경로 저장
				
					var filearr = $("#addfile").val().split("."); // 이미지 경로 / 확장자명 분리해서 변수 생성
				
					// 미리보기를 위해 html태그를 생성할꺼임
					var previewhtml = "";
					
					console.log(filearr);
				
					if(filearr[1] == "jpg" || filearr[1] == "png"){
					
						previewhtml = "<img src='" + imgpath + "' style='width: 200px; height: 130px;' />"; // 이미지 태그 생성
					
					}
				
					$("#fileview").empty().append(previewhtml); // 이미지 태그 추가
				
				}
				
			});
		
		};
		
		// 초기화 함수(텍스트 박스 빈공란 만들기)
		function initpopup(object){
			
			// 받은 메일함 클릭시 발생되는 함수
			/*$("[name=receMailBox]").click(function(/*e) {*/
				
				//e.preventDefault();
				
				// 보낸 메일함 폼 숨기기
				/*$("#sendMail").hide();
				
				// 받은 메일함 폼 보이기
				$("#receiveMail").show();
				
				$("#sendMail").addClass('color2');
				$("#sendMail").removeClass('color1');
				$("#receiveMail").addClass('color1');
				$("#receiveMail").removeClass('color2');
				
				// 받은 메일함 조회 함수
				fn_searchReceMail();
				
			})
			
			// 보낸 메일함 클릭시 발생되는 함수
			$("[name=sendMailBox]").click(function() {
				
				// 받은 메일함 폼 숨기기
				$("#receiveMail").hide();
				
				// 보낸 메일함 폼 보이기
				$("#sendMail").show();
				
				$("#receiveMail").addClass('color2');
				$("#receiveMail").removeClass('color1');
				$("#sendMail").addClass('color1');
				$("#sendMail").removeClass('color2');
				
				// 보낸 메일함 조회 함수
				fn_searchSendMail();
				
			})*/
			
			// 보내기 버튼 클릭시 모든 내용 초기화 상태 (빈 공란 임과 동시에 해당 데이터가 없는 경우)
			
			if(object == "" || object == null || object == undefined) {
			
				$("#mailother").val("");
				$("#mail_title").val("");
				$("#mail_content").val("");
				$("#addfile").val("");
				$("#fileview").empty();
				
				$("#btnSavefile").show();
			
			} else /*해당 데이터가 있는 경우 (제목 버튼을 클릭시)*/{
				
				var param = {
						
						mail_no : object.detail.mail_no
					
				}
				
				console.log(object.detail);
			
			// 데이터를 보여준다.
			$("#mailother").val(object.detail.name);
			$("#loginID").val(object.detail.name);
			$("#mail_title").val(object.detail.mail_title);
			$("#mail_content").val(object.detail.mail_content);
			$("#addfile").val();
			$("#mail_title2").val(object.detail.mail_title);
			$("#mail_content2").val(object.detail.mail_content);
			$("#addfile2").val();
			$("#fileview").empty();
			$("#filecd").val(object.detail.file_cd);
			$("#fileview2").empty();
			
			$("#btnSavefile").hide();
			
			// 읽기 전용 으로 변경
			$("#mailother").attr("readonly",true);
			$("#mail_title").attr("readonly",true);
			$("#mail_content").attr("readonly",true);
			$("#mail_title2").attr("readonly",true);
			$("#mail_content2").attr("readonly",true);
			
			// 저장된 파일 미리보기
			var file_name = object.detail.file_name;
			var filearr = [];
			var previewhtml = "";
			
			if( file_name == "" || file_name == null || file_name == undefined) {
				previewhtml = "";
			} else {
				
				filearr = file_name.split(".");
				console.log(filearr);
				
				
				if (filearr[1] == "jpg" || filearr[1] == "png") {
					previewhtml = "<a href='javascript:fn_downaload()'>   <img src='" + object.detail.file_nadd + "' style='width: 200px; height: 130px;' />  </a>";
				} else {
					previewhtml = "<a href='javascript:fn_downaload()'>" + object.detail.file_name  + "</a>";
				}
			}
			
			$("#addfile").hide();
			
			$("#fileview").empty().append(previewhtml);
			$("#fileview2").empty().append(previewhtml);
				
			}
			
		}
		
		// 메일함 보내기 함수
		function fn_sendfile(){
			
			var frm = document.getElementById("sendMail"); // JSP에 있는 모든 데이터를 가져오기 위한 변수 정의
			
			frm.enctype = "multipart/form-data"; // 첨부파일 때문에 필요함.
			
			var param = new FormData(frm); // JSP에 있는 모든 내용을 param에 있습니다.
			
			var savecallback = function(res){
				
				// Controller 문서에서 returnMap에 추가한 Result값과 비교한다.
				if(res.result == "SUCCESS"){
					
					alert("저장되었습니다.");
					
					gfCloseModal();
					
					fn_searchSendMail();
					
				}
				
				if(res.result == "Fail"){
					
					alert("받는이의 아이디가 현재 회원이 아닙니다.");
					
				}
			}
			
			// 새로 고침 하지 않고 등록이 되는 함수(AJAX) 그리고 Controller 단과 JSP 단에서 데이터가 주고 받는 함수입니다. (실질적 역할은 URL("/userInfo/mailsendfile.do")입니다.)
			
			callAjaxFileUploadSetFormData("/userInfo/mailsendfile.do", "post", "json", true, param, savecallback);
			
		}
	
		// 메일 보내기 팝업 열기
		function fn_openPop(){
			
			initpopup();
		
			gfModalPop("#mailregfile");
		
		}
		
		// 보낸 메일함 조회 함수
		function fn_searchSendMail(cpage) {
			
				// 현재 페이지가 1이 아니면 1로 가게 하는 함수 (1이면 1로 가고 1이 아니면 1로 가는 함수)
				cpage = cpage || 1;
				
				$("#cpage").val(cpage);
				
				if($("#btnSendSearch").val() == "S") {
					
					console.log($("#btnSendSearch").val())
					
					var param = {
							
							// 검색 조건
							srctitle : $("#srctitle").val(), // 제목
							srcsdate : $("#srcsdate").val(), // 시작일자 (검색)
							srcedate : $("#srcedate").val(), // 종료일자 (검색)
										
							pageSize : pageSize,
							cpage : cpage
										
						}
					
				} else {
					console.log($("#btnSendSearch").val())
					var param = {
							
                            pageSize: pageSize,
                            cpage: cpage,
                            

                        };
					
				}
				
				console.log("TEST : " + $("#srctitle").val(""));
				
				var listcallback = function(res) {
				
					$("#listSendMail").empty().append(res);
				
					var countSendMailList = $("#totcnt").val();
						
					// 페이지 네이션을 적용하는 함수
					var paging = getPaginationHtml(cpage, countSendMailList, pageSize, pageBlockSize, 'fn_searchSendMail');
							
					$("#noticePagination").empty().append(paging); // append : 현재 대상의 엘리면트 내에 맨끝에 새로운 앨리면트를 추가하는 함수
						
					$("#currentpage").val(cpage);
						
				}

				callAjax("/userInfo/maillist.do", "post", "text", "false", param, listcallback);
				
		}
		
		// 보낸 메일함에서 제목을 클릭시 해당 메일의 상세 내용 보기
		function fn_openDetail(mail_no){
			
			var param = {
					
					mailno : mail_no
					
				}
			
			var detailcallback = function(res){
				
				initpopup(res);
				
				gfModalPop("#mailregfile");
				
			}
			
			callAjax("/userInfo/sendmaildetail.do", "post", "json", "false", param, detailcallback);
		}
		
		// 받은 메일함 조회 함수
		function fn_searchReceMail(cpage) {
			
			// 현재 페이지가 1이 아니면 1로 가게 하는 함수 (1이면 1로 가고 1이 아니면 1로 가는 함수)
			cpage = cpage || 1;
			
			/*$("#btnReceSearch").click(function(){
				
				if($("#srcsdate").val()!= '' && $("#srcedate").val() != '') {
					
					if($("#srcsdate").val()>$("#srcedate").val()){
						swal("종료일이 시작일 보다 빠를 수 없습니다.");
						return;
					}
					
					
				}
				
				if($("#srctitle").val() == ""){
					
					swal("제목을 입력해 주세요!!");
					
					return;
					
				}
				})*/
				
			
			
			var param = {
						
						// 검색 조건
						srctitle : $("#srctitle").val(), // 제목
						srcsdate : $("#srcsdate").val(), // 시작일자 (검색)
						srcedate : $("#srcedate").val(), // 종료일자 (검색)
									
						pageSize : pageSize,
						cpage : cpage
						
			}
		
			var Recelistcallback = function(res) {
				
				$("#listReceiveMail").empty().append(res);
				
				var countReceMailList = $("[name=totRececnt]").val();
					
				// 페이지 네이션을 적용하는 함수
				var paging = getPaginationHtml(cpage, countReceMailList, pageSize, pageBlockSize, 'fn_searchReceMail');
					
				$("#mailRecePagination").empty().append(paging); // append : 현재 대상의 엘리면트 내에 맨끝에 새로운 앨리면트를 추가하는 함수
					
				$("#currentpage").val(cpage);
					
			}

			callAjax("/userInfo/mailrecelist.do", "post", "text", "false", param, Recelistcallback);
		}
		
		// 받은 메일함에서 제목을 클릭시 해당 메일의 상세 내용 보기
		function fn_openReceDetail(mail_no){
			
			var param = {
					
					mailno : mail_no
					
				}
			
			var detailcallback = function(res){
				
				console.log(res)
				
				initpopup(res);
				
				gfModalPop("#mailregfile2");
				
			}
			
			callAjax("/userInfo/Recemaildetail.do", "post", "json", "false", param, detailcallback);
		}
		
		// 메일함 삭제 함수
		function fn_deleteMail(){
			
			// 여러개의 체크 박스 중 선택한 체크박스의 값들을 변수로 선언한다.
			$("input[name='mail_no']:checked").each(function() {
				
			    var mailNo = $(this).val();
			    
			    var param = {
						
						mailno : mailNo
						
					}
				
				var deletecallback = function(res){
			    	
			    	swal("해당 메일을 삭제하였습니다.");
					
					fn_searchReceMail();
					
				}
				
				callAjax("/userInfo/deleteMail.do", "post", "json", "false", param, deletecallback);
			    
			});
			
		}

</script>

</head>
<body>
	<form id="sendMail" action="" method="">
		<!-- <input type="hidden" name="action" id="action" value=""> -->
		<input type="hidden" name="loginId" id="loginId" value="${loginId}"> <!-- 내눈에는 안보이지만 로그인한 아이디값은 폼 안에 있다. -->
		<!-- <input type="hidden" name="userNm" id="userNm" value=""> -->
		<input type="hidden" name="mailno" id="mailno" value=""> 
		<input type="hidden" name="currentpage" id="currentpage" value="">
		<input type="hidden" name="filecd" id="filecd" value="">
		<input type="hidden" name="cpage" id="cpage" value="">

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
								<span class="btn_nav bold">마이페이지</span> 
								<span class="btn_nav bold">메일함</span> 
								<a href="../userInfo/mailbox.do" class="btn_set refresh">새로고침</a>
							</p>
							<p class="conTitle">
								<span class="btn_nav bold" id="sendMailBox">보낸 메일함 </span>
							</p>

							<p>
								<a class="btnType3 color1" href="" name="receMailBox"><span>받은 메일함</span></a>
								<a class="btnType3 color2" href="" name="sendMailBox"><span>보낸 메일함</span></a>
								<span class="fr"> 
									제목 <input type="text" id="srctitle" name="srctitle" /> 
									<input type="date" id="srcsdate" name="srcsdate" /> ~ 
									<input type="date" id="srcedate" name="srcedate" /> 
									<a class="btnType blue" href="javascript:fn_searchSendMail();" name="btn" id="btnSendSearch"><span>검색</span></a>
									<a class="btnType blue" href="javascript:fn_openPop();" name="send"><span>보내기</span></a>
								</span>
							</p>
							<div class="divComGrpCodList">
								<table class="col">
									<caption>caption</caption>
									<colgroup>
										<col width="6%">
										<col width="10%">
										<col width="64%">
										<col width="10%">
										<col width="10%">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">번호</th>
											<th scope="col">받는 이</th>
											<th scope="col">제목</th>
											<th scope="col">읽은 날짜</th>
											<th scope="col">수신 여부</th>
										</tr>
									</thead>
									<tbody id="listSendMail"></tbody>
								</table>
							</div>

							<div class="paging_area" id="noticePagination"></div>

						</div> <!--// content -->

						<h3 class="hidden">풋터 영역</h3> 
						<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
					</li>
				</ul>
			</div>
		</div>

		<div id="mailregfile" class="layerPop layerType2" style="width: 700px;">
			<dl>
				<dt>
					<strong>메일 보내기</strong>
				</dt>
				<dd class="content">
					<!-- s : 여기에 내용입력 -->
					<table class="row">
						<caption>caption</caption>
						<colgroup>
							<col width="120px">
							<col width="*">
							<col width="120px">
							<col width="*">
						</colgroup>

						<tbody>
							<tr>
								<th scope="row">받는 이 <span class="font_red">*</span></th>
								<td><input type="text" class="inputTxt p100" name="mailother" id="mailother"/></td>
							</tr>
							<tr>
								<th scope="row">제목 <span class="font_red">*</span></th>
								<td colspan="3"><input type="text" class="inputTxt p100" name="mail_title" id="mail_title" /></td>
							</tr>

							<tr>
								<th scope="row">내용 <span class="font_red">*</span></th>
								<td colspan="3"><textarea class="inputTxt p100" name="mail_content" id="mail_content"> </textarea></td>
							</tr>

							<tr>
								<th scope="row">파일 </th>
								<td>
									<!-- input type="file" class="inputTxt p100" name="addfile" id="addfile"  onChange="fn_filechange(event)"  / -->
									<input multiple="multiple" type="file" class="btnType blue" name="addfile" id="addfile" />
								</td>
								<td colspan="2"><div id="fileview"></div></td>
							</tr>

						</tbody>
					</table>

					<!-- e : 여기에 내용입력 -->

					<div class="btn_areaC mt30">
						<a href="" class="btnType blue" id="btnSavefile" name="btn"><span>보내기</span></a>
						<a href="" class="btnType gray" id="btnClosefile" name="btn"><span>닫기</span></a>
					</div>
				</dd>
			</dl>
			<a href="" class="closePop"><span class="hidden">닫기</span></a>
		</div>

	</form>
	
	<form id="receiveMail" action="" method="">
		<!-- <input type="hidden" name="action" id="action" value=""> -->
		<input type="hidden" name="loginId" id="loginId" value="${loginId}"> <!-- 내눈에는 안보이지만 로그인한 아이디값은 폼 안에 있다. -->
		<!-- <input type="hidden" name="userNm" id="userNm" value=""> -->
		<input type="hidden" name="mailno" id="mailno" value=""> 
		<input type="hidden" name="currentpage" id="currentpage" value="">
		<input type="hidden" name="filecd" id="filecd" value="">

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
								<span class="btn_nav bold">마이페이지</span> 
								<span class="btn_nav bold">메일함</span> 
								<a href="../userInfo/mailbox.do" class="btn_set refresh">새로고침</a>
							</p>
							<p class="conTitle">
								<span class="btn_nav bold" id="receMailBox">받은 메일함 </span>
							</p>

							<p>	
								<a class="btnType3 color2" href="" name="receMailBox2"><span>받은 메일함</span></a>
								<a class="btnType3 color1" href="" name="sendMailBox2"><span>보낸 메일함</span></a>
								<span class="fr"> 
									제목 <input type="text" id="mailTitle" name="mailTitle" /> 
									<input type="date" id="Todate" name="Todate" /> ~ 
									<input type="date" id="Enddate" name="Enddate" /> 
									<a class="btnType blue" href="javascript:fn_searchReceMail();" name="btn" id="btnReceSearch"><span>검색</span></a>
									<a class="btnType blue" href="javascript:fn_deleteMail();" name="delete"><span>삭제</span></a>
								</span>
							</p>
							<div class="divComGrpCodList">
								<table class="col">
									<caption>caption</caption>
									<colgroup>
										<col width="6%">
										<col width="10%">
										<col width="74%">
										<col width="10%">
									</colgroup>
									<thead>
										<tr>
											<th scope="col"></th>
											<th scope="col">보낸 사람</th>
											<th scope="col">제목</th>
											<th scope="col">받은 날짜</th>
										</tr>
									</thead>
									<tbody id="listReceiveMail"></tbody>
								</table>
							</div>

							<div class="paging_area" id="mailRecePagination"></div>

						</div> <!--// content -->

						<h3 class="hidden">풋터 영역</h3> 
						<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
					</li>
				</ul>
			</div>
		</div>

		<div id="mailregfile2" class="layerPop layerType2" style="width: 700px;">
			<dl>
				<dt>
					<strong>메일 읽기</strong>
				</dt>
				<dd class="content">
					<!-- s : 여기에 내용입력 -->
					<table class="row">
						<caption>caption</caption>
						<colgroup>
							<col width="120px">
							<col width="*">
							<col width="120px">
							<col width="*">
						</colgroup>

						<tbody>
							<tr>
								<th scope="row">보낸 사람 <span class="font_red">*</span></th>
								<td><input type="text" class="inputTxt p100" name="loginID" id="loginID"/></td>
							</tr>
							<tr>
								<th scope="row">제목 <span class="font_red">*</span></th>
								<td colspan="3"><input type="text" class="inputTxt p100" name="mail_title2" id="mail_title2" /></td>
							</tr>

							<tr>
								<th scope="row">내용 <span class="font_red">*</span></th>
								<td colspan="3"><textarea class="inputTxt p100" name="mail_content2" id="mail_content2"> </textarea></td>
							</tr>

							<tr>
								<th scope="row">파일 <span class="font_red">*</span></th>
								<td>
									<!-- input type="file" class="inputTxt p100" name="addfile" id="addfile"  onChange="fn_filechange(event)"  / -->
									<input multiple="multiple" type="file" class="btnType blue" name="addfile2" id="addfile2" />
								</td>
								<td colspan="2"><div id="fileview2"></div></td>
							</tr>

						</tbody>
					</table>

					<!-- e : 여기에 내용입력 -->

					<div class="btn_areaC mt30">
						<a href="" class="btnType gray" id="btnClosefile" name="btn"><span>닫기</span></a>
					</div>
				</dd>
			</dl>
			<a href="" class="closePop"><span class="hidden">닫기</span></a>
		</div>

	</form>
</body>
</html>