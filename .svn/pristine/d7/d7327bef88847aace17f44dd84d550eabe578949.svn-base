<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:if test="${cntBooth eq 0 }">
	<tr>
		<td colspan="7">데이터가 없습니다</td>
	<tr>
</c:if>
<c:if test="${cntBooth ne 0 }">
	<c:forEach items="${boothList}" var="list">

		<tr>
			<c:if test="${list.joined  eq 0}">
				<td><a href="javascript:openDetail(${list.id})">${list.title}</a></td>
			</c:if>
			<c:if test="${list.joined  eq 1}">
				<td><a href="javascript:alreadyJoined()">${list.title}</a></td>
			</c:if>
			<td>${list.startDate}</td>
			<td>${list.endDate}</td>
			<td>${list.location}</td>
			<td>${list.name}</td>
			<td>${list.phone}</td>
		</tr>
	</c:forEach>
</c:if>

<input type="hidden" id="totcnt" name="totcnt" value="${cntBooth}" />