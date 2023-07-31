package kr.happyjob.study.fair.controller;

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

import kr.happyjob.study.fair.model.JobFairModel;
import kr.happyjob.study.fair.service.JobFairService;


@Controller // 이 문서가 Controller 문서임을 입증하는 어노테이션임
@RequestMapping("/fair/")
public class jobFairController {
	
	@Autowired
	JobFairService jobFairService;
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
			
	// 모든 문서에 반드시 있어야 하는 메소드
	@RequestMapping("jobFair.do")
	public String JobFair(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
		HttpServletResponse response, HttpSession session) throws Exception {
				
			model.addAttribute("loginId", (String) session.getAttribute("loginId")); // 세션을 통해 로그인한 아이디를 가져와서 jsp 문서에 해당 아이디를 데이터로 넣는다.
				
			return "fair/JobFair";
				
		}
	
	// 제안(이력서) 현황 조회 메소드
	@RequestMapping("JobFairList.do")
	public String JobFairList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
		HttpServletResponse response, HttpSession session) throws Exception {
		
			logger.info("   - paramMap : " + paramMap);
			
			// 로그인한 아이디를 사용할 거면 반드시 넣어야 한다.
			paramMap.put("loginId", session.getAttribute("loginId"));
			
			// 페이지 네이션을 위한 필수 변수
			int pageSize = Integer.parseInt((String) paramMap.get("pageSize")); // 한 페이지당 보여줄 데이터
			int cpage = Integer.parseInt((String) paramMap.get("cpage")); // 현재 페이지
			int pageindex = (cpage - 1) * pageSize; // pageindex : 현재 페이지 번호
			
			System.out.println(" 현재 페이지 : " + cpage);
			
			paramMap.put("pageindex", pageindex);
			paramMap.put("pageSize", pageSize);
			paramMap.put("cpage", cpage);
			
			// 박람회 조회 함수
			List<JobFairModel> jobFairlist = jobFairService.jobFairlist(paramMap);
			
			logger.info("=============jobFairlist===============" + jobFairlist);
			
			// 박람회 총 건수 구하는 함수
			int countJobFairList = jobFairService.countJobFairList(paramMap);
			
			logger.info("=============countJobFairList===============" + countJobFairList);
			
			model.addAttribute("jobFairlist", jobFairlist); // 조회 결과 값
			model.addAttribute("countJobFairList", countJobFairList); // 총 조회 건수
			
			return "fair/JobFairList";
			
		}
	
	// 박람회 상세 보기
	@RequestMapping("JobFairDetail.do")
	@ResponseBody
	public Map<String, Object> JobFairDetail(Model model, @RequestParam Map<String, Object> paramMap,
		HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
			// 이력서 열람 기업 등록 함수
		
			logger.info("   - paramMap : " + paramMap);
								
			paramMap.put("loginId", session.getAttribute("loginId"));
		
			// 모델로 안 받고 Map으로 받은 이유는 해당 이력서는 이력서 정보 만 아니라 사용자 정보까지 한번에 받아야 하기에 Map으로 받았습니다.
		
			Map<String, Object> JobFairDetail = jobFairService.JobFairDetail(paramMap);
			
			logger.info("=============JobFairDetail===============" + JobFairDetail);
			
			return JobFairDetail;
	}
	
	// 박람회 신청하기
	@RequestMapping("JobFairSave.do")
	@ResponseBody
	public Map<String, Object> JobFairSave(Model model, @RequestParam Map<String, Object> paramMap,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("   - paramMap : " + paramMap);
		logger.info("   - request : " + request);

		paramMap.put("loginId", session.getAttribute("loginId"));
		
		paramMap.put("userNm", session.getAttribute("userNm"));
		
		logger.info("   - paramMap : " + paramMap);

		jobFairService.JobFair(paramMap);
		
		jobFairService.updateJobFair(paramMap);
		
		// 면접 신청 메일 보내기 (업체가 취준생에게)
		
		jobFairService.sendMail(paramMap);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();

		returnMap.put("result", "SUCCESS");

		return returnMap;
	}

}