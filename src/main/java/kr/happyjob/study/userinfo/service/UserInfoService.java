package kr.happyjob.study.userinfo.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import kr.happyjob.study.ad.model.AdModel;

public interface UserInfoService {
	
	// 채용공고 리스트 불러오기
	public List<AdModel> adList(Map<String, Object> paramMap) throws Exception;
		
	// 채용공고 상세보기 초기화
	public Map<String, Object> adDetail(Map<String, Object> paramMap) throws Exception;
		
	// 채용공고 수락 
	public void acceptAd(Map<String, Object> paramMap) throws Exception;
	
	// 채용공고 반려 
	public void cancelAd(Map<String, Object> paramMap) throws Exception;
	
	// 채용공고 리스트 카운트
	public int countAdList(Map<String, Object> paramMap) throws Exception;
		
}
