package kr.happyjob.study.userinfo.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import kr.happyjob.study.userinfo.model.CompanyMgtModel;

public interface CompanyMgtService {
	/* 기업정보수정 페이지 */
	public CompanyMgtModel companyMgtDetail(Map<String, Object> paramMap) throws Exception;
	public List<CompanyMgtModel> categorySelect() throws Exception;
	public List<CompanyMgtModel> companySizeSelect() throws Exception;

	/* 업데이트 */
	public int companyMgtUpdate(Map<String, Object> paramMap) throws Exception;
	public int companyMgtNewUpdateFile(Map<String, Object> paramMap, HttpServletRequest request,
			List<MultipartFile> multiFile) throws Exception;

	
	/* 사업자등록번호 카운트 조회 */
	public int companyMgtCNumCount(Map<String, Object> paramMap) throws Exception;
	
}
