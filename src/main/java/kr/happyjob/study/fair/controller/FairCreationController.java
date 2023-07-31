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
import org.springframework.web.multipart.MultipartFile;

import kr.happyjob.study.fair.model.FairCreationModel;
import kr.happyjob.study.fair.model.FairMgtModel;
import kr.happyjob.study.fair.service.FairCreationService;


@Controller
@RequestMapping("/fair/")
public class FairCreationController {
	
	@Autowired
	FairCreationService fairCreationService;
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	@RequestMapping("jobFairCreation.do")
	public String fCreation(Model model, @RequestParam Map<String, Object> paramMap, 
			 HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		model.addAttribute("loginId", (String) session.getAttribute("loginId"));
		model.addAttribute("userNm", (String) session.getAttribute("userNm"));

		return "fair/jobFairCreation";
	}
	
	@RequestMapping("creationList.do")
	@ResponseBody	
	public Map<String, Object> creationList(@RequestParam Map<String, Object> paramMap,
			@RequestParam("addfile") List<MultipartFile> multiFile,
			HttpServletRequest request, 
			HttpServletResponse response, HttpSession session) throws Exception{
		logger.info("   - paramMap : " + paramMap);
		
		String location = (String)paramMap.get("location");
		
		if("1".equals(location))
		{
			paramMap.put("booth", 1);
		}
		else if("2".equals(location))
		{
			paramMap.put("booth", 2);
		}
		else if("3".equals(location))
		{
			paramMap.put("booth", 3);
		}
		
		fairCreationService.fairNewSaveFile(paramMap, request, multiFile);
		
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", "SUCCESS");

		return returnMap;
	}
	
	@RequestMapping("jobFairMgt.do")
	public String fDetail(Model model, @RequestParam Map<String, Object> paramMap, 
			 HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		model.addAttribute("loginId", (String) session.getAttribute("loginId"));
		model.addAttribute("userNm", (String) session.getAttribute("userNm"));

		return "fair/jobFairMgt";
	
	}
	@RequestMapping("jobFairList.do")
	public String fairList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception{
		logger.info("   - paramMap : " + paramMap);
		
		int pageSize = Integer.parseInt((String) paramMap.get("pageSize"));
		int cpage = Integer.parseInt((String) paramMap.get("cpage"));
		int pageindex = (cpage - 1) * pageSize;
		
		paramMap.put("pageindex", pageindex);
		paramMap.put("pageSize", pageSize);
		
		int status = fairCreationService.updateIsDelete(paramMap);
		
		model.addAttribute("creationlist", fairCreationService.creationlist(paramMap));
		model.addAttribute("countcreationlist", fairCreationService.countcreationlist(paramMap));
		model.addAttribute("cpage", cpage);

		return "fair/jobFairMgtList";
	}
}
