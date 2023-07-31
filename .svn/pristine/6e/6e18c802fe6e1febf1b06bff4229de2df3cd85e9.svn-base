<%@ page language="java" import="java.time.LocalDate"
	contentType="text/html;
charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:forEach items="${likeList}" var="like">

	<tr class="likeListTr">
		<td><input class="deleteCheckbox" type="checkbox" data-adno= "${like.adNo}"></td>
		<td><input type="hidden" class="adNo" id="adNo" name="adNo"	value="${like.adNo}"> ${like.companyName}</td>
		<td class="adTitle"><p>
				<a href="javascript:popupAdDetail(${like.adNo})">${like.title}</a>
			</p>
			</td>
		<td>${like.experience}</td>
		<td>${like.position}</td>
		<td>${like.salary}</td>
		<c:choose>
			<c:when test="${like.daysLeft == 0 }">
				<td>오늘 마감!</td>
			</c:when>
			<c:when test="${like.daysLeft < 0 }">
				<td>마감</td>
			</c:when>
			<c:otherwise>
				<td>${like.dueDate}(D-${like.daysLeft})</td>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${!like.applied}">
				<td><button type="button" class="btn blue resumeListButton">지원하기</button></td>
			</c:when>
			<c:otherwise>
				<td></td>
			</c:otherwise>
		</c:choose>

	</tr>

</c:forEach>

<input type="hidden" id="totcnt" name="totcnt" value="${likeTotalCount}" />
<input type="hidden" id="queryExcludesApplied" name="queryExcludesApplied" value="${query.excludesApplied}" />
<input type="hidden" id="queryExcludesExpired" name="queryExcludesExpired" value="${query.excludesExpired}" />
<input type="hidden" id="queryKeyword" name="queryKeyword" value="${query.keyword}" />