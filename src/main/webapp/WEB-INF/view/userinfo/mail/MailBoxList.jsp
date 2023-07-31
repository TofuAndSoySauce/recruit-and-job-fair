<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 보낸 메일함 데이터 가져오기 -->

<!-- forEach : 반복문 
           반복문을 쓰는 이유 : 데이터를 List로 받았기에 반복문을 씁니다. (쉬운 이유 : 데이터가 한건만 있는게 아니고 많은 건수가 있어서 반복문을 씁니다.)
     items : List 변수명(데이터)  -->

<c:if test="${countSendMailList eq 0}">

	<tr><td colspan='5'>해당 데이터가 없습니다.</td></tr>
	
</c:if>

<c:if test="${countSendMailList > 0 }">

	<c:forEach items="${mailList}" var="list" varStatus="Status">

		<c:if test="${list.is_delete eq 2}">
	
			<tr>
				
					<td>${pageindex+1}</td>
					<td>${list.mail_other}</td>
					<td><a href="javascript:fn_openDetail(${list.mail_no})">${list.mail_title}</a></td>
					<td>${list.read_date}</td>
					<td>${list.detail_name}</td>
		
			</tr>
	
		</c:if>
	
	</c:forEach>

</c:if>

<!-- 페이지 네이션을 위한 데이터의 총 건수 -->
<input type="hidden" id="totcnt" name="totcnt" value="${countSendMailList}"/>