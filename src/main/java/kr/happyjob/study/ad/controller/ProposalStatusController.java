package kr.happyjob.study.ad.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.happyjob.study.ad.model.ProposalStatusModel;
import kr.happyjob.study.ad.service.ProposalStatusService;
import kr.happyjob.study.resume.model.ResumeModel;
import kr.happyjob.study.resume.service.ResumeService;
import kr.happyjob.study.userinfo.service.MailService;

@Controller // 이 문서가 Controller 문서임을 입증하는 어노테이션임
@RequestMapping("/ad/")
public class ProposalStatusController {
	
	@Autowired
	ProposalStatusService proposalStatusService;
	
	@Autowired
	ResumeService resumeService;
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
		
	// 모든 문서에 반드시 있어야 하는 메소드
	@RequestMapping("proposalStatus.do")
	public String ProposalStatus(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
		HttpServletResponse response, HttpSession session) throws Exception {
			
			model.addAttribute("loginId", (String) session.getAttribute("loginId")); // 세션을 통해 로그인한 아이디를 가져와서 jsp 문서에 해당 아이디를 데이터로 넣는다.
			
			return "ad/proposalStatus/ProposalStatus";
			
	}
	
	// 제안(이력서) 현황 조회 메소드
	@RequestMapping("resumeList.do")
	public String resumeList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("   - paramMap : " + paramMap);
		
		// 로그인한 아이디를 사용할 거면 반드시 넣어야 한다.
		paramMap.put("loginId", session.getAttribute("loginId"));
		
		// 페이지 네이션을 위한 필수 변수
		int pageSize = Integer.parseInt((String) paramMap.get("pageSize")); // 한 페이지당 보여줄 데이터
		int cpage = Integer.parseInt((String) paramMap.get("cpage")); // 현재 페이지
		int pageindex = (cpage - 1) * pageSize; // pageindex : 현재 페이지 번호
		
		paramMap.put("pageindex", pageindex);
		paramMap.put("pageSize", pageSize);
		paramMap.put("cpage", cpage);
		
		// 제안(이력서) 조회 함수
		List<ProposalStatusModel> resumeList = proposalStatusService.resumeList(paramMap);
		
		System.out.println("조회 결과 : " + resumeList);
		
		logger.info("=============resuPropList===============" + resumeList);
		
		// 제안(이력서) 총 건수 함수
		int countResumeList = proposalStatusService.countResumeList(paramMap);
		
		logger.info("=============countResumeList===============" + countResumeList);
		
		// JSP 문서와 Controller 문서 단과 서로 데이터를 주고 받는 리스트
		model.addAttribute("resumeList", resumeList); // 조회 결과 값
		model.addAttribute("countResumeList", countResumeList); // 총 조회 건수
		
		return "ad/proposalStatus/ProposalStatusList";
	}
	
	// 제안(이력서) 현황 조회 메소드
	@RequestMapping("resuPropList.do")
	public String resuPropList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
		HttpServletResponse response, HttpSession session) throws Exception {
			
			logger.info("   - paramMap : " + paramMap);
			
			// 로그인한 아이디를 사용할 거면 반드시 넣어야 한다.
			paramMap.put("loginId", session.getAttribute("loginId"));
			
			// 페이지 네이션을 위한 필수 변수
			int pageSize = Integer.parseInt((String) paramMap.get("pageSize")); // 한 페이지당 보여줄 데이터
			int cpage = Integer.parseInt((String) paramMap.get("cpage")); // 현재 페이지
			int pageindex = (cpage - 1) * pageSize; // pageindex : 현재 페이지 번호
			
			paramMap.put("pageindex", pageindex);
			paramMap.put("pageSize", pageSize);
			paramMap.put("cpage", cpage);
			
			// 제안(이력서) 조회 함수
			List<ProposalStatusModel> ProposStatus = proposalStatusService.ProposStatus(paramMap);
			
			System.out.println("조회 결과 : " + ProposStatus);
			
			logger.info("=============ProposStatus===============" + ProposStatus);
			
			// 제안(이력서) 총 건수 함수
			int countProposStatus = proposalStatusService.countProposStatus(paramMap);
			
			logger.info("=============countProposStatus===============" + countProposStatus);
			
			// JSP 문서와 Controller 문서 단과 서로 데이터를 주고 받는 리스트
			model.addAttribute("ProposStatus", ProposStatus); // 조회 결과 값
			model.addAttribute("countProposStatus", countProposStatus); // 총 조회 건수
			
			return "ad/proposalStatus/ProposalStatusDetail";
	}
	
	// 이력서 상세보기 & 이력서 열람 기업 등록
	// 남이 하신 소스를 함부로 사용하지 말고 내가 만든 화면과 기능을 생각해서 그대로 복사 붙여넣기 하지 말고 몇가지만 이용하고 쓰자.
	@RequestMapping("resumeDetail.do")
	@ResponseBody
	public Map<String, Object> resumeDetail(Model model, @RequestParam Map<String, Object> paramMap,
		HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
			// 이력서 열람 기업 등록 함수
		
			logger.info("   - paramMap : " + paramMap);
								
			paramMap.put("loginId", session.getAttribute("loginId"));
								
			proposalStatusService.resumeHistory(paramMap);
		
			// 모델로 안 받고 Map으로 받은 이유는 해당 이력서는 이력서 정보 만 아니라 사용자 정보까지 한번에 받아야 하기에 Map으로 받았습니다.
		
			logger.info("   - paramMap : " + paramMap);
		
			Map<String, Object> resumeDetailMap = proposalStatusService.resumeDetail(paramMap);
			
			logger.info("=============resumeDetailMap===============" + resumeDetailMap);
			
			return resumeDetailMap;
		}
	
	// 면접 제안 번호 구하기
	@RequestMapping("searchProposalNo.do")
	@ResponseBody
	public Map<String, Object> searchProposalNo(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("   - paramMap : " + paramMap);
		
		// 로그인한 아이디를 사용할 거면 반드시 넣어야 한다.
		paramMap.put("loginId", session.getAttribute("loginId"));
		
		// 제안(이력서) 조회 함수
		Map<String, Object> prop = proposalStatusService.proposalno(paramMap);
				
		logger.info("=============proposalno===============" + prop);
		
		return prop;
		
	}
	
	// 면접 제안 날짜 보내기
	@RequestMapping("joboffersave.do")
	@ResponseBody
	public Map<String, Object> joboffersave(Model model, @RequestParam Map<String, Object> paramMap,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("   - paramMap : " + paramMap);
		logger.info("   - request : " + request);

		paramMap.put("loginId", session.getAttribute("loginId"));
		
		paramMap.put("userNm", session.getAttribute("userNm"));
		
		int history_no = proposalStatusService.historyno(paramMap);
		
		paramMap.put("history_no", history_no);
		
		logger.info("   - paramMap : " + paramMap);

		proposalStatusService.joboffer(paramMap);
		
		// 면접 신청 메일 보내기 (업체가 취준생에게)
		
		proposalStatusService.sendMail(paramMap);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();

		returnMap.put("result", "SUCCESS");

		return returnMap;
	}
	
	// 면접 취소 보내기
	@RequestMapping("jobcancle.do")
	@ResponseBody
	public Map<String, Object> jobcancle(Model model, @RequestParam Map<String, Object> paramMap,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("   - paramMap : " + paramMap);
		
		proposalStatusService.jobcancle(paramMap);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		logger.info("   - returnMap : " + returnMap);
		
		returnMap.put("result", "SUCCESS");
		
		return returnMap;
		
	}

}