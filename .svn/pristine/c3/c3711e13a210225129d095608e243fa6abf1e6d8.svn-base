<%@ page language="java" import="java.time.LocalDate"
	contentType="text/html;
charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:forEach items="${proposalList}" var="proposal">

	<tr class="proposalListTr">
		<td class="proposal">
			<p>
				<a href="#" class="company-link" data-company-login-id="${proposal.companyName}">${proposal.companyName}</a>
			</p>
		</td>
		<td>${proposal.experience}</td>
		<td>${proposal.position}</td>
		<td>
			<a href="javascript:popupResumeDetail(${proposal.resumeNo})">${proposal.resumeTitle}</a>
		</td>
		<td>
			<p class="proposalMemo">${proposal.memo }"</p>
		</td>
		<c:choose>
			<c:when test="${proposal.accepted == 1}">
				<td class="acceptButtonAreaTd">
					<input type="hidden" class="proposalNo" value="${proposal.proposalNo }"/>
					<input type="hidden" class="accepted" value=false />
					<div class="updateParamArea">
						<input class="propsalMemo" type="text" placeholder="면접가능일정을 적어주세요">
						<button type="button" class="proposalSubmitButton proposalButton acceptanceButton">확인</button>
						<button type="button" class="proposalCloseButton proposalButton"><p>닫기</p></button>
					</div>
					<div class="acceptButtonArea">
						<button type="button" class="acceptProposalButton proposalButton"><p>수락</p></button> 
						<button type="button" class="proposalSubmitButton refuseProposalButton proposalButton"><p>거절</p></button>
					</div>
				</td>
			</c:when>
			<c:when test="${proposal.accepted == 2}">
				<td><p>거절함</p> <p>${proposal.updatedAt} </p></td>
			</c:when>
			<c:otherwise>
				<td><p>수락함</p> <p>${proposal.updatedAt} </p></td>
			</c:otherwise>
		</c:choose>
		
	</tr>

</c:forEach>

<input type="hidden" id="totcnt" name="totcnt" value="${totalProposalCount}" />
<input type="hidden" id="newProposalCount" name="newProposalCount" value="${newProposalCount}" />