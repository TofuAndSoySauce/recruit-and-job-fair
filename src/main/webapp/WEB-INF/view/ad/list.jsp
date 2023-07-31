<%@ page language="java" import="java.time.LocalDate"
	contentType="text/html;
charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:forEach items="${adList}" var="ad">
	<c:if test="${!ad.deleted}">
		<tr class="adListTr">
			<td>
        <input type="hidden" class="adNo" id="adNo" name="adNo" value="${ad.no}">
        ${ad.companyName}
      </td>
			<td class="adTitle"><p>
					<a href="javascript:popupAdDetail(${ad.no})">${ad.title}</a>
				</p></td>
			<td>${ad.hireType}</td>
			<td>${ad.experience}</td>
			<td>${ad.salary}</td>
			<td>${ad.education}</td>
			<td>${ad.location}</td>
			<td>${ad.position}</td>
			<c:choose>
				<c:when test="${ad.daysLeft == 0 }">
					<td>오늘 마감!</td>
				</c:when>
				<c:otherwise>
					<td>${ad.dueDate}(D-${ad.daysLeft})</td>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${!ad.applied}">
					<td><button type="button" class="btn blue resumeListButton">지원하기</button></td>
				</c:when>
				<c:otherwise>
					<td></td>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${!ad.bookmarked}">
					<td><button class="bookmarkButton">즐겨찾기</button></td>
				</c:when>
				<c:otherwise>
					<td></td>
				</c:otherwise>
			</c:choose>

		</tr>

	</c:if>
	
</c:forEach>

<input type="hidden" id="totcnt" name="totcnt" value="${adTotalCount}" />
<input type="hidden" name="queryHireType" id="queryHireType" value="${query.hireType}" />
<input type="hidden" name="queryLocation" id="queryLocation" value="${query.location}" />
<input type="hidden" name="queryEducation" id="queryEducation" value="${query.education}" />
<input type="hidden" name="queryKeyword" id="queryKeyword" value="${query.keyword}" />    		