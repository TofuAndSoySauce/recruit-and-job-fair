<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>통계관리</title>
<!-- sweet alert import -->
<script src='${CTX_PATH}/js/sweetalert/sweetalert.min.js'></script>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<!-- sweet swal import -->

<script type="text/javascript">

	var pageSize = 10;
	var pageBlockSize = 5;
 
	$(function() {
		google.charts.load('current', {'packages':['bar']});
		google.charts.setOnLoadCallback(drawChart);
	});

	function drawChart() {
	  var data = google.visualization.arrayToDataTable([
	    ['Year', 'Sales', 'Expenses', 'Profit'],
	    ['2014', 1000, 400, 200],
	    ['2015', 1170, 460, 250],
	    ['2016', 660, 1120, 300],
	    ['2017', 1030, 540, 350]
	  ]);

	  var options = {
	    chart: {
	      title: 'Company Performance',
	      subtitle: 'Sales, Expenses, and Profit: 2014-2017',
	      width: '100%'
	    }
	  };

	  var mq = window.matchMedia( "(max-width: 1024.98px)" );
	  if (mq.matches) {
	      var options = {
	        legend: {
	          position: 'none'
	        }
	      }   
	    }

	  var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

	  chart.draw(data, google.charts.Bar.convertOptions(options));
	}

	// 오늘 날짜 가져오는 함수
	function getToday() {
		var date = new Date();
		var year = date.getFullYear();
		var month = ("0" + (1 + date.getMonth())).slice(-2);
		var day = ("0" + date.getDate()).slice(-2);

		return year + "-" + month + "-" + day;
	}
</script>

</head>
<body>
	<form id="myForm" action="" method="">
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
								<span class="btn_nav bold">분석 통계</span> <span class="btn_nav bold">통계관리</span> <a href="../system/notice.do" class="btn_set refresh">새로고침</a>
							</p>
							<p class="conTitle">
								<span class="btn_nav bold">통계관리 </span>
							</p>

							<p>
								<span class="fr"> 제목 <input type="text" id="srctitle"
									name="srctitle" /> <input type="date" id="srcsdate"
									name="srcsdate" /> ~ <input type="date" id="srcedate"
									name="srcedate" /> <a class="btnType blue"
									href="" name="modal"><span>검색</span></a>
								</span>
							</p>
							<br><br>
							<p class="chart">
    							<div id="columnchart_material" style="width: 100%; height: 300px;"></div>
  							</p>
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
									<input multiple="multiple" type="file" class="btnType blue" name="addfile"
									id="addfile" />
								</td>
								<td colspan="2"><div id="fileview"></div></td>
							</tr>

						</tbody>
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

	</form>
</body>
</html>