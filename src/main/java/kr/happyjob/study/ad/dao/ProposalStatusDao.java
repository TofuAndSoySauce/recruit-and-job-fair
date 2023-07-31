package kr.happyjob.study.ad.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.ad.model.ProposalStatusModel;
import kr.happyjob.study.resume.model.ResumeModel;

public interface ProposalStatusDao {
	
	// 이력서 조회 함수
	public List<ProposalStatusModel> resumeList(Map<String, Object> paramMap) throws Exception;
	
	// 이력서 총건 구하는 함수
	public int countResumeList(Map<String, Object> paramMap) throws Exception;
	
	// 면접 일자 신청 함수
	public int joboffer(Map<String, Object> paramMap) throws Exception;
	
	// 이력서 열람 기업 등록 함수
	public int resumeHistory(Map<String, Object> paramMap);
	
	// 면접 취소 보내기
	public int jobcancle(Map<String, Object> paramMap);
	
	// 업체 열람 조회
	public Map<String, Object> resumeHistoryList(Map<String, Object> paramMap);
	
	// 이력서 상세 보기 및 히스토리 번호 보기
	public Map<String, Object> resumeDetail(Map<String, Object> paramMap);

	// 면접 제의 번호 구하기 함수
	public Map<String, Object> proposalno(Map<String, Object> paramMap);
	
	// 히스토리 번호 구하기 함수
	public int historyno(Map<String, Object> paramMap);
	
	// 면접 제안 신청 상태 조회
	public List<ProposalStatusModel> ProposStatus(Map<String, Object> paramMap);
	
	// 면접 제안 신청 상태 전체 건수 조회
	public int countProposStatus(Map<String, Object> paramMap);
	
}