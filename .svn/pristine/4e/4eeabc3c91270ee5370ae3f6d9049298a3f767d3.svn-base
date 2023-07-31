<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>취업박람회 관리</title>
<!-- sweet alert import -->
<script src='${CTX_PATH}/js/sweetalert/sweetalert.min.js'></script>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<!-- sweet swal import -->
<script type="text/javascript">
	// 페이징 설정
	var pageSize = 10;
	var pageBlockSize = 5;
	$(function() {
		creationList();
		
	});
	
	function creationList(cpage){
		var cpage = cpage || 1;
		$("#cpage").val(cpage);
		
		
		var param = {
				pageSize : pageSize,
				cpage : cpage
		}
		
		
		var listcallback = function(res) {
			console.log(res);
			$("#creationFairList").empty().append(res);
			
			var countcreationlist = $("#totcnt").val();
			var paging = getPaginationHtml(cpage, countcreationlist, pageSize, pageBlockSize, 'creationList');
		
			$("#fairlistMgtPagination").empty().append(paging);
			
			
		
		}
		
		callAjax("/fair/jobFairList.do", "post", "text", "false", param,
				listcallback);
	}
	
	
</script>
</head>
<body>
	<form id="frm1" name="frm1">
		<input type="hidden" name="action" id="action" value=""> <input
			type="hidden" name="loginId" id="loginId" value="${loginId}">
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
									class="btn_nav bold">취업박람회 관리 </span> <a
									href="../fair/jobFairMgt.do" class="btn_set refresh">새로고침</a>
							</p>
							<p class="conTitle">
								<span class="btn_nav bold">취업박람회 관리 </span>
							</p>
							<br> <br>
							<h4>박람회 정보</h4>
							<br>
							<div class="divComGrpCodList">
								<table class="col">
									<caption>caption</caption>
									<colgroup>
										<col width="12%">
										<col width="8%">
										<col width="8%">
										<col width="5%">
										<col width="20%">
										<col width="8%">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">박람회명</th>
											<th scope="col">시작일자</th>
											<th scope="col">종료일자</th>
											<th scope="col">전시장</th>
											<th scope="col">지역</th>
											<th scope="col">박람회 진행상태</th>
										</tr>
									</thead>
									<tbody id="creationFairList">
									</tbody>
								</table>
							</div>
							
						</form>
						<div class="paging_area" id="fairlistMgtPagination"></div>
					
						</div> <!--// content -->

						<h3 class="hidden">풋터 영역</h3>
						<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>

					</li>
				</ul>
			</div>
		</div>
		
</body>
</html>