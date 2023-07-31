<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>부스신청 목록</title>
<!-- sweet alert import -->
<script src='${CTX_PATH}/js/sweetalert/sweetalert.min.js'></script>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<!-- sweet swal import -->
</head>

<script type="text/javascript">
	//페이징 설정을 하는 겁니다 
	var pageSize = 10;
	var pageBlockSize = 5;

	$(function() {
		buttonClickEvent();
		fn_jobFairBoothMgtList($("#currentpage").val());
	});

	function buttonClickEvent() {
		$("a[name=btn]").click(function(e) {
			e.preventDefault();

			var btnId = $(this).attr("id");

			switch (btnId) {
			case 'btnClick':
				$("#clickBtn").val(''); //검색후 검색한것 초기화 용도
				$("#clickBtn").val('Z');
				fn_jobFairBoothMgtList($("#currentpage").val());
				break; 
			case "btnSavefile":
				savefile();
				break;

			case "btnClosefile":
				fn_jobFairBoothMgtList($("#currentpage").val());
				gfCloseModal();
				break;
			}
		});
	}

	function fn_jobFairBoothMgtList(cpage) {
		cpage = cpage || 1;

 		if ($("#clickBtn").val() == 'Z') {
			var param = {
				srctitle : $("#srctitle").val(),
				region : $("#region").val(),
				pageSize : pageSize,
				cpage : cpage
			}
		} else { 
			var param = {
				pageSize : pageSize,
				cpage : cpage
			}
		} 


		var listcallback = function(res) {
			//$("#totcnt").val()는 jobFairBoothApplicationList.jsp에 있음

			$("#listBooth").empty().append(res);
			var cntBooth = $("#totcnt").val();
			var paging = getPaginationHtml(cpage, cntBooth, pageSize,
					pageBlockSize, 'fn_jobFairBoothMgtList');

			$("#boothPagination").empty().append(paging);

			$("#currentpage").val(cpage);
		}

		callAjax("/fair/jobFairBoothMgtList.do", "post", "text", "false",
				param, listcallback);
	}
	// 등록 / 수정 팝업 초기 데이터 설정 - detail에서 넘긴 object
	function fn_initPopup(object) {
		//#boothAppReg 페이지
		$("#boothNum").empty();
		var boothMax;
		if(object.boothDet.companyNum==2){
			boothMax=16;
		}else{
			boothMax=24;
		}

	 	for (var i = 1; i <= boothMax; i++) {
			$("#boothNum").append("<option value=A"+i+">A" + i + "</option>");
		} 

		//박람회 번호 id 고유번호
		$("#id").val(object.boothDet.id);
		$("#title").val(object.boothDet.title);
		$("#address1").val(object.boothDet.address1);
		$("#address2").val(object.boothDet.address2);
		$("#content").val(object.boothDet.content);
		$("#name").val(object.boothDet.name);
		$("#phone").val(object.boothDet.phone);
		$("#email").val(object.boothDet.email);
		$("#filecd").val(object.boothDet.fileCd);
		$("#boothNum").val(object.boothDet.boothNum);
		$("#location").val(object.boothDet.location);
		$("#companyNum").val(object.boothDet.companyNum);
		$("#isDelete").val(object.boothDet.isDelete);
		
		$("#companyNum").val(object.boothDet.companyNumCd);
		$("#companyNum").append("<option value='"+object.boothDet.companyNumCd+"'>"+object.boothDet.companyNum+"</option>");		
		$('select[id="companyNum"][value="object.boothDet.companyNumCd"]').prop(
				"selected", true); 

		//반려사유
		if (object.boothDet.isDelete == "2") {
		$('table.row tr[name="isReject"]').show();
			$("#rejectReson").val(object.boothDet.memo);
		} else if (object.boothDet.isDelete != "2") {
			$('table.row tr[name="isReject"]').hide();
		}

		//전시장 그림 출력	
		if ($("#companyNum").val() == 1) {
			$("#location_image").empty();
			$("#location_image").prop("src", "\\serverfile/img/1.jpg");
			$("#location_image").prop("style", "width: 500px; height: 230px;");
		} else if ($("#companyNum").val() == 2) {
			$("#location_image").empty();
			$("#location_image").prop("src", "\\serverfile/img/2.jpg");
			$("#location_image").prop("style", "width: 400px; height: 230px;");
		} else if ($("#companyNum").val() == 3) {
			$("#location_image").empty();
			$("#location_image").prop("src", "\\serverfile/img/3.jpg");
			$("#location_image").prop("style", "width: 400px; height: 400px;");
		} else if ($("#companyNum").val() == 0) {
			$("#location_image").empty();
			$("#location_image").removeAttr("src");
			$("#location_image").removeAttr("style");
		}
		//부스 셀렉트

		//// 저장된 파일 미리보기
		var file_name = object.boothDet.file_name;
		var filearr = [];
		var previewhtml = "";

		if (file_name == "" || file_name == null || file_name == undefined) {
			previewhtml = "";
		} else {

			filearr = file_name.split(".");

			if (filearr[1] == "jpg" || filearr[1] == "png") {
				previewhtml = "<img src='" + object.boothDet.file_nadd + "' style='width: 200px; height: 130px;' />";
			} else {
				previewhtml = object.boothDet.file_name;
			}
		}

		$("#fileview").empty().append(previewhtml);

	}
	//디테일페이지 열기만 함
	function fn_openDetail(fair_no) {
		var param = {
			//박람회 고유번호 id
			id : fair_no
		}
		var detailcallback = function(res) {
			$("#rejectReson").val("");
			fn_initPopup(res);
			gfModalPop("#boothAppReg");
		}

		callAjax("/fair/jobFairBoothMgtDetail.do", "post", "json", "false",
				param, detailcallback);
	}

	function fn_cancelBooth(join_id) {
		var param = {
			jid : join_id
		}
		var justcallback = function() {
		}
		callAjax("/fair/jobFairBoothMgtCancel.do", "post", "json", "false",
				param, justcallback);

		fn_jobFairBoothMgtList($("#currentpage").val());
	}
