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

import kr.happyjob.study.fair.model.JobFairBoothMgtModel;
import kr.happyjob.study.fair.service.JobFairBoothMgtService;

@RequestMapping("/fair/")
@Controller
public class JobFairBoothMgtController {
	@Autowired
	JobFairBoothMgtService jobFairBoothMgtService;
	
		//Set logger
		private final Logger logger = LogManager.getLogger(this.getClass());

		@RequestMapping("jobFairBoothMgt.do")
		public String jobFairBoothMgt(Model model, @RequestParam Map<String, Object> paramMap,
				HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
			model.addAttribute("loginId", (String) session.getAttribute("loginId"));
			model.addAttribute("userNm", (String) session.getAttribute("userNm"));
			
			// select박스가져오기(지역 검색 예:경기, 서울)
						List<Map<String, Object>> regiSel= jobFairBoothMgtService.regionSelect();				
						//동기, 고정된 값
						model.addAttribute("regiSel", regiSel);
						
			return "fair/jobFairBoothMgt/jobFairBoothMgt";
		}
		
		@RequestMapping("jobFairBoothMgtList.do")
		public String jobFairBoothMgtList(Model model, @RequestParam Map<String, Object> paramMap,
				HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
			logger.info("   - paramMap : " + paramMap);

			int pageSize = Integer.parseInt((String) paramMap.get("pageSize"));
			int cpage = Integer.parseInt((String) paramMap.get("cpage"));
			int pageindex = (cpage - 1) * pageSize;

			paramMap.put("loginId", (String) session.getAttribute("loginId"));
			paramMap.put("pageindex", pageindex);
			paramMap.put("pageSize", pageSize);

			List<JobFairBoothMgtModel> boothList = jobFairBoothMgtService.jobFairBoothMgtList(paramMap);
			int cntBooth = jobFairBoothMgtService.countJobFairBoothMgtList(paramMap);

			//부스관리 페이지
			model.addAttribute("boothList", boothList);
			model.addAttribute("cntBooth", cntBooth);	

			return "fair/jobFairBoothMgt/jobFairBoothMgtList";
		}
		@RequestMapping("jobFairBoothMgtDetail.do")
		@ResponseBody
		public Map<String, Object> jobFairBoothMgtDetail(Model model, @RequestParam Map<String, Object> paramMap,
				HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

			logger.info("   - paramMap : " + paramMap);

			paramMap.put("loginId", (String) session.getAttribute("loginId"));
			JobFairBoothMgtModel boothDet = jobFairBoothMgtService.jobFairBoothMgtDetail(paramMap);

			Map<String, Object> returnMap = new HashMap<String, Object>();
			returnMap.put("boothDet", boothDet);
			
			//박람회 부스타입 셀렉트박스
			List<Map<String, Object>> boothType = jobFairBoothMgtService.boothTypeSelect();
			model.addAttribute("boothType", boothType);
			returnMap.put("boothType", boothType);

			logger.info("   - returnMap : " + returnMap);

			return returnMap;
		}
		@RequestMapping("jobFairBoothMgtCancel.do")
		@ResponseBody
		public Map<String, Object> jobFairBoothMgtCancel(Model model, @RequestParam Map<String, Object> paramMap,
				HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

			logger.info("   - paramMap : " + paramMap);
			//delete는 리턴필요x
			
			paramMap.put("loginId", (String) session.getAttribute("loginId"));
			jobFairBoothMgtService.jobFairBoothMgtCancel(paramMap);
						
			return paramMap;
		}
}
	