<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 현재 일자 -->
<c:set var="today" value="<%=new java.util.Date()%>"/>
<fmt:formatDate var="now" type="date" value="${today}" pattern="yyyy-MM-dd"/>


<c:forEach var="adModel" items="${adList }">

	<tr>
		<td><a href="javascript:openDetail(${adModel.ad_no })">${adModel.ad_title }</a></td>
		<td>
			<c:if test="${adModel.ad_type == '1' }">정규직</c:if>
			<c:if test="${adModel.ad_type == '2' }">계약직</c:if>
			<c:if test="${adModel.ad_type == '3' }">인턴</c:if>
		</td>
		<td>
			<c:if test="${adModel.ad_salary == '1' }">3000 ~ 4000 만원</c:if>
			<c:if test="${adModel.ad_salary == '2' }">4000 ~ 5000 만원</c:if>
			<c:if test="${adModel.ad_salary == '3' }">5000만원 이상</c:if>
			<c:if test="${adModel.ad_salary == '4' }">6000만원 이상</c:if>
		</td>
		<td>
			<c:if test="${adModel.ad_experience == '1' }">신입</c:if>
			<c:if test="${adModel.ad_experience == '2' }">1~2년차</c:if>
			<c:if test="${adModel.ad_experience == '3' }">3~4년차</c:if>
			<c:if test="${adModel.ad_experience == '4' }">5년차 이상</c:if>
		</td>
		<td>${adModel.reg_date }</td>
		<td>${adModel.ad_date }</td>
		<td>
			<c:choose>
				<c:when test="${adModel.ad_yn == '1' }">대기중</c:when>
				<c:when test="${adModel.ad_yn == '2' }">반려</c:when>
				<c:when test="${adModel.ad_yn == '3' }">승인</c:when>
			</c:choose>
		</td>
	</tr>
	
</c:forEach>

<input type="hidden" id="totcnt" name="totcnt" value="${countAdList}"/>