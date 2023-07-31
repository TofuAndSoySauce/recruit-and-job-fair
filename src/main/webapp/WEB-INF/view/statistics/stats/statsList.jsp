<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!--  ===============================================  -->
<c:if test="${countstatslist eq 0}">
	<tr>
		<td colspan="7">데이터가 존재하지 않습니다.</td>
	</tr>
<input type="hidden" id="totcnt" name="totcnt" value="${countstatslist}"/>
</c:if>
<!-- ---------------------------------------------------------------------------------------- -->
<c:if test="${countstatslist > 0}">
<!-- 기업별 통계 게시판 -->
<c:forEach items="${statslist}" var="list">
		<tr>
			<td>${list.loginID2}</td>
			<td><a href="javascript:openStatsBar('${list.loginID2}')">${list.name2}</a></td> 
			<!--  <td><a class="company-link" data-company-login-id="${list.loginID2}" href="#">${list.name2}</a></td>-->
			<td>${list.adtype}</td>
			<td>${list.adexp}</td>
			<td>${list.adedu}</td>
			<td>${list.adsal}</td>
			<td>${list.regdat}</td>
			<td>${list.addat}</td>
			<td>${list.adstat}</td>
			<c:choose>
				<c:when test="${list.is_delete eq 2}"><td>${'N'}</td></c:when>
				<c:when test="${list.is_delete eq 1}"><td>${'Y'}</td></c:when>	
				<c:otherwise><td>${'N'}</td></c:otherwise>
			</c:choose>
		</tr>
</c:forEach>
<input type="hidden" id="totcnt" name="totcnt" value="${countstatslist}"/>
</c:if>
<!-- ===================================================== -->
<!-- 박람회별 통계 게시판 -->
<c:if test="${countstatslist2 eq 0}">
	<tr>
		<td colspan="7">데이터가 존재하지 않습니다.</td>
	</tr>
<input type="hidden" id="totcnt2" name="totcnt2" value="${countstatslist2}"/>
</c:if>
<!-- ---------------------------------------------------------------------------------------- -->

<c:if test="${countstatslist2 > 0}">
<c:forEach items="${statslist2}" var="list2">
		<tr>
			<td>${list2.fno}</td>
			<td><a href="javascript:openStatsPie(${list2.fno})">${list2.fttl}</a></td>
			<td>${list2.floc}</td>
			<td>${list2.fst}</td>
			<td>${list2.fed}</td>
			<td>${list2.facn}</td>
			<td>${list2.faun}</td>
		</tr>
</c:forEach>
<input type="hidden" id="totcnt2" name="totcnt2" value="${countstatslist2}"/>
</c:if>
<!-- ===================================================== -->

