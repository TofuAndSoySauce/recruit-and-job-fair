package kr.happyjob.study.fair.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import kr.happyjob.study.fair.model.FairCreationModel;

public interface FairCreationService {

	public int fairSave(Map<String, Object> paramMap) throws Exception;

	// 파일 저장
	public int fairNewSaveFile(Map<String, Object> paramMap, HttpServletRequest request, List<MultipartFile> multiFile) throws Exception;
	
	public int fairUpdate(Map<String, Object> paramMap) throws Exception;
	
	public int fairDelete(Map<String, Object> paramMap) throws Exception;

	public List<FairCreationModel> creationlist(Map<String, Object> paramMap) throws Exception;
	
	public int countcreationlist (Map<String, Object> paramMap) throws Exception;
	
	public int updateIsDelete(Map<String, Object> paramMap) throws Exception;
	
	
}
