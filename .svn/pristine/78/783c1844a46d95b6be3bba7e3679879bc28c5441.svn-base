package kr.happyjob.study.resume.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import kr.happyjob.study.resume.model.ResumeHistoryModel;
import kr.happyjob.study.resume.model.ResumeModel;
import kr.happyjob.study.resume.model.ResumeQueryParam;
import kr.happyjob.study.resume.model.ResumeRequestDto.Post;
import kr.happyjob.study.resume.model.ResumeSubmitModel;
import kr.happyjob.study.resume.model.ResumeSubmitModelForUser;

public interface ResumeService {
	
	// 이력서 인서트 (파일 없음)
	public int resumeNewSave(Map<String, Object> paramMap) throws Exception;
	
	// 이력서 리스트 불러오기
	public List<ResumeModel> resumeList(Map<String, Object> paramMap) throws Exception;
	
	// 이력서 상세보기 초기화
	public Map<String, Object> resumeDetail(Map<String, Object> paramMap) throws Exception;
	
	// 이력서 인적사항 초기화
	public Map<String, Object> userDetail(Map<String, Object> paramMap) throws Exception;
	
	// 이력서 업데이트 (파일 없음)
	public int resumeUpdate(Map<String, Object> paramMap) throws Exception;
	
	// 이력서 딜리트
	public int resumeDelete(Map<String, Object> paramMap) throws Exception;
	
	// 이력서 리스트 카운트
	public int countResumeList(Map<String, Object> paramMap) throws Exception;
	
	// 이력서 인서트 (파일 있음)
	public int resumeNewSaveFile(Map<String, Object> paramMap, HttpServletRequest request, List<MultipartFile> multiFile) throws Exception;
	
	// 이력서 업데이트 (파일 있음)  
	public int resumeUpdateFile(Map<String, Object> paramMap, HttpServletRequest request, List<MultipartFile> multiFile) throws Exception;
	
	// 이력서 제출
	int submit(Post post);
	
	// 지원현황 조회
	List<ResumeSubmitModelForUser> getSubmitList(ResumeQueryParam param);
	
	// 이력서 열람 기업
	public List<Map<String, Object>> resumeHistoryList(Map<String, Object> paramMap) throws Exception;
	
	// 이력서 열람 기업 카운트
	public int countResumeHistoryList(Map<String, Object> paramMap) throws Exception;
		
	// 이력서 상세 
	public Map<String, Object> resumeDetailForInterview(Map<String, Object> paramMap);
	
}
