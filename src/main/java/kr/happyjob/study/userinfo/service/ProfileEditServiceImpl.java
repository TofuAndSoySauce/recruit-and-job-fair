package kr.happyjob.study.userinfo.service;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import kr.happyjob.study.userinfo.dao.ProfileEditDao;
import kr.happyjob.study.userinfo.model.ProfileEditModel;

@Service
public class ProfileEditServiceImpl implements ProfileEditService {
	// Set logger
		private final Logger logger = LogManager.getLogger(this.getClass());
		
		//파일 경로설정
		@Value("${fileUpload.profilePath}")
		private String profilePath;
		
		@Value("${fileUpload.rootPath}")
		private String rootPath;
		
		@Value("${fileUpload.logicalrootPath}")
		private String logicalrootPath;


	@Autowired
	ProfileEditDao profileEditDao;
	
	@Override
	public ProfileEditModel profileEditInfo(Map<String, Object> paramMap) throws Exception {
		return profileEditDao.profileEditInfo(paramMap);
	}
	@Override
	public List<ProfileEditModel> preferPosition() throws Exception {
		return profileEditDao.preferPosition();
	}
	@Override
	public List<ProfileEditModel> preferArea() throws Exception {
		return profileEditDao.preferArea();
	}
	//업데이트 파일
	@Override
	public int profileEditNewUpdateFile(Map<String, Object> paramMap, HttpServletRequest request,
			List<MultipartFile> multiFile) throws Exception {
		// 파일저장
				String itemFilePath = profilePath + File.separator; // 업로드 실제 경로 조립
																	// (무나열생성)
				// 실제 업로드 처리
				logger.info("   - multiFile.getOriginalFilename() : " + multiFile.get(0).getOriginalFilename());
				logger.info("	-paramMap : " + paramMap);
				
				//유저인포 테이블
				// 파일 유무에 따라 파일 저장 작업을 나눔
				if (multiFile.get(0).getOriginalFilename() == null || multiFile.get(0).getOriginalFilename() == "") {
					return profileEditDao.profileEditUpdate(paramMap);
				} else {
					
					// 파일을 가지고 있는지 확인
					String filecd = (String) paramMap.get("filecd");
					
					logger.info("filecd: "+ filecd);
					if(!"0".equals(filecd)){
						
						// 기존에 파일이 있었고, 새로운 파일로 update를 할 때
						ProfileEditModel ProfileEditDetail = profileEditDao.profileEditInfo(paramMap);
						File exitfiel = new File(ProfileEditDetail.getFile_madd());
						exitfiel.delete();
						
					} else {
						
						// 기존에 파일이 없었고, 새로운 파일을 추가할 때 파일코드추가
						int filec = profileEditDao.filecdcheck(paramMap);
						paramMap.put("filecd", filec);
					}
					
					// tb_file에 넣을 파라미터 추가
					for (int i = 0; i < multiFile.size(); i++) {
						
						String savefilename = this.uploadFile(rootPath + File.separator + itemFilePath,  multiFile.get(i).getOriginalFilename(), multiFile.get(i).getBytes());

						paramMap.put("file_name", multiFile.get(i).getOriginalFilename());
						paramMap.put("file_size", multiFile.get(i).getSize());
						paramMap.put("file_madd",
								rootPath + File.separator + itemFilePath + savefilename);
						paramMap.put("file_type", multiFile.get(i).getOriginalFilename()
								.substring(multiFile.get(i).getOriginalFilename().lastIndexOf(".") + 1));

						if (multiFile.get(i).getOriginalFilename() != null
								|| !multiFile.get(i).getOriginalFilename().equals("")) {
							paramMap.put("file_nadd",
									logicalrootPath + File.separator + itemFilePath + savefilename);
						} else {
							paramMap.put("file_nadd", null);
						}

						logger.info("   - paramMapImpl : " + paramMap);

						File finalsave = new File((String) paramMap.get("file_madd"));
						multiFile.get(i).transferTo(finalsave);
						
						//파일테이블처리
						if(!"0".equals(filecd)){
							// 기존에 파일이 있었고, 새로운 파일로 update를 할 때
							profileEditDao.fileupdate(paramMap);
						} else {
							// 기존에 파일이 없었고, 새로운 파일을 추가할 때
							profileEditDao.filenewsave(paramMap);
						}
					}

					logger.info("   - Dao paramMap : " + paramMap);
					return profileEditDao.profileEditUpdate(paramMap);
					}
		
	}
	/** 파일 중복명 제거 */
	private String uploadFile(String fullpath, String originalName, byte[] fileData) throws Exception{
		UUID uuid = UUID.randomUUID();
		String savedName = uuid.toString()+"_"+originalName;
		
		File target = new File(fullpath, savedName);
		
		FileCopyUtils.copy(fileData, target);
		
		return savedName;
	}

}
