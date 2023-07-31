package kr.happyjob.study.userinfo.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import kr.happyjob.study.userinfo.model.ProfileEditModel;

public interface ProfileEditService {
	public ProfileEditModel profileEditInfo(Map<String, Object> paramMap) throws Exception;

	public List<ProfileEditModel> preferPosition() throws Exception;

	public List<ProfileEditModel> preferArea() throws Exception;

	public int profileEditNewUpdateFile(Map<String, Object> paramMap, HttpServletRequest request,
			List<MultipartFile> multiFile) throws Exception;
}
