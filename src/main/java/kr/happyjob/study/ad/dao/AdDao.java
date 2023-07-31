package kr.happyjob.study.ad.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.happyjob.study.ad.model.AdModel;
import kr.happyjob.study.ad.model.AdQueryParam;
import kr.happyjob.study.ad.model.AdResponseDto;

public interface AdDao {
	
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
	public int resumeNewSaveFile(Map<String, Object> paramMap) throws Exception;
	
	// 파일 코드 체크
	public int fileCdCheck(Map<String, Object> paramMap) throws Exception; 
	
	// 파일 테이블에 저장
	public void fileNewSave(Map<String, Object> paramMap) throws Exception;
	
	// 채용공고 인서트 (파일 있음)
	public int adNewSaveFile(Map<String, Object> paramMap) throws Exception;
	
	// 채용공고 업데이트 (파일 있음)  
	public int adUpdateFile(Map<String, Object> paramMap) throws Exception;
	
	// 채용공고 업데이트시 기존의 파일이 존재하는 경우
	public void fileUpdate(Map<String, Object> paramMap) throws Exception;
		
	// 채용공고 업데이트시 기존의 파일이 없는 경우
	public void fileUpdateNewSave(Map<String, Object> paramMap) throws Exception;
	
	// 채용공고 재시작
	public void adRestart(Map<String, Object> paramMap) throws Exception;
	
	// 채용공고 공고취소  
	public void adCancel(Map<String, Object> paramMap) throws Exception;
	
	// 채용공고 모집완료
	public void adComplete(Map<String, Object> paramMap) throws Exception;
	
	List<AdResponseDto.Ad> list(@Param("queryParam") AdQueryParam queryParam);

	public Map<String, Object> adDetailForUser(Map<String, Object> paramMap);

}
