<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:forEach var="resumeHistoryMap" items="${resumeHistoryList }">
	<tr>
		<td>${resumeHistoryMap.resume_title }</td>
		<td>${resumeHistoryMap.loginID }</td>
		<td>${resumeHistoryMap.reg_date }</td>
	</tr>
</c:forEach>

<input type="hidden" id="totcnt2" name="totcnt2" value="${countResumeHistoryList}"/>