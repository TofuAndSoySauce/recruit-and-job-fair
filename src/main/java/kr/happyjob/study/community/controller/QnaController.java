package kr.happyjob.study.community.controller;

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
import org.springframework.web.multipart.MultipartFile;

import kr.happyjob.study.community.model.QnaCommentModel;
import kr.happyjob.study.community.model.QnaDTO;
import kr.happyjob.study.community.model.QnaListResultDTO;
import kr.happyjob.study.community.model.QnaModel;
import kr.happyjob.study.community.model.QnalistDTO;
import kr.happyjob.study.community.service.QnaService;

@Controller
@RequestMapping("/community/")
public class QnaController {
	
	private QnaService service;
	
	@Autowired
	public QnaController(QnaService service) {
		this.service = service;
	}
	
	//페이지접속
	@RequestMapping("qna.do")
	public String qna(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception{
		
		model.addAttribute("loginId", (String) session.getAttribute("loginId"));
		model.addAttribute("userNm", (String) session.getAttribute("userNm"));
		model.addAttribute("userType",(String) session.getAttribute("userType"));
		
		
		return "/community/qna/qna";
	}
	
	//리스트출력
	@RequestMapping("qnaList.do")
	@ResponseBody
	public QnaListResultDTO qnaList(QnaDTO dto)throws Exception{
		
		//페이징 처리
		int pageSize = dto.getPageSize();
		int cpage = dto.getCpage();
		int pageIndex = (cpage - 1) * pageSize;
		dto.setPageIndex(pageIndex);
		
		List<QnalistDTO> qnalist = service.qnaList(dto);
		int countqnalist = service.countQnaList(dto);

		QnaListResultDTO resultDto = new QnaListResultDTO();
		resultDto.setList(qnalist);
		resultDto.setCountqnalist(countqnalist);
		
		//res.list.~~~
		//res.countnoticelist
		
		System.out.println("============= countnoticelist : " + countqnalist + "===============");
		return resultDto;
	}
	
	//등록
	//파일첨부
	@RequestMapping("qnaInsert.do")
	@ResponseBody
	public int qnaInsert(@RequestParam Map<String, Object> map, @RequestParam("multifile") MultipartFile multifile, HttpSession session, HttpServletRequest request, HttpServletResponse response)throws Exception{
		
		String lgnInfoModel = (String)session.getAttribute("loginId");
		
		//form안에 담긴 데이터가 무엇인지 모르기 때문에 
		//필요한 데이터 qm에 넣어준다
		QnaModel qm = new QnaModel();
		//qna_title을 qm에 담아준다 
		qm.setQna_title((String)map.get("qna_title"));
		//qna_content를 qm에 담아준다
		qm.setQna_content((String)map.get("qna_content"));
		qm.setLoginID(lgnInfoModel);
		
		System.out.println(qm.toString());
		
		int q = service.qnaInsert(qm, request, multifile);
		
		return q;
		
	}
	
	
	//상세정보
	@RequestMapping("qnaDetail.do")
	@ResponseBody
	public QnalistDTO qnaDetail(int qna_no, HttpServletRequest request, HttpServletResponse response, HttpSession session)throws Exception{
		
		QnalistDTO qm = service.qnaDetail(qna_no);
		
		return qm;
		
	}
	
	//삭제
	@RequestMapping("qnaDelete.do")
	@ResponseBody
	public int qndDelete(int qna_no, HttpServletRequest request, HttpServletResponse response, HttpSession session)throws Exception{
		
		int qm = service.qnaDelete(qna_no);
		
		return qm;
		
	}
	
	//수정
	@RequestMapping("qnaUpdate.do")
	@ResponseBody
	public int qnaUpdate(@RequestParam Map<String, Object> map, @RequestParam("multifile") MultipartFile multifile, HttpServletRequest request, HttpServletResponse response, HttpSession session)throws Exception{
	
		System.out.println(map.toString());
		
		String qna_no = (String) map.get("qna_no");
		System.out.println("================" + qna_no + "================");
		
		int i_qna_no = Integer.parseInt(qna_no);
		System.out.println("+++++++++++++++++" + i_qna_no + "+++++++++++++++++");
		
		QnaModel qm = new QnaModel();
		//qna_title을 qm에 담아준다 
		qm.setQna_title((String)map.get("qna_title"));
		//qna_content를 qm에 담아준다
		qm.setQna_content((String)map.get("qna_content"));
		//qna_no를 qm에 담아준다
		qm.setQna_no(i_qna_no);

		String file_cd = (String) map.get("filecd");
		if(file_cd != null && !file_cd.equals("")) {
			int i_file_cd = Integer.parseInt(file_cd);
			qm.setFile_cd(i_file_cd);
		}
		
		int result = service.qnaUpdate(qm, request, multifile);
		System.out.println("==========" + result + "============");
		
		return result;
	}
	
	//댓글등록
	@RequestMapping("insertComment.do")
	@ResponseBody
	public int insertComment(QnaCommentModel qcm,HttpServletRequest request, HttpServletResponse response, HttpSession session)throws Exception{
		
		String loginId = (String)session.getAttribute("loginId");
		
		qcm.setLoginID(loginId);
		System.out.println(qcm.toString());
		int result = service.insertComment(qcm);
		
		return result;
	}
	
	
	
	
	

}
