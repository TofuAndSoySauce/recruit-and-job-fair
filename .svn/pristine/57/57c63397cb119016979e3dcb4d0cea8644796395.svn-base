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

import kr.happyjob.study.fair.model.JobFairBoothApplicationModel;
import kr.happyjob.study.fair.service.JobFairBoothApplicationService;
import kr.happyjob.study.userinfo.model.CompanyMgtModel;

@RequestMapping("/fair/")
@Controller
public class JobFairBoothApplicationController {
	
	@Autowired
	JobFairBoothApplicationService jobFairBoothApplicationService;

	//Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	@RequestMapping("jobFairBoothApplication.do")
	public String jobFairBoothApplication(Model model, @RequestParam Map<String, Object> paramMap,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		model.addAttribute("loginId", (String) session.getAttribute("loginId"));
		model.addAttribute("userNm", (String) session.getAttribute("userNm"));
		
		// select박스가져오기(지역 검색 예:경기, 서울)
		List<Map<String, Object>> regiSel= jobFairBoothApplicationService.regionSelect();			
		//동기, 고정된 값
		model.addAttribute("regiSel", regiSel);

		return "fair/jobFairBoothApplication/jobFairBoothApplication";
	}

	@RequestMapping("jobFairBoothApplicationList.do")
	public String jobFairBoothApplicationList(Model model, @RequestParam Map<String, Object> paramMap,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		logger.info("   - paramMap : " + paramMap);

		int pageSize = Integer.parseInt((String) paramMap.get("pageSize"));
		int cpage = Integer.parseInt((String) paramMap.get("cpage"));
		int pageindex = (cpage - 1) * pageSize;

		paramMap.put("pageindex", pageindex);
		paramMap.put("pageSize", pageSize);
		
		
		paramMap.put("loginId",  (String) session.getAttribute("loginId"));
		List<JobFairBoothApplicationModel> boothList = jobFairBoothApplicationService.jobFairBoothApplicationList(paramMap);
		int cntBooth = jobFairBoothApplicationService.countJobFairBoothApplicationList(paramMap);

		model.addAttribute("boothList", boothList);
		model.addAttribute("cntBooth", cntBooth);

		
		logger.info("   - boothList : " + boothList);
		return "fair/jobFairBoothApplication/jobFairBoothApplicationList";
	}

	@RequestMapping("jobFairBoothApplicationDetail.do")
	@ResponseBody
	public Map<String, Object> jobFairBoothApplicationDetail(Model model, @RequestParam Map<String, Object> paramMap,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

		logger.info("   - paramMap : " + paramMap);

		JobFairBoothApplicationModel boothDet = jobFairBoothApplicationService.jobFairBoothApplicationDetail(paramMap);

		Map<String, Object> returnMap = new HashMap<String, Object>();

		returnMap.put("boothDet", boothDet);
		
		//박람회에 따라 기업이 사용중인 부스번호
		List<Map<String, Object>> existBooth = jobFairBoothApplicationService.jobFairBoothApplicationExistBooth(paramMap);
		//model.addAttribute("existBooth",existBooth);
		returnMap.put("existBooth", existBooth);
		
		//박람회 부스타입 셀렉트박스
		List<Map<String, Object>> boothType = jobFairBoothApplicationService.boothTypeSelect();
		model.addAttribute("boothType", boothType);
		returnMap.put("boothType", boothType);
		logger.info("   - returnMap : " + returnMap);

		return returnMap;
	}

	
	@RequestMapping("jobFairBoothApplicationSave.do")
	@ResponseBody
	public Map<String, Object> jobFairBoothApplicationSave(Model model, @RequestParam Map<String, Object> paramMap,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		logger.info("   - paramMap : " + paramMap);

		paramMap.put("loginId", (String) session.getAttribute("loginId"));

		jobFairBoothApplicationService.jobFairBoothApplicationSave(paramMap);


		return paramMap;
	}
}