</script>
<body>
	<form id="myForm" action="" method="">
	<input type="hidden" name="clickBtn" id="clickBtn" value="">
		<input type="hidden" name="isDelete" id="isDelete" value=""> <input
			type="hidden" name="loginId" id="loginId" value="${loginId}">
		<input type="hidden" name="userNm" id="userNm" value="${userNm}">
		<!-- 취업박람회 번호 -->
		<input type="hidden" name="id" id="id" value=""> <input
			type="hidden" name="currentpage" id="currentpage" value=""> <input
			type="hidden" name="filecd" id="filecd" value="">

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
								<span class="btn_nav bold">취업박람회</span> <span
									class="btn_nav bold">취업박람회 부스관리</span> <a
									href="../fair/jobFairBoothApplication.do"
									class="btn_set refresh">새로고침</a>
							</p>
							<p class="conTitle">
								<span class="btn_nav bold">부스관리 목록 </span>
							</p>
							<!-- 검색기능 - 컨트롤러 서비스등 구현x -->
							<p>
								<span class="fr"> 박람회명 <input type="text" id="srctitle"
									name="srctitle" />지역
									<select id="region">
									<option value="">지역을 선택해주세요</option>
										<c:forEach items="${regiSel}" var="list">
											<option value="${list.locationCd}">${list.location}</option>
										</c:forEach>
								</select><a class="btnType blue" href="" id="btnClick" name="btn"><span>검색</span></a>
								</span>
							</p>
							<div class="divComGrpCodList">
								<table class="col">
									<caption>caption</caption>
									<colgroup>
										<col width="20%">
										<col width="5%">
										<col width="5%">
										<col width="10%">
										<col width="3%">
										<col width="8%">
										<col width="5%">
										<col width="5%">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">박람회명</th>
											<th scope="col">시작일</th>
											<th scope="col">종료일</th>
											<th scope="col">지역</th>
											<th scope="col">담당자</th>
											<th scope="col">담당자 전화번호</th>
											<th scope="col">신청취소</th>
											<th scope="col">승인반려</th>
										</tr>
									</thead>
									<tbody id="listBooth"></tbody>
								</table>
							</div>

							<div class="paging_area" id="boothPagination"></div>

						</div> <!--// content -->

						<h3 class="hidden">풋터 영역</h3> <jsp:include
							page="/WEB-INF/view/common/footer.jsp"></jsp:include>
					</li>
				</ul>
			</div>
		</div>
		<div id="boothAppReg" class="layerPop layerType2"
			style="width: 600px;">
			<dl>
				<dt>
					<strong>박람회 상세보기</strong>
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
								<td colspan="4">박람회 정보</td>
							</tr>
							<tr>
								<th scope="row">박람회명<span class="font_red">*</span></th>
								<td colspan="3"><input type="text" class="inputTxt p100"
									name="title" id="title" readonly /></td>

							</tr>
							<tr>
								<th scope="row">주소 <span class="font_red">*</span></th>
								<td><input type="text" class="inputTxt p100"
									name="address1" id="address1" readonly /></td>
								<th scope="row">상세주소 <span class="font_red">*</span></th>
								<td><input type="text" class="inputTxt p100"
									name="address2" id="address2" readonly /></td>
							</tr>
							<tr>
								<th scope="row">박람회 내용<span class="font_red">*</span></th>
								<td colspan="3"><input type="text" class="inputTxt p100"
									name="content" id="content" readonly /></td>
							</tr>
							<tr>
								<td colspan="4">박람회 담당자 정보</td>
							</tr>
							<tr>
								<th scope="row">담당자 이름 <span class="font_red">*</span></th>
								<td><input type="text" class="inputTxt p100" name="name"
									id="name" readonly /></td>
								<th scope="row">연락처 <span class="font_red">*</span></th>
								<td><input type="text" class="inputTxt p100" name="phone"
									id="phone" readonly /></td>
							</tr>
							<tr>
								<th scope="row">email <span class="font_red">*</span></th>
								<td colspan="3"><input type="text" class="inputTxt p100"
									name="email" id="email" readonly /></td>
							</tr>
							<tr>
								<td colspan="4">박람회 포스터 이미지</td>
							</tr>
							<tr>
								<td colspan="4"><div id="fileview"></div></td>
							</tr>
							<tr>
								<th scope="row">전시장 <span class="font_red">*</span></th>
								<td><select name="companyNum" id="companyNum"
									disabled="disabled">
								</select></td>
								<th scope="row">부스선택 <span class="font_red">*</span></th>
								<td><select id="boothNum" disabled="disabled">
										<option value='0'>부스번호를 선택해주세요</option>
								</select></td>
							</tr>
							<tr>
								<td colspan="4">박람회 부스 이미지</td>
							</tr>
							<tr>
								<td colspan="4"><img id="location_image"></td>
							</tr>
							<tr name="isReject">
								<td colspan="4">반려사유</td>
							</tr>
							<tr name="isReject">
								<td colspan="4"><textarea id="rejectReson"
										readonly="readonly" disabled="disabled"></textarea></td>
							</tr>
						</tbody>
					</table>


					<!-- e : 여기에 내용입력 -->

					<div class="btn_areaC mt30">
						<a href="" class="btnType gray" id="btnClosefile" name="btn"><span>닫기</span></a>
					</div>
				</dd>
			</dl>
		
		</div>
	</form>
</body>
</html>