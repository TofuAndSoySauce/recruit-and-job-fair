<%@ page language="java" import="java.time.LocalDate"
	contentType="text/html;
charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:forEach items="${resumeSubmitList}" var="submit">

	<tr class="resumeSubmitListTr">
		<td><input type="hidden" class="adNo" id="adNo" name="adNo"	value="${submit.adNo}"> ${submit.companyName}</td>
		<td class="adTitle"><p>
				<a href="javascript:popupAdDetail(${submit.adNo})">${submit.adTitle}</a>
			</p>
			</td>
		<td>${submit.experience}</td>
		<td>${submit.salary}</td>
		<c:choose>
			<c:when test="${submit.daysLeft == 0 }">
				<td>오늘 마감!</td>
			</c:when>
			<c:when test="${submit.daysLeft < 0 }">
				<td>마감</td>
			</c:when>
			<c:otherwise>
				<td>${submit.dueDate}(D-${submit.daysLeft})</td>
			</c:otherwise>
		</c:choose>
		<td><a href="javascript:popupResumeDetail(${submit.resumeNo})">${submit.resumeTitle }</a></td>
		<td>${submit.isRead }</td>
		<td>${submit.submitStatus }</td>
	</tr>

</c:forEach>

<input type="hidden" id="totcnt" name="totcnt" value="${resumeSubmitTotalCount}" />