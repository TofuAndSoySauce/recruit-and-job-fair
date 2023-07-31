package kr.happyjob.study.history.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.happyjob.study.history.model.HistoryQueryParam;
import kr.happyjob.study.history.model.HistoryResponseDto.History;
import kr.happyjob.study.history.service.HistoryService;

@RequestMapping("/history/")
@Controller
public class HistoryController {

	@Autowired
	HistoryService historyService;
	
	@GetMapping("list.do")
	public String list(HttpSession session, HistoryQueryParam queryParam, Model model){
		
		String loginId = (String) session.getAttribute("loginId");

		if (queryParam.getPageSize() == 0) queryParam.setDefaultPage();
		queryParam.setLoginId(loginId);
		queryParam.setPageIndex();
		
		List<History> list = historyService.getHistory(queryParam);
		model.addAttribute("historyList", list);
		
		if(!list.isEmpty()){
			model.addAttribute("historyTotalCount", list.get(0).getTotalCount());
		}
		
		return "history/historyList";
				
	}
	
	@GetMapping("historyMain.do")
	public String main() {
		return "history/historyMain";
	}
	
}
