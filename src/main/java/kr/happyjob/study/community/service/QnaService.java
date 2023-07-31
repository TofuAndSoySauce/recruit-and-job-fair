package kr.happyjob.study.community.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import kr.happyjob.study.community.model.QnaCommentModel;
import kr.happyjob.study.community.model.QnaDTO;
import kr.happyjob.study.community.model.QnaModel;
import kr.happyjob.study.community.model.QnalistDTO;

public interface QnaService {

	public List<QnalistDTO> qnaList(QnaDTO dto) throws Exception;

	public int qnaInsert(QnaModel qm, HttpServletRequest request, MultipartFile multifile)throws Exception;

	public QnalistDTO qnaDetail(int qna_no )throws Exception;

	public int qnaDelete(int qna_no)throws Exception;

	public int qnaUpdate(QnaModel qm, HttpServletRequest request, MultipartFile multifile)throws Exception;

	public int insertComment(QnaCommentModel qcm) throws Exception;

	public int countQnaList(QnaDTO dto) throws Exception;
	
	//페이징
	//public int countqnalist(Map<String, Object> paramMap) throws Exception;
	
}
