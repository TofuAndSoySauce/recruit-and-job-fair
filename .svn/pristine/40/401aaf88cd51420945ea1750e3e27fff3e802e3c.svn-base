package kr.happyjob.study.resume.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import kr.happyjob.study.resume.model.ProposalQueryParam;
import kr.happyjob.study.resume.model.ProposalRequest.Patch;
import kr.happyjob.study.resume.model.ProposalResponse.Proposal;
import kr.happyjob.study.resume.model.ProposalResponse.ProposedCompany;
import kr.happyjob.study.resume.service.ProposalService;

@RequestMapping("/resume")
@Controller
public class ProposalController {

	@Autowired
	ProposalService proposalService;

	@GetMapping("/interviewOfferMgt.do")
	public String getList() {

		return "resume/interviewOfferMain";

	}

	@ResponseStatus(HttpStatus.OK)
	@GetMapping("/proposal/list.do")
	public String proposalList(HttpSession session, ProposalQueryParam param, Model model) {
		String loginId = (String) session.getAttribute("loginId");

		if (param.getPageSize() == 0)
			param.setDefaultPage();
		param.setLoginId(loginId);
		param.setPageIndex();

		List<Proposal> list = proposalService.getList(param);
		model.addAttribute("proposalList", list);

		if (!list.isEmpty()) {
			model.addAttribute("totalProposalCount", list.get(0).getTotalProposalCount());
			model.addAttribute("newProposalCount", list.get(0).getNewProposalCount());
		}

		return "resume/proposalList";
	}

	@ResponseBody
	@GetMapping("/proposal/proposedCompany.do")
	public ResponseEntity<ProposedCompany> getProposedCompany(@RequestParam String companyLoginId) {
		if (companyLoginId == null)
			throw new RuntimeException("loginID가 없습니다.");

		return new ResponseEntity<>(proposalService.getProposedCompany(companyLoginId), HttpStatus.OK);
	}
	
	@ResponseBody
	@PatchMapping("/proposal/updateStatus.do")
	public ResponseEntity<Patch> updateStatus(@RequestBody Patch patch){
		if(patch.getLoginId() == null || patch.getProposalNo() == 0)
			throw new RuntimeException(String.format("사용자 정보가 없습니다. loginId: %s, proposalNo: %d", patch.getLoginId(), patch.getProposalNo()));
		
		proposalService.updateStatus(patch);
		
		return new ResponseEntity<>(patch, HttpStatus.OK);
	}


}
