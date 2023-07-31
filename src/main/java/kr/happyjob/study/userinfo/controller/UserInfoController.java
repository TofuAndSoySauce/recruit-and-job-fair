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

import kr.happyjob.study.ad.model.AdModel;
import kr.happyjob.study.userinfo.service.UserInfoService;

@Controller
@RequestMapping("/userInfo/")
public class UserInfoController {
	
	@Autowired
	UserInfoService userInfoService;
	
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	// 채용공고 수락 페이지
	@RequestMapping("userlMgt.do")
	public String userlMgt(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		model.addAttribute("loginId", (String) session.getAttribute("loginId"));
		model.addAttribute("userNm", (String) session.getAttribute("userNm"));

		return "userinfo/userlMgt";
	}
	
	
	// 채용공고 승인, 반려
	@RequestMapping("userDecide.do")
	@ResponseBody
	public Map<String, Object> adSaveFile(Model model, @RequestParam Map<String, Object> paramMap,
			@RequestParam("addfile") List<MultipartFile> multiFile, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		paramMap.put("loginID", session.getAttribute("loginId"));
		String action = (String) paramMap.get("action");

		if ("A".equals(action)) {
			userInfoService.acceptAd(paramMap);
		}
		else if ("C".equals(action)) {
			userInfoService.cancelAd(paramMap);
		}
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", "SUCCESS");
		return returnMap;
		
	}

	
	// 채용공고 리스트 불러오기
	@RequestMapping("userList.do")
	public String userList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		int pageSize = Integer.parseInt((String) paramMap.get("pageSize"));
		int cpage = Integer.parseInt((String) paramMap.get("cpage"));
		int pageindex = (cpage - 1) * pageSize;
		
		paramMap.put("pageindex", pageindex);
		paramMap.put("pageSize", pageSize);
		
		int countAdList = userInfoService.countAdList(paramMap);
		List<AdModel> adList = userInfoService.adList(paramMap);
		
		model.addAttribute("countAdList", countAdList);  
		model.addAttribute("adList", adList);
		
		return "userinfo/userList";
	}
	

	// 채용공고 상세보기 초기화
	@RequestMapping("userDetail.do")
	@ResponseBody
	public Map<String, Object> userDetail(Model model, @RequestParam Map<String, Object> paramMap,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

		Map<String, Object> adDetailMap = userInfoService.adDetail(paramMap);
		return adDetailMap;
	}
	
	
}
