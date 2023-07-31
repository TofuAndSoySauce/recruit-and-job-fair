<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>제안(이력서)현황</title>
<!-- sweet alert import -->
<script src='${CTX_PATH}/js/sweetalert/sweetalert.min.js'></script>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<!-- sweet swal import -->

<script type="text/javascript">

	var pageSize = 5; // 한 페이지당 보여줄 데이터
	var pageBlockSize = 5; // 한 화면에 몇 페이지를 보여줄지 (1~5 페이지 -> 6~10 페이지)
	
	$(function(){
		
		// Select 박스 에서 (신입/경력)박스 불러오기
		comcombo("resume_experience","experience","sel","");
		
		// Select 박스 에서 (직무)박스 불러오기
		comcombo("position","position","sel","");
		
		// 이력서 조회하기
		fn_searchResume();
		
		// 제안(이력서) 현황 조회하기
		fn_searchPropStat();
		
	})
	
	function initpopup(object){
		
		// resume 데이터 초기화
		$("#resume_title").val(object.resume_title);
		$("#addfile").val("");
		$("#resume_education").val(object.resume_education);
		$("#resume_school").val(object.resume_school);
		$("#resume_major").val(object.resume_major);
		$("#resume_postion").val(object.resume_postion);
		$("#resume_location").val(object.resume_location);
		$("#resume_hireType").val(object.resume_hireType);
		$("#resume_salary").val(object.resume_salary);
		$("#resume_experience").val(object.resume_experience);
		$("#resume_letterTitle").val(object.resume_letterTitle);
		$("#resume_letterContent").val(object.resume_letterContent);
		$("#resume_no").val(object.resume_no);
		if (object.resume_yn == 1) $("#resume_y").prop("checked", true);
		else $("#resume_n").prop("checked", true);
		
		// userinfo 데이터 초기화
		$("#name").val(object.name);
		$("#user_birthday").val(object.user_birthday);
		$("#user_sexuality").val(object.user_sexuality);
		$("#user_phone").val(object.user_phone);
		$("#user_email").val(object.user_email);
		$("#user_zipcode").val(object.user_zipcode);
		$("#user_address1").val(object.user_address1);
		$("#user_address2").val(object.user_address2);
		
		// 읽기 전용으로 변경
		$("#resume_education").prop('disabled',true);
		$("#resume_school").attr("readonly",true);
		$("#resume_major").attr('disabled',true);
		$("#resume_postion").attr('disabled',true);
		$("#resume_location").attr('disabled',true);
		$("#resume_hireType").attr('disabled',true);
		$("#resume_salary").attr('disabled',true);
		$("#resume_experience").attr('disabled',true);
		$("#resume_letterTitle").attr("readonly",true);
		$("#resume_letterContent").attr("readonly",true);
		
		//히스토리_no ,resume_no백업
		$("#history_no").val(object.history_no);
		var proposal_no = $("#proposal_no").val(object.proposal_no);
		
		console.log("번호 :" + proposal_no);
		
		/*if($("#history_no").val(object.history_no)){
			
			$("#offer").hide();
			
		}*/
		
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
		
		$("#addfile").hide();
		
		$("#fileview").empty().append(previewhtml);
		
	}
	
	// 제안(이력서)현황 조회 함수
	function fn_searchResume(cpage){
		
		// 현재 페이지가 1이 아니면 1로 가게 하는 함수 (1이면 1로 가고 1이 아니면 1로 가는 함수)
		cpage = cpage || 1;
		
		if($("#search").click(function(){
			
			if($("#experience").val() == "" ) {
				
				swal("구분을 입력해 주세요!!");
				
				return;
					
			} if($("#srctitle").val() == ""){
				
				swal("제목을 입력해 주세요!!");
				
				return;
				
			}
			
		})
		
		
		)
		
		// mapper 문서와 jsp 문서간에 주고 받는 데이터들을 객체로 만들었다 (where절임.)
		var param = {
				
				// 검색 조건
				srctitle : $("#srctitle").val(), // 제목
				experience : $("#experience").val(), // 구분(신입/경력)
						
				pageSize : pageSize,
				cpage : cpage
				
		}
		
		var listcallback = function(res) {
			
			$("#listResume").empty().append(res);
			
			var countResumeList = $("[name=totcnt]").val();
			
			// 페이지 네이션을 적용하는 함수
			var paging = getPaginationHtml(cpage, countResumeList, pageSize, pageBlockSize, 'fn_searchResume');
			
			$("#ResumePagination").empty().append(paging); // append : 현재 대상의 엘리면트 내에 맨끝에 새로운 앨리면트를 추가하는 함수
			
			$("#currentpage").val(cpage);
			
		}
		
		callAjax("/ad/resumeList.do", "post", "text", "false", param, listcallback);
		
	}
	
	// 이력서 상세 보기
	// jsp 문서에서 조회 와 등록을 두개 동시에 하지 말고 Controller 문서에서 동시에 하는게 낫다.
	function fn_openResume(resume_no){
		
		var param = {
				
				resume_no : resume_no
				
			}
		
		var detailcallback = function(res){
			console.log(res);
	 		initpopup(res);
			gfModalPop("#resumeRegfile");
			fn_proposalNo(resume_no);
		}
		
		callAjax("/ad/resumeDetail.do", "post", "json", "false", param, detailcallback);
		
	}
	
	// 면접 제안 번호 구하는 메소드
	function fn_proposalNo(resume_no){
		
		var param = {
				
				resume_no : resume_no
				
		}
		
		var searchcallback = function(res){
			
			if(res.proposal_no != 0){
				
				$("#offer").hide();
				
			} 
			
		}
		
		callAjax("/ad/searchProposalNo.do", "post", "json", "false", param, searchcallback);
		
	}
	
	// 제안 신청 버튼을 누르면 팝업 창이 나오는 메소드
	function fn_jobOffer(){
		
		gfModalPop("#jobofferreg");
		
		$("#reg_date" ).datepicker();
		
		$("#reg_date2" ).datepicker();
		
		$("#reg_date").val("");
		
		$("#reg_date2").val("");
		
	}
	
	// 제안 신청 메소드
	function fn_joboffersave(){
		
		var resume_no = $("#resume_no").val();
		
		var memo = $("#name2").val() + "의 면접 제안일은 " + $("#reg_date").val() + "이거나 " + $("#reg_date2").val() + "입니다. 두 날짜 중에 선택해 주세요.";
		
		var mail_title = $("#userNm").val() + "의 면접일자를 제안 받았습니다.";
		
		var mail_content = "안녕하세요 " + memo + " 감사합니다. ";
			
		// mapper 문서에서 insert할 속성들의 모음 (mapper 문서에서 강제로 값을 넣거나 now()를 쓰는 date 타입의 변수를 제외한 속성들)
		var param = {
				
						name : $("#name2").val(),
				
						position : $("#position").val(),
				
						experience : $("#experience2").val(),
				
						memo : memo,
				
						mail_title : mail_title,
				
						mail_content : mail_content,
				
						mailother : $("#id").val(),
				
						resume_no : resume_no
				
		}
		
		var savecallback = function(res){
			
			if(res.result == "SUCCESS"){
				
				alert("저장되었습니다.");
				
				gfCloseModal();
				
				fn_searchResume();
				
				fn_searchPropStat();
				
			}
			
		}
		
		callAjax("/ad/joboffersave.do", "post", "json", "false", param, savecallback);
		
		
	}
	
	// 면접 취소 메소드
	function fn_jobCancle(proposal_no){
		
		var param = {
				
				proposal_no : proposal_no
				
			}
			
			var cnaclecallback = function(res){
				
				console.log("res : " + res);
				
				if(res.result == "SUCCESS"){
					
					alert("저장되었습니다.");
					
					fn_searchResume();
					
					fn_searchPropStat();
					
				}
				
			}
			
			callAjax("/ad/jobcancle.do", "post", "json", "false", param, cnaclecallback);
			
	}
	
	// 제안(이력서)현황 조회 함수
	function fn_searchPropStat(cpage){
		
		// 현재 페이지가 1이 아니면 1로 가게 하는 함수 (1이면 1로 가고 1이 아니면 1로 가는 함수)
		cpage = cpage || 1;
		
		// mapper 문서와 jsp 문서간에 주고 받는 데이터들을 객체로 만들었다 (where절임.)
		var param = {
				
				pageSize : pageSize,
				cpage : cpage
				
		}
		
		var statuscallback = function(res) {
			
			$("#listProposalStatus").empty().append(res);
			
			var countPropStatList = $("[name=totcnt2]").val();
			
			if(countPropStatList == 0) {
				
				previewhtml = "<tr><td colspan='4'>해당 데이터가 없습니다.</td></tr>";
				
				$("#listProposalStatus").empty().append(previewhtml);
				
			}
			
			// 페이지 네이션을 적용하는 함수
			var paging = getPaginationHtml(cpage, countPropStatList, pageSize, pageBlockSize, 'fn_searchPropStat');
			
			$("#propStatPagination").empty().append(paging); // append : 현재 대상의 엘리면트 내에 맨끝에 새로운 앨리면트를 추가하는 함수
			
			$("#currentpage").val(cpage);
			
		}
		
		callAjax("/ad/resuPropList.do", "post", "text", "false", param, statuscallback);
		
	}
	
