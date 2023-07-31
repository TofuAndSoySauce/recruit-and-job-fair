<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>공지사항</title>
<!-- sweet alert import -->
<script src='${CTX_PATH}/js/sweetalert/sweetalert.min.js'></script>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://www.gstatic.com/charts/loader.js"></script>
<!-- sweet swal import -->

<!-- chart import -->
<script type="text/javascript"
	src="${CTX_PATH}/js/apexcharts/apexcharts.js"></script>
<!-- chart import css-->
<link rel="stylesheet" type="text/css"
	href="${CTX_PATH}/css/apexcharts/apexcharts.css">
<!-- font awesome css -->
<link rel="stylesheet" type="text/css"
	href="${CTX_PATH}/js/statistics/css/font-awesome.min.css">
<script type="text/javascript">
	// 페이징 설정
	// pageSize 10 -> 5
	var pageSize = 5;
	var pageBlockSize = 5;
	
	$(function() {
		//  통계관리 게시판 초기화 함수 콜
		searchstats_init();
	});
	
	// ======================================================
	// 박람회별 개인 성별 차트 (파이 차트, Pie Chart1)
	function statsPie1() {
		var param = {
			//fno2 : $("#fno2").val(),
			sex_fc : $("#sex_fc").val(),
			sex_fcnt : $("#sex_fcnt").val()
		}
		var callback = function(data3) { 
			$('#chart_div3').empty().append(data3);
		}
		callAjax("/statistics/statspie1.do", "post", "text", true, param,
				callback);
	}
	
	// 박람회별 기업 규모 차트 (파이 차트, Pie Chart2)
	function statsPie2() {
		var param = {
			//fno3 : $("#fno3").val(),
			c_size : $("#c_size").val(),
			c_cnt : $("#c_cnt").val()
		}
		var callback = function(data4) {
			$('#chart_div4').empty().append(data4);
		}
		callAjax("/statistics/statspie2.do", "post", "text", true, param,
				callback);
	}
		
	// ----------------------------------------------------------------------------------------	
	// 기업별 연령대 및 성별 차트 (막대 차트, Bar Chart)
	function statsBar() {
		var param = {
			//ent2 : $("#ent2").val(),	
			age_c : $("#age_c").val(),
			age_cnt : $("#age_cnt").val(),
		}
		var callback = function(data2) {
			// showChart(data);
			$('#chart_div2').empty().append(data2);
		}
		callAjax("/statistics/statsbar.do", "post", "text", true, param,
				callback);
	}
	
	// 전체 기업별 선호도 차트 (열 차트, Column Chart)
	function statsCol() {
		var param = {
			pct : $("#pct").val(),
			ent : $("#ent").val()
		}
		var callback = function(data) {
			//showChart(data);
			$('#chart_div').empty().append(data);
		}
		callAjax("/statistics/statscol.do", "post", "text", true, param,
				callback);
	}

	// --------------------------------------------------------------------------------------------
	// 통계관리 게시판 초기화 함수
	function searchstats_init(cpage, cpage2) {
		// 기본 탭 : 기업 show, 박람회 hide
		$("#statslist2").hide();
		$("#statslist").show();
		
		// 칼럼, 막대 차트 콜
		statsCol();
		statsBar();
		// 초기화시 모두 표기하기로 결정.
		// 파이 차트 1,2 콜
		statsPie1();
		statsPie2();
		// === 버튼 클릭 이벤트 ===
		// = 기업별 통계 (게시판) 버튼 =
		$("#showStats1").click(function() {
			$("#showStats1").addClass('color2');
			$("#showStats1").removeClass('color1');
			$("#showStats2").addClass('color1');
			$("#showStats2").removeClass('color2');
			// 기업별 통계 게시판 함수 콜
			searchstats(cpage);
		});
		// = 박람회별 통계 (게시판) 버튼 =
		$("#showStats2").click(function() {
			$("#showStats2").addClass('color2');
			$("#showStats2").removeClass('color1');
			$("#showStats1").addClass('color1');
			$("#showStats1").removeClass('color2');
			// 박람회별 통계 게시판 함수 콜
			searchstats2(cpage2);
		});
		// 게시판 전환 버튼 클릭 안 했을 때 기본적으로 출력하는 게시판(기업별 통계)
		cpage = cpage || 1;
		var param = {
			nm_search : $("#nm_search").val(),
			pageSize : pageSize,
			cpage : cpage
		}
		var listcallback = function(res) {
			$("#liststats").empty().append(res);
			var countstatslist = $("#totcnt").val();
			// console.log('countstatslist' + countstatslist); // 16
			var paging = getPaginationHtml(cpage, countstatslist, pageSize,
					pageBlockSize, 'searchstats');
			$("#statsPagination").empty().append(paging);
			$("#currentpage").val(cpage);
			
		}
		callAjax("/statistics/statslist.do", "post", "text", "false", param,
				listcallback);
	}

	function buttonClickEvent() {
		$("a[name=btn]").click(function(e) {
			e.preventDefault();
			var btnId = $(this).attr("id");
			switch (btnId) {
			case "btnSavefile":
				savefile();
				break;
			case "btnDeletefile":
				$("#action").val("D");
				savefile();
				break;
			case "btnClosefile":
				searchstats();
				gfCloseModal();
				break;
			}
		});
	}
	
	// 클릭시 막대 차트 그리는 함수
	function openStatsBar(loginID_input2){
		var param = {
				loginID_input : loginID_input2
			}
		var detailcallback = function(res){
			console.log(res)
			// 밑, 그래프 그리는데 중요
			$('#chart_div2').empty().append(res);
		}
		callAjax("/statistics/statsbar2.do", "post", "text", "false", param, detailcallback);
	}
	
	// 클릭시 파이 차트 1,2 그리는 함수
	 function openStatsPie(fno_input2){
		var param = {
				fno_input : fno_input2
			}
		var detailcallback = function(res){
			console.log(res)
			$('#chart_div3').empty().append(res);
			var detailcallback2 = function(res2){
				console.log(res2)
				$('#chart_div4').empty().append(res2);
			}
			callAjax("/statistics/statspie2_2.do", "post", "text", "false", param, detailcallback2);
		}
		callAjax("/statistics/statspie1_2.do", "post", "text", "false", param, detailcallback);
	}
	
	// ===============================================================
	// 기업별 통계 게시판 함수
	function searchstats(cpage) {
		$("#statslist2").hide();
		$("#statslist").show();
		// 칼럼 차트, 막대 차트 불러오기
		statsCol();
		statsBar();
			// === 버튼 클릭 이벤트 ===
			// = 기업별 통계 (게시판) 버튼 =
			$("#showStats1").click(function() {
				$("#showStats1").addClass('color2');
				$("#showStats1").removeClass('color1');
				$("#showStats2").addClass('color1');
				$("#showStats2").removeClass('color2');
				// 기업별 통계 게시판 함수 콜
				searchstats(cpage);
			});
			// = 박람회별 통계 (게시판) 버튼 =
			$("#showStats2").click(function() {
				$("#showStats2").addClass('color2');
				$("#showStats2").removeClass('color1');
				$("#showStats1").addClass('color1');
				$("#showStats1").removeClass('color2');
				// 박람회별 통계 게시판 함수 콜
				searchstats2(cpage2);
			});
		
		cpage = cpage || 1;
		var param = {
			nm_search : $("#nm_search").val(),
			pageSize : pageSize,
			cpage : cpage
		}
		var listcallback = function(res) {
			$("#liststats").empty().append(res);
			var countstatslist = $("#totcnt").val();
			//console.log(countstatslist);
			var paging = getPaginationHtml(cpage, countstatslist, pageSize,
					pageBlockSize, 'searchstats');
			$("#statsPagination").empty().append(paging);
			$("#currentpage").val(cpage);
			// 검색어 초기화
			//$("#nm_search").val('');
		}
		callAjax("/statistics/statslist.do", "post", "text", "false", param,
				listcallback);
	}
	// =========================================================================
	// 박람회별 통계 게시판 함수
	function searchstats2(cpage2) {
		// 기업 버튼 hide, 박람회 버튼 show
		$("#statslist").hide();
		$("#statslist2").show();
		// 파이 차트 1,2 불러오기
		statsPie1();
		statsPie2();
		// === 버튼 클릭 이벤트 ===
			// = 기업별 통계 (게시판) 버튼 =
			$("#showStats1").click(function() {
				$("#showStats1").addClass('color2');
				$("#showStats1").removeClass('color1');
				$("#showStats2").addClass('color1');
				$("#showStats2").removeClass('color2');
				// 기업별 통계 게시판 함수 콜
				searchstats(cpage);
			});
			// = 박람회별 통계 (게시판) 버튼 =
			$("#showStats2").click(function() {
				$("#showStats2").addClass('color2');
				$("#showStats2").removeClass('color1');
				$("#showStats1").addClass('color1');
				$("#showStats1").removeClass('color2');
				// 박람회별 통계 게시판 함수 콜
				searchstats2(cpage2);
			});
		cpage2 = cpage2 || 1;
		var param2 = {
			nm_search2 : $("#nm_search2").val(),
			pageSize : pageSize,
			cpage2 : cpage2,
		}
		var listcallback2 = function(res2) {
			$("#liststats2").empty().append(res2);
			var countstatslist2 = $("#totcnt2").val();
			//console.log(countstatslist2);
			var paging2 = getPaginationHtml(cpage2, countstatslist2, pageSize,
					pageBlockSize, 'searchstats2');
			$("#statsPagination").empty().append(paging2);
			$("#currentpage").val(cpage2);
			// 검색어 초기화
			//$("#nm_search2").val('');
		}
		callAjax("/statistics/statslist2.do", "post", "text", "false", param2,
				listcallback2);
	}
	// ==================================================================================

	// 공지사항 팝업 오픈
	function openPop() {
		initpopup();
		gfModalPop("#noticeregfile");
	}
	// ================================

	// 등록 / 수정 팝업 초기 데이터 설정
	function initpopup(object) {

		// 저장 버튼을 눌렀을때 팝업에 데이터가 없게 한다.
		if (object == "" || object == null || object == undefined) {

			$("#btnDeletefile").hide();
			$("#writerfile").val($("#userNm").val());
			$("#notice_datefile").val(getToday());

			$("#notice_titlefile").val("");
			$("#notice_detfile").val("");
			$("#addfile").val("");
			$("#fileview").empty();
			$("#action").val("I");
		} else {
			var param = {
				notice_no : object.detail.notice_no
			}

			$("#btnDeletefile").show();
			$("#notice_titlefile").val(object.detail.notice_title);
			$("#notice_datefile").val(object.detail.reg_date);
			$("#writerfile").val(object.detail.writer);
			$("#notice_detfile").val(object.detail.notice_content);
			$("#noticeno").val(object.detail.notice_no);
			$("#filecd").val(object.detail.file_cd);
			$("#addfile").val("");
			$("#action").val("U");

			// 저장된 파일 미리보기
			var file_name = object.detail.file_name;
			var filearr = [];
			var previewhtml = "";

			if (file_name == "" || file_name == null || file_name == undefined) {
				previewhtml = "";
			} else {

				filearr = file_name.split(".");

				if (filearr[1] == "jpg" || filearr[1] == "png") {
					previewhtml = "<a href='javascript:fn_downaload()'>   <img src='" + object.detail.file_nadd + "' style='width: 200px; height: 130px;' />  </a>";
				} else {
					previewhtml = "<a href='javascript:fn_downaload()'>"
							+ object.detail.file_name + "</a>";
				}
			}

			$("#fileview").empty().append(previewhtml);

			var justcallback = function(res) {
			}

			callAjax("/statistics/pluswatch.do", "post", "json", "false",
					param, justcallback);

		}

	}

	

	// 공지사항 등록/수정/삭제
	/* function savefile(){
		var frm = document.getElementById("myForm");
		frm.enctype = "multipart/form-data";
		var param = new FormData(frm);
		
		var savecallback = function(res){
			if(res.result == "SUCCESS"){
				alert("저장되었습니다.");
				gfCloseModal();
				searchstats();
			}
		}
		
		callAjaxFileUploadSetFormData("/statistics/noticesavefile.do", "post", "json", true, param, savecallback);
	}*/
	
