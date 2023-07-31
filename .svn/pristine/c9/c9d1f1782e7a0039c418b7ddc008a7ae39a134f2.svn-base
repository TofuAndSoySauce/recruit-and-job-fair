<%@ page language="java" import="java.time.LocalDate"
	contentType="text/html;
charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:forEach items="${historyList}" var="history">
	<c:if test="${!history.deleted}">
		<tr class="historyListTr">
			<td>
        <input type="hidden" class="adNo" id="adNo" name="adNo" value="${history.adNo}">
        ${history.companyName}
      </td>
			<td class="historyTitle"><p>
					<a href="javascript:popupAdDetail(${history.adNo})">${history.title}</a>
				</p></td>
			<td>${history.hireType}</td>
			<td>${history.experience}</td>
			<td>${history.salary}</td>
			<td>${history.education}</td>
			<td>${history.location}</td>
			<td>${history.position}</td>
			<c:choose>
				<c:when test="${history.daysLeft == 0 }">
					<td>오늘 마감!</td>
				</c:when>
				<c:when test="${history.daysLeft < 0 }">
				<td>마감</td>
				</c:when>
				<c:otherwise>
					<td>${history.dueDate}(D-${history.daysLeft})</td>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${!history.applied}">
					<td><button type="button" class="btn blue resumeListButton">지원하기</button></td>
				</c:when>
				<c:otherwise>
					<td></td>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${!history.bookmarked}">
					<td><button class="bookmarkButton">즐겨찾기</button></td>
				</c:when>
				<c:otherwise>
					<td></td>
				</c:otherwise>
			</c:choose>

		</tr>

	</c:if>
</c:forEach>

<input type="hidden" id="totcnt" name="totcnt" value="${historyTotalCount}" />