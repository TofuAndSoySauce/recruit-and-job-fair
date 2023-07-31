<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:if test="${countmemberlist eq 0}">
	<tr>
		<td colspan="7">데이터가 존재하지 않습니다.</td>
	</tr>
<input type="hidden" id="totcnt" name="totcnt" value="${countmemberlist}"/>
</c:if>
<!-- ----------------------------------------------------------------------------------------------- -->
<c:if test="${countmemberlist > 0}">
<c:forEach items="${prsnllist}" var="list">
		<tr>
			<td>${list.loginID}</td>
			<td><a href="javascript:openDetail(${list.loginID})">${list.name}</a></td>
			<td>${list.age}</td>
			<td>${list.sex}</td>
			<td>${list.position}</td>
			<td>${list.location}</td>
			<c:choose>
				<c:when test="${list.is_delete eq 2}"><td>${'N'}</td></c:when>
				<c:when test="${list.is_delete eq 1}"><td>${'Y'}</td></c:when>	
			</c:choose>
		</tr>
</c:forEach>
<input type="hidden" id="totcnt" name="totcnt" value="${countmemberlist}"/>
</c:if>
<!-- ===================================================== -->
<c:if test="${countmemberlist2 eq 0}">
	<tr>
		<td colspan="7">데이터가 존재하지 않습니다.</td>
	</tr>
<input type="hidden" id="totcnt2" name="totcnt2" value="${countmemberlist2}"/>
</c:if>
<!-- ----------------------------------------------------------------------------------------------- -->
<c:if test="${countmemberlist2 > 0}">
<c:forEach items="${prsnllist2}" var="list2">
		<tr>
			<td>${list2.loginID2}</td>
			<td><a href="javascript:openDetail(${list2.loginID2})">${list2.name2}</a></td>
			<td>${list2.adtype}</td>
			<td>${list2.adexp}</td>
			<td>${list2.adedu}</td>
			<td>${list2.adsal}</td>
			<td>${list2.regdat}</td>
			<td>${list2.addat}</td>
			<td>${list2.adstat}</td>
			<c:choose>
				<c:when test="${list2.is_delete2 eq 2}"><td>${'N'}</td></c:when>
				<c:when test="${list2.is_delete2 eq 1}"><td>${'Y'}</td></c:when>
				<c:otherwise><td>${'N'}</td></c:otherwise>
			</c:choose>
		</tr>
</c:forEach>
<input type="hidden" id="totcnt2" name="totcnt2" value="${countmemberlist2}"/>
</c:if>
<!-- ===================================================== -->

