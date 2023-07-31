<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 제안(이력서) 현황 데이터 가져오기 -->

<!-- forEach : 반복문 
           반복문을 쓰는 이유 : 데이터를 List로 받았기에 반복문을 씁니다. (쉬운 이유 : 데이터가 한건만 있는게 아니고 많은 건수가 있어서 반복문을 씁니다.)
     items : List 변수명(데이터)  -->
     
<!-- input type = "hidden"의 태그 3가지를 쓴 이유는 제안 신청을 위한 속성들이 필요해서 썼습니다. -->

<c:if test="${countResumeList eq 0}">

	<tr><td colspan='4'>해당 데이터가 없습니다.</td></tr>
	
</c:if>

<c:if test="${countResumeList > 0 }">

<c:forEach items="${resumeList}" var="list">

	<c:if test="${list.is_delete eq 2}">
	
		<tr>
			
			<td>${list.resume_no}</td>
			<td>${list.det}</td>
			<td>${list.name}</td>
			<td><a href="javascript:fn_openResume(${list.resume_no})">${list.resume_title}</a></td>
			
		</tr>
	
	</c:if>
	
	<input type="hidden" name="position" id="position" value="${list.position}">
	<input type="hidden" name="experience" id="experience2" value="${list.experience}">
	<input type="hidden" name="name2" id="name2" value="${list.name}">
	<input type="hidden" name="id" id="id" value="${list.id}">
	
	
</c:forEach>

</c:if>

<!-- 페이지 네이션을 위한 데이터의 총 건수 -->
<input type="hidden" id="totcnt" name="totcnt" value="${countResumeList}"/>