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
				<td><a href="javascript:fn_openDetail(${list.id})">${list.title}</a></td>
				<td>${list.startDate}</td>
				<td>${list.endDate}</td>
				<td>${list.location}</td>
				<td>${list.name}</td>
				<td>${list.phone}</td>
				<td>
					<c:if test="${list.isDelete eq 1}">
						<a href="javascript:fn_cancelBooth(${list.jid})">신청취소</a>
					</c:if>
				</td>
				<td>${list.isDeleteName}</td>
			</tr>
	</c:forEach>
</c:if>

<input type="hidden" id="totcnt" name="totcnt" value="${cntBooth}"/>