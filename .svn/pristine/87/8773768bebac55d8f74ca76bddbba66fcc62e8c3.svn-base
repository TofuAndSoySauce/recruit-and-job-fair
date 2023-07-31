<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:if test="${countcommentlist == 0}">
<tr><td colspan = "5">데이터가 없습니다.</td></tr>
</c:if>
<c:if test="${countcommentlist > 0}">
<c:forEach var="comment" items="${communitycommentlist}">
	  <c:if test="${comment.is_delete eq 2}">
	    <tr>
	      	<td>${comment.comment_id}</td>
	      	<td>
	        <span>${comment.comment_content}</span>
	        <input type="text" id="comment_detfile" value="${comment.comment_content}" class="inputTxt p100" style="display:none;text-align:left">
	  		</input>
		        <c:if test="${comment.comment_id == sessionScope.loginId}">
		          <a href="javascript:openCmt('${comment.comment_no}', '${comment.board_no}')" class="commentbtn" id="btnCommentupdate" >[수정]</a>
		          <a href="javascript:deleteCmt('${comment.comment_no}', '${comment.board_no}')" class="commentbtn" id="btnCommentdelete" >[삭제]</a>
		          <a href="javascript:updateCmt('${comment.comment_no}')"  id="btnCommentupdate1" style="display:none">[저장]</a>
		          <a href="javascript:openDetail('${list.board_no}')" id="btnClosefile1"  style="display:none;">[취소]</a>
	      		</c:if>
	      	</td>
	      	<td>${comment.reg_date}</td>
	    </tr>
	  </c:if>
</c:forEach>	
</c:if>	
					
<input type="hidden" id="totcntCMT" name="totcntCMT" value="${countcommentlist}"/>			