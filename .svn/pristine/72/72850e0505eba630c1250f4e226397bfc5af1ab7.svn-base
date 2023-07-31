<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:if test="${countcommunitylist == 0}">
<tr><td colspan = "5">데이터가 없습니다.</td></tr>
</c:if>
<c:if test="${countcommunitylist > 0}">
<c:forEach items="${communitylist}" var="list">
	<c:if test="${list.is_delete eq 2}">
		<tr>
			<td>${list.board_no}</td>
			<td><a href="javascript:openDetail('${list.board_no}')">${list.board_title}</a></td>
			<td>${list.writer}</td>
			<td>${list.reg_date}</td>
			<td>${list.board_count}</td>
		</tr>
	</c:if>
</c:forEach>
</c:if>

<input type="hidden" id="totcnt" name="totcnt" value="${countcommunitylist}"/>


