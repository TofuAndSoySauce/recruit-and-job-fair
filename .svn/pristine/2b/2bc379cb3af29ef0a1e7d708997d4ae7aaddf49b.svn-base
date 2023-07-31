<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:if test="${countJobFairList eq 0}">

	<tr><td colspan='5'>해당 데이터가 없습니다.</td></tr>
	
</c:if>

<c:if test="${countJobFairList > 0 }">

<c:forEach items="${jobFairlist}" var="list">

	<c:if test="${list.is_delete eq 2}">
	
		<tr>
			
			<td>${list.fair_no}</td>
			<td><a href="javascript:fn_openJobFair(${list.fair_no})">${list.fair_title}</a></td>
			<td>${list.location}</td>
			<td>${list.fair_startdate}</td>
			<td>${list.fair_enddate}</td>
			
		</tr>
	
	</c:if>
	
	<input type="hidden" name="fair_title" id="fair_title" value="${list.fair_title}">
	<input type="hidden" name="id" id="id" value="${list.id}">
	<input type="hidden" name="exist_yn" id="exist_yn" value="${list.exist_yn}">
	
</c:forEach>

</c:if>

<!-- 페이지 네이션을 위한 데이터의 총 건수 -->
<input type="hidden" id="totcnt" name="totcnt" value="${countJobFairList}"/>