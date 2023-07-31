package kr.happyjob.study.userinfo.controller;

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

import kr.happyjob.study.userinfo.model.CompanyMgtModel;
import kr.happyjob.study.userinfo.service.CompanyMgtService;


@Controller
@RequestMapping("/userInfo/")
public class CompanyMgtController {

	@Autowired
	CompanyMgtService companyMgtService;
	CompanyMgtModel companyMgtModel;
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();
	
	//기업정보수정 초기화면
	@RequestMapping("companyMgt.do")
	public String companyMgt(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".companyMgt");
		logger.info("   - paramMap : " + (String) session.getAttribute("loginId"));
		
		// select박스가져오기(기업업종, 기업 규모)
		List<CompanyMgtModel> cateSel= companyMgtService.categorySelect();
		List<CompanyMgtModel> comSize= companyMgtService.companySizeSelect();		
		
		//동기, 고정된 값
		model.addAttribute("cateSel", cateSel);
		model.addAttribute("comSize", comSize);
		
		logger.info("+ End " + className + ".companyMgt");
		
		return "userinfo/companyMgt/companyMgt";
	}

	@RequestMapping("companyMgtdetail.do")
	@ResponseBody
	public CompanyMgtModel companyMgtdetail(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		logger.info("   - paramMap : " + paramMap);
		
		//	기업정보 화면 출력
		paramMap.put("loginId", (String) session.getAttribute("loginId"));
		CompanyMgtModel comMgInf= companyMgtService.companyMgtDetail(paramMap);
		model.addAttribute("companyMgtInfo", comMgInf);
		
		return comMgInf;
	}
	

	//기업정보 수정 with file
	@RequestMapping("companyMgtUpdateFile.do")
	@ResponseBody
	public Map<String, Object> companyMgtUpdateFile(Model model, @RequestParam Map<String, Object> paramMap,
			@RequestParam("profileUpload") List<MultipartFile> multiFile, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		logger.info("+ Start " + className + ".companyMgtUpdateFile");
		logger.info("   - paramMap : " + paramMap);		
		
		paramMap.put("loginId", session.getAttribute("loginId"));
		
		companyMgtService.companyMgtNewUpdateFile(paramMap, request, multiFile);

		logger.info("+ End " + className + ".companyMgtUpdateFile");
		return paramMap;
	}
	
	//사업자번호(companyNum) 중복체크
	@RequestMapping("companyMgtCNumCount.do")
	@ResponseBody
	public Map<String, Object> companyMgtCNumCount(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".companyMgtCNumCount");
		logger.info("   - paramMap : " + paramMap);		
		
		String result;
		
		Map<String, Object> returnmap = new HashMap<String, Object>();
		
		if(companyMgtService.companyMgtCNumCount(paramMap) > 0)
		{
			result = "true";
		}else
		{
			result="false";
		}
		
		returnmap.put("result", result);
		
		logger.info("+ End " + className + ".companyMgtCNumCount");

		return returnmap;
	}
}
