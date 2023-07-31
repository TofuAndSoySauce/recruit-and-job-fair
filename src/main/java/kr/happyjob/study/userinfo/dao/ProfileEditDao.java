package kr.happyjob.study.userinfo.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.userinfo.model.ProfileEditModel;

public interface ProfileEditDao {

	public ProfileEditModel profileEditInfo(Map<String, Object> paramMap) throws Exception;
	public int profileEditUpdate(Map<String, Object> paramMap) throws Exception;
	public int profileEditNewUpdateFile(Map<String, Object> paramMap) throws Exception;

	//셀렉트박스
	public List<ProfileEditModel> preferPosition() throws Exception;

	public List<ProfileEditModel> preferArea() throws Exception;

	//file 테이블
	public int filecdcheck(Map<String, Object> paramMap) throws Exception;

	public void fileupdate(Map<String, Object> paramMap) throws Exception;

	public void filenewsave(Map<String, Object> paramMap) throws Exception;


}