</script>

</head>

<body>

	<form id="proposalStatus" action="" method="">
		<!-- <input type="hidden" name="action" id="action" value=""> -->
		<input type="hidden" name="loginId" id="loginId" value="${loginId}"> <!-- 내눈에는 안보이지만 로그인한 아이디값은 폼 안에 있다. -->
		<input type="hidden" name="userNm" id="userNm" value="${userNm}">
		<input type="hidden" name="history_no" id="history_no" value=""> 
		<input type="hidden" name="currentpage" id="currentpage" value="">
		<input type="hidden" name="filecd" id="filecd" value="">
		<input type="hidden" name="memo" id="memo" value="">
		
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
								<span class="btn_nav bold">기업관리</span> 
								<span class="btn_nav bold">제안(이력서) 현황</span> 
								<a href="../ad/proposalStatus.do" class="btn_set refresh">새로고침</a>
							</p>
							<p class="conTitle">
								<span class="btn_nav bold" id="proposalStatus">제안(이력서)현황 </span>
							</p>

							<p>
								<span class="fr">
									<select class="form-control" name="experience" id="experience">
									</select>
									이력서 제목 <input type="text" id="srctitle" name="srctitle" />
									<a class="btnType blue" href="javascript:fn_searchResume();" name="btn" id="search"><span>검색</span></a>
								</span>
							</p>
							<div class="divComGrpCodList">
								<p class="conTitle">
									<span class="btn_nav bold" id="sendMailBox">이력서 보기 </span>
								</p>
								<table class="col">
									<caption>caption</caption>
									<colgroup>
										<col width="7%">
										<col width="10%">
										<col width="10%">
										<col width="73%">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">번호</th>
											<th scope="col">구분</th>
											<th scope="col">지원자명</th>
											<th scope="col">이력서 제목</th>
										</tr>
									</thead>
									<tbody id="listResume"></tbody>
								</table>
							</div>

							<div class="paging_area" id="ResumePagination"></div>
							
							<div class="divComGrpCodList" style="margin-top : 10px;">
								<p class="conTitle">
									<span class="btn_nav bold" id="sendMailBox">현황 관리 </span>
								</p>
								<table class="col">
									<caption>caption</caption>
									<colgroup>
										<col width="7%">
										<col width="10%">
										<col width="10%">
										<col width="73%">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">번호</th>
											<th scope="col">구분</th>
											<th scope="col">지원자명</th>
											<th scope="col"></th>
										</tr>
									</thead>
									<tbody id="listProposalStatus"></tbody>
								</table>
							</div>

							<div class="paging_area" id="propStatPagination"></div>

						</div> <!--// content -->

						<h3 class="hidden">풋터 영역</h3> 
						<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
					</li>
				</ul>
			</div>
		</div>

		<div id="resumeRegfile" class="layerPop layerType2" style="width: 700px;">
		<input type="hidden" name="history_no" id="history_no" value="">
		<input type="hidden" name="proposal_no" id="proposal_no" value="">
		<input type="hidden" name="resume_no" id="resume_no" value="">
			<dl>
				<dt>
					<strong>이력서</strong>
				</dt>
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
                  
                     <!-- 이력서 제목 -->
                     <tr>
                        <th colspan="3" style="background-color: #fff; height: 75px">이력서 제목</th>
                     </tr>
                     <tr>
                        <th scope="row">이력서 제목 <span class="font_red">*</span></th>
                        <td colspan="2"><input type="text" class="inputTxt p100"
                        name="resume_title" id="resume_title" /></td>
                     </tr>
                     
                     <!-- 인적사항 -->
                     <tr>
                        <th colspan="3" style="background-color: #fff; height: 75px">인적사항</th>
                     </tr>
                     <tr>
                        <td>
                           <div id="fileview"></div>
                        </td>
                        <th scope="row">이력서 사진 등록 <span class="font_red">*</span></th>
                        <td>
                           <input multiple="multiple" type="file" class="btnType blue" name="addfile"
                           id="addfile" />
                        </td>
                     </tr>
                     <tr>
                        <th scope="row">이름 <span class="font_red">*</span></th>
                        <td colspan="2"><input type="text" class="inputTxt p100"
                           name="name" id="name" readonly /></td>
                     </tr>
                     <tr>
                        <th scope="row">생년월일 <span class="font_red">*</span></th>
                        <td colspan="2"><input type="text" class="inputTxt p100"
                           name="user_birthday" id="user_birthday" readonly /></td>
                     </tr>
                     <tr>
                        <th scope="row">성별 <span class="font_red">*</span></th>
                        <td colspan="2"><input type="text" class="inputTxt p100"
                           name="user_sexuality" id="user_sexuality" readonly /></td>
                     </tr>
                     <tr>
                        <th scope="row">휴대폰번호 <span class="font_red">*</span></th>
                        <td colspan="2"><input type="text" class="inputTxt p100"
                           name="user_phone" id="user_phone" readonly /></td>
                     </tr>
                     <tr>
                        <th scope="row">이메일 <span class="font_red">*</span></th>
                        <td colspan="2"><input type="text" class="inputTxt p100"
                        name="user_email" id="user_email" readonly /></td>
                     </tr>
                     <tr>
                        <th scope="row">우편번호 <span class="font_red">*</span></th>
                        <td colspan="2"><input type="text" class="inputTxt p100"
                        name="user_zipcode" id="user_zipcode" readonly /></td>
                     </tr>
                     <tr>
                        <th scope="row">주소 <span class="font_red">*</span></th>
                        <td colspan="2"><input type="text" class="inputTxt p100"
                        name="user_address1" id="user_address1" readonly /></td>
                     </tr>
                     <tr>
                        <th scope="row">상세주소 <span class="font_red">*</span></th>
                        <td colspan="2"><input type="text" class="inputTxt p100"
                        name="user_address2" id="user_address2" readonly /></td>
                     </tr>
                     
                     <!-- 학력 -->
                     <tr style="margin-top:100px">
                        <th colspan="3" style="background-color: #fff; height: 75px">학력</th>
                     </tr>
                     <tr>
                        <th scope="row">학력 <span class="font_red">*</span></th>
                        <td colspan="2">
                           <select name="resume_education" id="resume_education">
                              <option value="1">고등학교 졸업</option>
                              <option value="2">전문대 졸업</option>
                              <option value="3">대학교 졸업</option>
                              <option value="4">대학원 졸업</option>
                           </select>
                        </td>
                     </tr>
                     <tr>
                        <th scope="row">학교명 <span class="font_red">*</span></th>
                        <td colspan="2"><input type="text" class="inputTxt p100"
                        name="resume_school" id="resume_school" /></td>
                     </tr>
                     <tr>
                        <th scope="row">전공 <span class="font_red">*</span></th>
                        <td colspan="2">
                           <select name="resume_major" id="resume_major">
                              <option value="1">컴퓨터</option>
                              <option value="2">공학</option>
                              <option value="3">경영</option>
                              <option value="4">법학</option>
                              <option value="5">기타</option>
                           </select>
                        </td>
                     </tr>

                     <!-- 희망근무조건 -->
                     <tr>
                        <th colspan="3" style="background-color: #fff; height: 75px">희망근무조건</th>
                     </tr>
                     <tr>
                        <th scope="row">희망 직무 <span class="font_red">*</span></th>
                        <td colspan="2">
                           <select name="resume_postion" id="resume_postion">
                              <option value="1">개발자</option>
                              <option value="2">생산관리</option>
                              <option value="3">재무회계</option>
                              <option value="4">노무</option>
                              <option value="5">영업</option>
                           </select>
                        </td>
                     </tr>
                     <tr>
                        <th scope="row">희망 근무지 <span class="font_red">*</span></th>
                        <td colspan="2">
                           <select name="resume_location" id="resume_location">
                              <option value="1">서울</option>
                              <option value="2">경기</option>
                              <option value="3">강원</option>
                              <option value="4">경상</option>
                              <option value="5">제주</option>
                           </select>
                        </td>
                     </tr>
                     <tr>
                        <th scope="row">고용 형태 <span class="font_red">*</span></th>
                        <td colspan="2">
                           <select name="resume_hireType" id="resume_hireType">
                              <option value="1">정규직</option>
                              <option value="2">계약직</option>
                              <option value="3">인턴</option>
                           </select>
                        </td>
                     </tr>
                     <tr>
                        <th scope="row">희망 연봉 <span class="font_red">*</span></th>
                        <td colspan="2">
                           <select name="resume_salary" id="resume_salary">
                              <option value="1">3000 ~ 4000만원</option>
                              <option value="2">4000 ~ 5000만원</option>
                              <option value="3">5000 ~ 6000만원</option>
                              <option value="4">6000만원 이상</option>
                           </select>
                        </td>
                     </tr>
                     <tr>
                        <th scope="row">요구 경력 <span class="font_red">*</span></th>
                        <td colspan="2">
                           <select name="resume_experience" id="resume_experience">
                              <option value="1">신입</option>
                              <option value="2">1~2 년차</option>
                              <option value="3">3~4 년차</option>
                              <option value="4">5년차 이상</option>
                           </select>
                        </td>
                     </tr>

                     
                     <!-- 자기소개서 -->
                     <tr>
                        <th colspan="3" style="background-color: #fff; height: 75px">자기소개서</th>
                     </tr>
                     <tr>
                        <th scope="row">자기소개서 제목 <span class="font_red">*</span></th>
                        <td colspan="2"><input type="text" class="inputTxt p100"
                        name="resume_letterTitle" id="resume_letterTitle" /></td>
                     </tr>
                     <tr>
                        <td colspan="3"><textarea id="resume_letterContent" name="resume_letterContent" rows="10" cols="500"></textarea></td>
                     </tr>
                     
                  </tbody>
               </table>

               <!-- e : 여기에 내용입력 -->
			  
				
               	 <div class="btn_areaC mt30">
               	 	<a class="btnType blue" href="javascript:fn_jobOffer();" name="offer" id="offer"><span>면접 제안</span></a>
                  	<a href="" class="btnType gray" id="btnClosefile" name="btn"><span>닫기</span></a>
               	</div>
            </dd>
         </dl>
         <a href="" class="closePop"><span class="hidden">닫기</span></a>
      </div>
      
      <div id="jobofferreg" class="layerPop layerType2"
			style="width: 400px;">
			<dl>
				<dt>
					<strong>면접 제안</strong>
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
								<th scope="row">면접 제안 날짜 1 <span class="font_red">*</span></th>
								<td colspan="3"><input type="text" class="inputTxt p100"
									name="reg_date" id="reg_date" style="font-size: 15px"/></td>
							</tr>
							<tr>
								<th scope="row">면접 제안 날짜 2 <span class="font_red">*</span></th>
								<td colspan="3"><input type="text" class="inputTxt p100"
									name="reg_date" id="reg_date2" style="font-size: 15px"/></td>
							</tr>

						</tbody>
					</table>

					<!-- e : 여기에 내용입력 -->
					
						
						<div class="btn_areaC mt30">
							<a href="javascript:fn_joboffersave();" class="btnType blue" id="btnSavefile" name="btn"><span>요청하기</span></a>
						</div>
				</dd>
			</dl>
			<a href="" class="closePop"><span class="hidden">닫기</span></a>
		</div>

	</form>

</body>
</html>