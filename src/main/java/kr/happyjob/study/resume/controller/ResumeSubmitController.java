package kr.happyjob.study.resume.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.happyjob.study.resume.model.ResumeAdDTO;
import kr.happyjob.study.resume.model.ResumeAdListDTO;
import kr.happyjob.study.resume.model.ResumeAppliDTO;
import kr.happyjob.study.resume.model.ResumeListDTO;
import kr.happyjob.study.resume.model.ResumeSubmitListDto;
import kr.happyjob.study.resume.model.ResumeSubmitModel;
import kr.happyjob.study.resume.service.ResumeSubmitService;

@Controller
@RequestMapping("/resume/")
public class ResumeSubmitController {
	
	private ResumeSubmitService service;
	
	@Autowired
	public ResumeSubmitController(ResumeSubmitService service) {
		this.service = service;
 	}
	
	//페이지 접속
	@RequestMapping("applicantStatus.do")
	public String resumeSubmit(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception{
		
		model.addAttribute("loginId", (String) session.getAttribute("loginId"));
		model.addAttribute("userNm", (String) session.getAttribute("userNm"));
		model.addAttribute("userType",(String) session.getAttribute("userType"));
		
		return "/resume/resumeSubmit";
	}
	
	//공고 현황 리스트 뿌려주기
	@RequestMapping("resumeAdList.do")
	@ResponseBody
	public ResumeAdDTO resumeAdList(ResumeAdListDTO rld)throws Exception{
		
		//페이징 처리
		int pageSize = rld.getPageSize();
		int cpage = rld.getCpage();
		int pageIndex = (cpage - 1) * pageSize;
		rld.setPageIndex(pageIndex);
		
		ResumeAdDTO dto = new ResumeAdDTO();

		//리스트
		List<ResumeAdListDTO> list = service.resumeAdList(rld);
		//총 카운트
		int countResumeList = service.countResumeAdList(rld);
		
		dto.setList(list);
		dto.setCountResumeList(countResumeList);
		
		return dto;
	}
	
	//해당공고 지원자 현황 리스트 뿌려주기
	@RequestMapping("resumeSubmitList.do")
	@ResponseBody
	public ResumeSubmitListDto rld(ResumeAdListDTO rld)throws Exception{
		
		//페이징 처리
		int pageSize = rld.getPageSize();
		int cpage = rld.getCpage();
		int pageIndex = (cpage - 1) * pageSize;
		rld.setPageIndex(pageIndex);
		
		List<ResumeListDTO> list = service.resumeSubmitList(rld);
		int countResumeSubmitList = service.countResumeSubmitList(rld);
		
		ResumeSubmitListDto dto = new ResumeSubmitListDto();
		dto.setList(list);
		dto.setCountResumeSubmitList(countResumeSubmitList);
		
		return dto;
		
	}
	
	//이력서 뿌려주기
	@RequestMapping("resumeapplicant.do")
	@ResponseBody
	public ResumeAppliDTO resumeApplicant(int submit_no) throws Exception{
		
		ResumeAppliDTO rad = service.resumeApplicant(submit_no);
		
		return rad;
	}
	
	//불합격처리(update)
	@RequestMapping("resumeResult.do")
	@ResponseBody
	public int resumeResult (int submit_no) throws Exception{
		System.out.println("======================================");
		System.out.println("submit_no : " + submit_no);
		System.out.println("======================================");
		int result = service.resumeResult(submit_no);
		
		return result;
	}

	//합격처리(update)
	@RequestMapping("resumePassResult.do")
	@ResponseBody
	public int resumePassResult(int submit_no) throws Exception{
		System.out.println("======================================");
		System.out.println("submit_no : " + submit_no);
		System.out.println("======================================");
		int result = service.resumePassResult(submit_no);
		
		return result;
	}
	
	//면접일정 등록
	@RequestMapping("interviewUpdateDate.do")
	@ResponseBody
	public int interviewInsertDate(ResumeSubmitModel rsm) throws Exception{
		int result = service.interviewUpdateDate(rsm);
		
		return result;
	}
	
	

}
