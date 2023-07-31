<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:if test="${countfairlist eq 0}">
	<tr>
		<td colspan="7">데이터가 없습니다.</td>
	</tr>
</c:if>
<c:if test="${countfairlist > 0}">
<c:forEach items="${fairlist}" var="list">
	<tr>
		<td>${list.fair_title}</td>
		<td>${list.name}</td>
		<td>${list.user_email}</td>
		<td>${list.reg_date}</td>
		<c:if test="${list.is_delete eq '1'}">
		<td><a class="btnType blue" id="accept" name="btn" href="javascript:buttonClickEvent('${list.fair_no}','${list.loginID}','A','${cpage}','${list.join_boothnum}')"><span>승인</span></a>&nbsp&nbsp
		<a class="btnType red" id="reject" name="btn" href="javascript:buttonClickEvent('${list.fair_no}','${list.loginID}','N', '${cpage}','${list.join_boothnum}');"><span>반려</span></a></td>
		</c:if>
		<c:if test="${list.is_delete ne '1'}">
		<td>${list.detail_name}</td>
		</c:if>
		<td>${list.join_denialdate}</td>
		<td>${list.join_memo}</td>
	</tr>
</c:forEach>
</c:if>
<input type="hidden" id="totcnt" name="totcnt" value="${countfairlist}">