</script>

</head>
<body>
	<form id="myForm" action="" method="">
		<input type="hidden" name="action" id="action" value=""> <input
			type="hidden" name="loginId" id="loginId" value="${loginId}">
		<input type="hidden" name="userNm" id="userNm" value="${userNm}">
		<input type="hidden" name="loginID_input" id="loginID_input" value="">
		<input type="hidden" name="login" id="noticeno" value="">
		<input	type="hidden" name="currentpage" id="currentpage" value=""> <input
			type="hidden" name="currentpage2" id="currentpage2" value="">
		<input type="hidden" name="filecd" id="filecd" value="">
		<!-- <input type="hidden" id="cpage" value="1"> -->
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
								<span class="btn_nav bold">분석 통계</span> <span
									class="btn_nav bold">통계관리</span> <a href="../system/notice.do"
									class="btn_set refresh">새로고침</a>
							</p>
							<p class="conTitle">
								<span class="btn_nav bold">통계관리 </span>
							</p>

							<!-- ===========================================  -->
									
									<p><span style="font-size: 1.2em; font-weight: bold">&nbsp;&nbsp;차트 영역</font>
									<!-- 차트영역 -->
									<!-- chart_div : 기업별 선호도, chart_div2 : 기업별 연령대 및 성별, chart_div3 : 박람회별 성별, chart_div4 : 박람회별 기업 규모 -->
									<!-- <div id="chart_div3" class="parent" style="position: relative; z-index: 2; width: 500px; height: 425px; display: inline-block;">
										<div id="chart_div" class="child" style="position: relative; z-index: 1; width: 500px; height: 300px; display: inline-block;"></div>
									</div>
									<div id="chart_div4" class="parent" style="position: relative; z-index: 2; width: 500px; height: 425px; display: inline-block;">
										<div id="chart_div2" class="child" style="position: relative;  z-index: 1; width: 500px; height: 300px; display: inline-block;"></div>		
									</div> -->
									<div class="chart_div1_2" align=center">
										<table>
											<tr>
												<td>
													<div id="chart_div"  align="left" style="position: relative"></div>
												</td>
												<td>
													<div id="chart_div2" align="right" style="position: relative"></div>
												</td>
											</tr>
											</table>
									</div>
									<div class="chart_div3_4" align="center">
										<table>
											<tr>
												<td>
													<div id="chart_div3" align="left" style="position: relative"></div>
												</td>
												<td>
													<div id="chart_div4" align="right" style="position: relative"></div>
												</td>
											</tr>
										</table>
									</div>
									
									</p>
									
									
									
									
									
							<!-- <div id="chart_div" style="width: 500px; height: 300px; display: inline-block;"></div>
									<div id="chart_div3" style="width: 500px; height: 300px; display: inline-block;"></div> -->
									
							<!-- style="width: 600px; height: 300px;" -->
							<!--  ===========================================  -->
							<!-- <p>
								차트영역2
							<div id="chart_div3" style="width: 500px; height: 300px; display: inline-block;"></div>
							<div id="chart_div4" style="width: 500px; height: 300px; display: inline-block;"></div>
							</p> -->
							
							<!--  ===========================================  -->
							<!--  ===========================================  -->
							<p><span style="font-size: 1.2em; font-weight: bold">&nbsp;&nbsp;테이블 영역</font></span></p>
							<p>
								<span class="fl"> 
								<a id="showStats1" class="btnType3 color2 btnStyle" href="javascript:searchstats()">
								<span>기업별 통계</span>
								</a> 
								<a id="showStats2" class="btnType3 color1 btnStyle" href="javascript:searchstats2()">
								<span>박람회별 통계</span>
								</a>
								</span>
								<!-- 원래 검색 버튼 있던 곳 -->
							</p>

							<!-- column chart area ended -->
							<!-- ============================================= -->
							<div class="divComGrpCodList" id="statslist2">
								<span class="fr">
								 <input type="text"
									Placeholder="박람회명 검색" id="nm_search2" name="nm_search2" />
									<a class="btnType blue" href="javascript:searchstats2();"
									name="modal"><span>검색</span>
									</a>
								</span>
								<table class="col">
									<caption>caption</caption>
									<colgroup>
										<col width="10%">
										<col width="15%">
										<col width="10%">
										<col width="15%">
										<col width="15%">
										<col width="10%">
										<col width="10%">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">번호</th>
											<th scope="col">박람회명</th>
											<th scope="col">장소</th>
											<th scope="col">개최일자</th>
											<th scope="col">종료일자</th>
											<th scope="col">수용부스</th>
											<th scope="col">수용인원</th>
										</tr>
									</thead>
									<tbody id="liststats2"></tbody>
								</table>
							</div>
							<!-- ============================================= -->
							<div class="divComGrpCodList" id="statslist">
								<span class="fr">
								 <input type="text"
									Placeholder="기업명 검색" id="nm_search" name="nm_search" />
									<a class="btnType blue" href="javascript:searchstats();"
									name="modal"><span>검색</span>
									</a>
								</span>
								<table class="col">
									<caption>caption</caption>
									<colgroup>
										<col width="10%">
										<col width="10%">
										<col width="8%">
										<col width="8%">
										<col width="8%">
										<col width="12%">
										<col width="12%">
										<col width="12%">
										<col width="11%">
										<col width="8%">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">아이디</th>
											<th scope="col">기업명</th>
											<th scope="col">고용형태</th>
											<th scope="col">경력</th>
											<th scope="col">학력</th>
											<th scope="col">급여</th>
											<th scope="col">공고 작성일자</th>
											<th scope="col">공고 마감일자</th>
											<th scope="col">공고 진행여부</th>
											<th scope="col">탈퇴여부</th>
										</tr>
									</thead>
									<tbody id="liststats"></tbody>
								</table>
							</div>

							<div class="paging_area" id="statsPagination" id="statslist"></div>

						</div> <!--// content -->

						<h3 class="hidden">풋터 영역</h3> <jsp:include
							page="/WEB-INF/view/common/footer.jsp"></jsp:include>
					</li>
				</ul>
			</div>
		</div>

		<div id="noticeregfile" class="layerPop layerType2"
			style="width: 600px;">
			<dl>

				<!-- to be updated -->
				<!-- ================================================= -->
				<dt>
					<strong>공지사항 등록/수정</strong>
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
								<th scope="row">작성자 <span class="font_red">*</span></th>
								<td><input type="text" class="inputTxt p100"
									name="writerfile" id="writerfile" readonly /></td>
								<th scope="row">작성일자 <span class="font_red">*</span></th>
								<td><input type="text" class="inputTxt p100"
									name="notice_datefile" id="notice_datefile" readonly /></td>
							</tr>
							<tr>
								<th scope="row">제목 <span class="font_red">*</span></th>
								<td colspan="3"><input type="text" class="inputTxt p100"
									name="notice_titlefile" id="notice_titlefile" /></td>
							</tr>

							<tr>
								<th scope="row">내용 <span class="font_red">*</span></th>
								<td colspan="3"><textarea class="inputTxt p100"
										name="notice_detfile" id="notice_detfile"> </textarea></td>
							</tr>

							<tr>
								<th scope="row">파일 <span class="font_red">*</span></th>
								<td>
									<!-- input type="file" class="inputTxt p100" name="addfile" id="addfile"  onChange="fn_filechange(event)"  / -->
									<input multiple="multiple" type="file" class="btnType blue"
									name="addfile" id="addfile" />
								</td>
								<td colspan="2"><div id="fileview"></div></td>
							</tr>

						</tbody>
						<!-- ================================================= -->
					</table>
					<!-- e : 여기에 내용입력 -->
					<div class="btn_areaC mt30">
						<a href="" class="btnType blue" id="btnSavefile" name="btn"><span>저장</span></a>
						<a href="" class="btnType blue" id="btnDeletefile" name="btn"><span>삭제</span></a>
						<a href="" class="btnType gray" id="btnClosefile" name="btn"><span>닫기</span></a>
					</div>
				</dd>
			</dl>
			<a href="" class="closePop"><span class="hidden">닫기</span></a>
		</div>
		<!--  =============================================  -->
					<!-- e : 여기에 내용입력 -->
	</form>
</body>
</html>