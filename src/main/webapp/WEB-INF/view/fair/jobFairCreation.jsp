<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>취업박람회 생성</title>
<!-- sweet alert import -->
<script src='${CTX_PATH}/js/sweetalert/sweetalert.min.js'></script>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<!-- sweet swal import -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	$(function() {
		
	});

	function changeLocation(value) {
		if (value == 1) {
			$("#location_image").empty();
			$("#location_image").prop("src", "\\serverfile/img/1.jpg");
			$("#location_image").prop("style", "width: 500px; height: 230px;");
		} else if (value == 2) {
			$("#location_image").empty();
			$("#location_image").prop("src", "\\serverfile/img/2.jpg");
			$("#location_image").prop("style", "width: 400px; height: 230px;");
		} else if (value == 3) {
			$("#location_image").empty();
			$("#location_image").prop("src", "\\serverfile/img/3.jpg");
			$("#location_image").prop("style", "width: 400px; height: 400px;");
		} else if (value == 0) {
			$("#location_image").empty();
			$("#location_image").removeAttr("src");
			$("#location_image").removeAttr("style");
		}

	}

	function execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var detAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						detAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						detAddr += (detAddr !== '' ? ', ' + data.buildingName
								: data.buildingName);
					}
				} else {
					document.getElementById("detAddr").value = '';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('zip_code').value = data.zonecode;
				document.getElementById("addr").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("detAddr").focus();
			}
		}).open();
	}

	//오늘 날짜
	function getToday() {
		var date = new Date();
		var year = date.getFullYear();
		var month = ("0" + (1 + date.getMonth())).slice(-2);
		var day = ("0" + date.getDate()).slice(-2);

		return year + "-" + month + "-" + day;
	}

	function validCheck() {
		var frm = document.frm;

		if (frm.fairname.value == "") {
			alert("박람회명을 입력해주세요.");
			return false;
		} else if (frm.zip_code.value == "") {
			alert("우편번호를 입력해주세요.");
			return false;
		} else if (frm.detAddr.value == "") {
			alert("상세주소를 입력해주세요.");
			return false;
		} else if (frm.startdate.value == "") {
			alert("시작일을 입력해주세요.");
			return false;
		} else if (frm.startdate.value < (getToday() + 1)) {
			alert("시작일을 오늘 날짜 이후로 입력해주세요.");
			return false;
		} else if (frm.enddate.value == "") {
			alert("종료일을 입력해주세요.");
			return false;
		} else if (frm.enddate.value < frm.startdate.value) {
			alert("종료일이 시작일보다 빠릅니다. 다시 입력해주세요.");
			return false;
		} else if (frm.userNum.value == "") {
			alert("수용인원을 입력해주세요.");
			return false;
		} else if (isNaN(frm.userNum.value)) {
			alert("수용인원을 숫자로 입력해주세요.");
			return false;
		} else if (frm.location.value == "") {
			alert("전시장을 입력해주세요.");
			return false;
		}

		insertFair();
	}

	function insertFair() {

		var frm = document.getElementById("frm");
		frm.enctype = "multipart/form-data";
		var param = new FormData(frm);
		

		var insertcallback = function(res) {
			if (res.result == "SUCCESS") {
				alert("등록되었습니다");
				$("#fairname").val("");
				$("#zip_code").val("");
				$("#addr").val("");
				$("#detAddr").val("");
				$("#addfile").val("");
				$("#startdate").val("");
				$("#enddate").val("");
				$("#userNum").val("");
				$("#location").val("0");
				$("#location_image").removeAttr("src");
				$("#location_image").removeAttr("style");

			}

		}

		callAjaxFileUploadSetFormData("/fair/creationList.do", "post", "json", true, param,
				insertcallback);
	}
</script>
</head>
<body>
	<form id="frm" name="frm">
		<input type="hidden" name="action" id="action" value=""> 
		<input type="hidden" name="loginId" id="loginId" value="${loginId}">
		<input type="hidden" name="userNm" id="userNm" value="${userNm}">

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
									class="btn_nav bold">박람회등록 </span> <a
									href="../fair/jobFairCreation.do" class="btn_set refresh">새로고침</a>
							</p>
							<p class="conTitle">
								<span class="btn_nav bold">박람회 등록 </span>
							</p>
							<br>
							<br>
							<h4>박람회 정보</h4>
							<br>
							<table class="row" style="margin-top: 0.5%;">
								<colgroup>
									<col width="12%">
									<col width="12%">
									<col width="12%">
									<col width="12%">
									<col width="12%">
									<col width="12%">
								</colgroup>

								<tbody>
									<tr>
										<th scope="row">박람회명</th>
										<td><input type="text" class="inputTxt p100"
											name="fairname" id="fairname" /></td>
									</tr>
									<tr>
										<th scope="row">주소</th>
										<td><input type="text" class="inputTxt"
											style="width: 50%;" name="zip_code" id="zip_code" readonly />
											<input type="button" value="우편번호 찾기"
											onclick="execDaumPostcode()" id="post_cd"
											style="width: 35%; height: 50%; cursor: pointer;" /> 
											<input type="text" class="inputTxt" style="width: 90%" name="addr"
											id="addr" readonly /> 
											<input type="text" class="inputTxt" style="width: 90%" name="detAddr" 
											id="detAddr">
											</td>
									</tr>
									<tr>
										<th scope="row">이미지첨부</th>
										<td><input multiple="multiple" type="file"
											class="btnType blue" name="addfile" id="addfile" /></td>
									</tr>
									<tr>
										<th scope="row">시작일자</th>
										<td><input type="date" class="datepicker"
											placeholder="0000-00-00" name="startdate" id="startdate" />
										</td>
										<th scope="row">종료일자</th>
										<td><input type="date" class="datepicker"
											placeholder="0000-00-00" name="enddate" id="enddate" /></td>
									</tr>
									<tr>
										<th scope="row">전체참여인원수</th>
										<td><input type="text" class="inputTxt p100"
											name="userNum" id="userNum" /></td>
									</tr>
									<tr>
										<th scope="row">전시장 선택</th>
										<td><select id="location" name="location"
											style="width: 65%;" onchange="changeLocation(this.value)">
												<option value="0" selected="selected">선택</option>
												<option value="1">전시장A</option>
												<option value="2">전시장B</option>
												<option value="3">전시장C</option>
										</select></td>
									</tr>
								</tbody>
							</table>
							<img id="location_image"> <br>
							<div class="btn_areaC mt30" id="updateBtnArea">
								<a href="javascript:void(0);" class="btnType blue"
									onclick="validCheck();"><span>등록하기</span></a>
							</div>

						</div> <!--// content -->

						<h3 class="hidden">풋터 영역</h3> <jsp:include
							page="/WEB-INF/view/common/footer.jsp"></jsp:include>
					</li>
				</ul>
			</div>
		</div>
	</form>
</body>
</html>