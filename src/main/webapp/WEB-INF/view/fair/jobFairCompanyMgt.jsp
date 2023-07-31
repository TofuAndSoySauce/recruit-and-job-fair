<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>참여신청 기업관리</title>
<!-- sweet alert import -->
<script src='${CTX_PATH}/js/sweetalert/sweetalert.min.js'></script>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<!-- sweet swal import -->
  <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
  />
<script type="text/javascript">
	// 페이징 설정
	var pageSize = 10;
	var pageBlockSize = 5;
	
	$(function() {
		fairList();
		
	});
	
	
	/* function checkBoothStatus(fair_no,booth){
		// 박람회번호, 부스번호
		var param = {
				fair_no : fair_no,
				booth : booth
		}
		
		var listcallback(res){
			
		}
		
		callAjax("/fair/checkBoothStatus.do", "post", "json", "false", param,
				listcallback);
	} */
	
	
	// 승인/반려 버튼 클릭
	function buttonClickEvent(fair_no, loginID, type, cpage, booth) {
		var reason='';
		
		// 클릭한 박람회의 신청한 부스번호가 다른 기업도 신청을 했는지
		//checkBoothStatus(fair_no,booth);
		
		if(type == 'A')
		{
			
			//승인로직
			alert("승인되었습니다.");
			var param ={
					type : type,
					fair_no : fair_no,
					loginID1 : loginID,
					cpage : cpage
			}
			
			function listcallback(res){
				// 승인,반려 업데이트 후 처리
				searchFairList(cpage);
			}
				
			callAjax("/fair/fairSwal.do", "post", "json", "false", param,
					listcallback);
			
		}
		else if(type == 'N')
		{
			//반려로직
			swal({
				title: "반려사유입력",
				text: "반려 사유를 입력하세요.",
				content: "input",
				button: {
					text: "반려",
					closeModal: true,
				},
			})
			.then(function(value){
				if(value != null || value != ""){		
				
					var param = {
							type : type,
							fair_no : fair_no,
							reason : value,
							loginID1 : loginID,
							cpage : cpage
					}
				
					function listcallback(res){
					// 승인,반려 업데이트 후 처리
						searchFairList(cpage);
						//모범답안
						//searchFairList($("#cpage").val());
					}
					
					callAjax("/fair/fairSwal.do", "post", "json", "false", param,
							listcallback);
				}
			});
		}
	}
		
	
	// 리스트 검색 및 조회
	function searchFairList(cpage){
		cpage = cpage || 1;
		$("#cpage").val(cpage);
		
		
		var param = {
				option : $("#orderby").val(),
				companysearch : $("#companysearch").val(),
				pageSize : pageSize,
				cpage : cpage
		}
		
		
		
		var listcallback = function(res) {
			console.log(res);
			$("#listFair").empty().append(res);
			
			var countfairlist = $("#totcnt").val();
			var paging = getPaginationHtml(cpage, countfairlist, pageSize, pageBlockSize, 'searchFairList');
		
			$("#fairlistPagination").empty().append(paging);
			
			
		
		}
		
		callAjax("/fair/fairList.do", "post", "text", "false", param,
				listcallback);
	}
	
	// 리스트 
	function fairList(cpage){
		var cpage = cpage || 1;
		$("#cpage").val(cpage);
		
		
		var param = {
				option : $("#orderby").val(),
				pageSize : pageSize,
				cpage : cpage
		}
		
		
		var listcallback = function(res) {
			console.log(res);
			$("#listFair").empty().append(res);
			
			var countfairlist = $("#totcnt").val();
			var paging = getPaginationHtml(cpage, countfairlist, pageSize, pageBlockSize, 'fairList');
		
			$("#fairlistPagination").empty().append(paging);
			
			
		
		}
		
		callAjax("/fair/fairList.do", "post", "text", "false", param,
				listcallback);
	}
	
	
	
	
</script>
</head>
<body>

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
							<span class="btn_nav bold">취업박람회</span> 
							<span class="btn_nav bold">취업박람회 기업 관리 </span> 
							<a href="../fair/jobFairCompanyMgt.do" class="btn_set refresh">새로고침</a>
						</p>
						<p class="conTitle">
							<span class="btn_nav bold">참여신청 기업관리 </span>
						</p>
						<form id="" action="" method="">
						<input type="hidden" name="action" id="action" value=""> 
						<input type="hidden" name="loginId" id="loginId" value="${loginId}">
						<input type="hidden" name="userNm" id="userNm" value="${userNm}">
						<input type="hidden" id="cpage" name="cpage" value =""/>
						<br>
						
							<span class="fr"><input type="text" id="companysearch"
								name="companysearch" placeholder="기업명 검색"/>&nbsp;
								<select id="orderby" name="orderby">
									<option value="0" selected="selected">전체</option>
									<option value="1">신청일순</option>
									<option value="2">기업이름순</option>
									<option value="3">박람회이름순</option>
								</select>&nbsp;
								<a href="javascript:searchFairList();"><svg xmlns="http://www.w3.org/2000/svg" height="1.25em" viewBox="0 0 512 512"><!--! Font Awesome Free 6.4.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z"/></svg>
								</a>&nbsp;&nbsp;&nbsp;
							</span>
						<br><br>
						<div class="divComGrpCodList">
								<table class="col">
									<caption>caption</caption>
									<colgroup>
										<col width="12%">
										<col width="8%">
										<col width="12%">
										<col width="10%">
										<col width="20%">
										<col width="10%">
										<col width="10%">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">박람회명</th>
											<th scope="col">신청기업</th>
											<th scope="col">이메일</th>
											<th scope="col">신청일</th>
											<th scope="col">승인</th>
											<th scope="col">승인/반려일</th>
											<th scope="col">반려사유</th>
										</tr>
									</thead>
									<tbody id="listFair"></tbody>
								</table>
							</div>
						
						</form>
						<div class="paging_area" id="fairlistPagination"></div>

					</div> <!--// content -->

					<h3 class="hidden">풋터 영역</h3> <jsp:include
						page="/WEB-INF/view/common/footer.jsp"></jsp:include>

				</li>
			</ul>
		</div>
	</div>


</body>
</html>