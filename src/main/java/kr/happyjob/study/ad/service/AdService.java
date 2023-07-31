package kr.happyjob.study.ad.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import kr.happyjob.study.ad.model.AdModel;
import kr.happyjob.study.ad.model.AdQueryParam;
import kr.happyjob.study.ad.model.AdResponseDto;

public interface AdService {
	
	// 채용공고 인서트 (파일 없음)
	public int adNewSave(Map<String, Object> paramMap) throws Exception;
	
	// 채용공고 리스트 불러오기
	public List<AdModel> adList(Map<String, Object> paramMap) throws Exception;
	
	// 채용공고 상세보기 초기화
	public Map<String, Object> adDetail(Map<String, Object> paramMap) throws Exception;
	
	// 채용공고 인적사항 초기화
	public Map<String, Object> userDetail(Map<String, Object> paramMap) throws Exception;
	
	// 채용공고 리스트 카운트
	public int countAdList(Map<String, Object> paramMap) throws Exception;
	
	// 채용공고 업데이트 (파일 없음)
	public int adUpdate(Map<String, Object> paramMap) throws Exception;
		
	// 채용공고 딜리트
	public int adDelete(Map<String, Object> paramMap) throws Exception;
		
	// 채용공고 인서트 (파일 있음)
	public int adNewSaveFile(Map<String, Object> paramMap, HttpServletRequest request, List<MultipartFile> multiFile) throws Exception;
	
	// 채용공고 업데이트 (파일 있음)  
	public int adUpdateFile(Map<String, Object> paramMap, HttpServletRequest request, List<MultipartFile> multiFile) throws Exception;
		
	// 채용공고 재시작
	public void adRestart(Map<String, Object> paramMap) throws Exception;
	
	// 채용공고 공고취소  
	public void adCancel(Map<String, Object> paramMap) throws Exception;
	
	// 채용공고 모집완료
	public void adComplete(Map<String, Object> paramMap) throws Exception;
	
	List<AdResponseDto.Ad> getList(AdQueryParam queryParam);

	Map<String, Object> adDetailForUser(Map<String, Object> paramMap) throws Exception;

}
