<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>면접 제안</title>
<link rel="stylesheet" type="text/css" href="/css/ad/ad-detail.css" />
<link rel="stylesheet" type="text/css" href="/css/resume/proposalList.css" />

<link rel="stylesheet" type="text/css"
	href="/css/resume/resume-list.css" />
<!-- sweet alert import -->
<script src="${CTX_PATH}/js/sweetalert/sweetalert.min.js"></script>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<!-- sweet swal import -->
</head>
<body>
	<form id="myForm" action="" method="">
		<input type="hidden" name="action" id="action" value="" /> <input
			type="hidden" name="loginId" id="loginId" value="${loginId}" /> <input
			type="hidden" name="userNm" id="userNm" value="${userNm}" /> <input
			type="hidden" name="noticeno" id="noticeno" value="" /> <input
			type="hidden" name="currentpage" id="currentpage" value="" /> <input
			type="hidden" name="filecd" id="filecd" value="" />

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
							page="/WEB-INF/view/common/lnbMenu.jsp"></jsp:include>
						<!--// lnb 영역 -->
					</li>
					<li class="contents">
						<!-- contents -->
						<h3 class="hidden">contents 영역</h3> <!-- content -->
						<div class="content">
							<div id="resumeListModal">
								<div id="resumeListModalContainer">
									<ul id="resumeList"></ul>
									<div class="submitArea" style="text-align: center">
										<a class="btnType gray close"><span>닫기</span>
									</div>
								</div>
							</div>
							<p class="Location">
								<a href="../dashboard/dashboard.do" class="btn_set home">메인으로</a>
								<span class="btn_nav bold">마이페이지</span> <span
									class="btn_nav bold">면접제안관리</span> <a
									href="../system/notice.do" class="btn_set refresh">새로고침</a>
							</p>
							<p class="conTitle">
								<span class="btn_nav bold">면접 제안</span>
							</p>
							<div class="divComGrpCodList">
								<table class="col">
									<caption>caption</caption>
									<thead>
										<tr>
											<th scope="col">기업명</th>
											<th scope="col">경력</th>
											<th scope="col">직무</th>
											<th scope="col">내이력서</th>
											<th scope="col">제안메시지</th>
											<th scope="col">답변</th>
										</tr>
									</thead>
									<tbody id="listNotice"></tbody>
								</table>
							</div>

							<div class="paging_area" id="noticePagination"></div>
						</div> <!--// content -->

						<h3 class="hidden">풋터 영역</h3> <jsp:include
							page="/WEB-INF/view/common/footer.jsp"></jsp:include>
					</li>
				</ul>
			</div>
		</div>

		<div id="companyDetailModal" class="layerPop layerType2"
			style="width: 750px; height: 800px; overflow: auto">
			<dl>
				<dt>
					<strong>기업정보</strong>
				</dt>
				<dd class="content">
					<table id="adDetailTable" class="row">
						<caption>caption</caption>
						<colgroup>
							<col width="250px" />
							<col width="250px" />
							<col width="250px" />
						</colgroup>
						<tbody>
							<!-- 기업정보 -->
							<tr>
								<th class="ad-info-header" colspan="3">기업정보</th>
							</tr>
							<tr>
								<td>
									<div id="fileview"></div>
								</td>
								<th scope="row">기업 사진</th>
								<td><img id="company_picture" src="" alt="default" /></td>
							</tr>
							<tr>
								<th scope="row">회사명</th>
								<td colspan="2">
									<p id="companyName"></p>
								</td>
							</tr>
							<tr>
								<th scope="row">담당자 연락처</th>
								<td colspan="2">
									<p id="user_phone"></p>
								</td>
							</tr>
							<tr>
								<th scope="row">설립일</th>
								<td colspan="2">
									<p id="user_birthday"></p>
								</td>
							</tr>
							<tr>
								<th scope="row">기업규모</th>
								<td colspan="2">
									<p name="user_company_size" id="user_company_size"></p>
								</td>
							</tr>
							<tr>
								<th scope="row">이메일</th>
								<td colspan="2">
									<p id="user_email"></p>
								</td>
							</tr>
							<tr>
								<th scope="row">업종</span></th>
								<td colspan="2">
									<p id="user_company_category"></p>
								</td>
							</tr>
							<tr>
								<th scope="row">주소</span></th>
								<td colspan="2">
									<p id="user_address"></p>
								</td>
							</tr>
						</tbody>
					</table>

					<div class="btn_areaC mt30" id="acceptBox"></div>
				</dd>
			</dl>
			<a href="" class="closePop"><span class="hidden">닫기</span></a>
		</div>

		<div id="resumeDetailModal" class="layerPop layerType2"
			style="width: 750px; height: 800px;">
			<dl>
				<dt>
					<strong>내 이력서</strong>
				</dt>
				<div style="width: 750px; height: 750px; overflow: auto">
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
								<tr>
									<th colspan="3" style="background-color: #fff; height: 75px">이력서
										제목</th>
								</tr>
								<tr>
									<th scope="row">이력서 제목</th>
									<td colspan="2">
										<p class="inputTxt p100" name="resume_title" id="resume_title"></p>
									</td>
								</tr>

								<tr>
									<th colspan="3" style="background-color: #fff; height: 75px">인적사항</th>
								</tr>
								<tr>
									<td>
										<div id="fileview"></div>
									</td>
									<th scope="row">이력서 사진</th>
									<td><img id="resume_picture" src="" alt="no image" />
									</td>
								</tr>
								<tr>
									<th scope="row">이름</th>
									<td colspan="2">
										<p class="inputTxt p100" name="name" id="name"></p>
									</td>
								</tr>
								<tr>
									<th scope="row">생년월일</th>
									<td colspan="2">
										<p class="inputTxt p100" name="birthday" id="birthday"></p>
									</td>
								</tr>
								<tr>
									<th scope="row">성별</th>
									<td colspan="2"><p class="inputTxt p100" name="sexuality"
											id="sexuality"></p></td>
								</tr>
								<tr>
									<th scope="row">휴대폰번호</th>
									<td colspan="2"><p class="inputTxt p100" name="phone"
											id="phone"></p></td>
								</tr>
								<tr>
									<th scope="row">이메일</th>
									<td colspan="2">
										<p class="inputTxt p100" name="email" id="email"></p>
									</td>
								</tr>
								<tr>
									<th scope="row">주소</th>
									<td colspan="2">
										<p class="inputTxt p100" name="address" id="address"></p>
									</td>
								</tr>

								<!-- 학력 -->
								<tr style="margin-top: 100px">
									<th colspan="3" style="background-color: #fff; height: 75px">학력</th>
								</tr>
								<tr>
									<th scope="row">학력</th>
									<td colspan="2">
										<p name="resume_education" id="resume_education"></p>
									</td>
								</tr>
								<tr>
									<th scope="row">학교명</th>
									<td colspan="2">
										<p class="inputTxt p100" name="resume_school"
											id="resume_school"></p>
									</td>
								</tr>
								<tr>
									<th scope="row">전공</th>
									<td colspan="2">
										<p name="resume_major" id="resume_major"></p>
									</td>
								</tr>

								<!-- 희망근무조건 -->
								<tr>
									<th colspan="3" style="background-color: #fff; height: 75px">희망근무조건</th>
								</tr>
								<tr>
									<th scope="row">희망 직무</th>
									<td colspan="2">
										<p name="resume_postion" id="resume_position"></p>
									</td>
								</tr>
								<tr>
									<th scope="row">희망 근무지</th>
									<td colspan="2">
										<p name="resume_location" id="resume_location"></p>
									</td>
								</tr>
								<tr>
									<th scope="row">고용 형태</th>
									<td colspan="2">
										<p name="resume_hireType" id="resume_hireType"></p>
									</td>
								</tr>
								<tr>
									<th scope="row">희망 연봉</th>
									<td colspan="2">
										<p name="resume_salary" id="resume_salary"></p>
									</td>
								</tr>
								<tr>
									<th scope="row">요구 경력</th>
									<td colspan="2">
										<p name="resume_experience" id="resume_experience"></p>
									</td>
								</tr>

								<!-- 자기소개서 -->
								<tr>
									<th colspan="3" style="background-color: #fff; height: 75px">자기소개서</th>
								</tr>
								<tr>
									<th scope="row">자기소개서</th>
									<td colspan="2"><p type="text" class="inputTxt p100"
											name="resume_letterTitle" id="resume_letterTitle"></p></td>
								</tr>
								<tr>
									<td colspan="3"><p id="resume_letterContent"
											name="resume_letterContent" rows="10" cols="500"></p></td>
								</tr>

								<!-- 이력서 공개여부 -->
								<tr>
									<th colspan="3" style="background-color: #fff; height: 75px">이력서
										공개여부</th>
								</tr>
								<tr>
									<th scope="row">이력서 공개 여부</th>
									<td colspan="2">
										<p id="resume_yn"></p>
									</td>
								</tr>
								<tr>
									<th scope="row">최종 수정일</th>
									<td colspan="2">
										<p id="update_date"></p>
									</td>

								</tr>

							</tbody>
						</table>

						<!-- e : 여기에 내용입력 -->

						<div class="btn_areaC mt30">
							<!-- TODO 수정페이지로 포워딩-->
							<a href="" class="btnType gray" id="btnClosefile" name="btn"><span>닫기</span></a>
						</div>
					</dd>

				</div>
			</dl>
			<a href="" class="closePop"><span class="hidden">닫기</span></a>
		</div>
	</form>
	<script src="/js/resume/resume-proposal-list.js"></script>
	<script src="/js/resume/resume-detail.js"></script>
	<script src="/js/resume/resume-list.js"></script>
	<script src="/js/like/like.js"></script>
</body>
</html>
