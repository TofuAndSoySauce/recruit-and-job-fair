package kr.happyjob.study.userinfo.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.userinfo.model.CompanyMgtModel;

public interface CompanyMgtDao {
	public CompanyMgtModel companyMgtDetail(Map<String, Object> paramMap) throws Exception;

	public List<CompanyMgtModel> categorySelect() throws Exception;

	public List<CompanyMgtModel> companySizeSelect() throws Exception;

	public int companyMgtUpdate(Map<String, Object> paramMap) throws Exception;

	public int companyMgtNewUpdateFile(Map<String, Object> paramMap) throws Exception;

	/** **파일코드 테이블 ** **/
	/** 파일 코드 체크 코드생성 */
	public int filecdcheck(Map<String, Object> paramMap) throws Exception;

	/** 파일 저장 */
	public void filenewsave(Map<String, Object> paramMap) throws Exception;

	/** 파일 수정 */
	public void fileupdate(Map<String, Object> paramMap) throws Exception;
	
	//사업자번호 중복확인
	public int companyMgtCNumCount (Map<String, Object> paramMap) throws Exception;
	
}
