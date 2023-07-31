package kr.happyjob.study.community.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.community.model.QnaCommentModel;
import kr.happyjob.study.community.model.QnaDTO;
import kr.happyjob.study.community.model.QnaModel;
import kr.happyjob.study.community.model.QnalistDTO;

public interface QnaDao {

	public List<QnalistDTO> qnaList(QnaDTO dto) throws Exception;

	public int qnaInsert(QnaModel qm)throws Exception;

	public QnalistDTO qnaDetail(int qna_no)throws Exception;

	public int qnaDelete(int qna_no)throws Exception;

	public int qnaUpdate(QnaModel qm)throws Exception;

	public int insertComment(QnaCommentModel qcm)throws Exception;

	//댓글 중복
	public List<QnaCommentModel> searchComment(QnaCommentModel qcm)throws Exception;

	public int updateComment(QnaCommentModel qcm)throws Exception;

	public void qnaAnswer(QnaCommentModel qcm)throws Exception;

	public int countQnaList(QnaDTO dto) throws Exception;

	public int fileCdCheck() throws Exception;

	public int qnaFileInsert(Map<String, Object> paramMap) throws Exception;

	public void qnaFileUpdate(Map<String, Object> paramMap) throws Exception;
	
	//public int countqnalist(Map<String, Object> paramMap) throws Exception;

	
	
	
}
