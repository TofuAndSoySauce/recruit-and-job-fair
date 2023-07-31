package kr.happyjob.study.resume.service;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import kr.happyjob.study.resume.dao.ResumeDao;
import kr.happyjob.study.resume.model.ResumeModel;
import kr.happyjob.study.resume.model.ResumeQueryParam;
import kr.happyjob.study.resume.model.ResumeRequestDto.Post;
import kr.happyjob.study.resume.model.ResumeSubmitModel;
import kr.happyjob.study.resume.model.ResumeSubmitModelForUser;

@Service
public class ResumeServiceImpl implements ResumeService {
	
	@Autowired
	ResumeDao resumeDao;
	
	@Value("${fileUpload.noticePath}")
	private String resumePath;
	
	@Value("${fileUpload.rootPath}")
	private String rootPath;
	
	@Value("${fileUpload.logicalrootPath}")
	private String logicalrootPath;
	
	
	private final Logger logger = Logger.getLogger(this.getClass());

	// 이력서 인서트 (파일 없는 경우만 가능)
	@Override
	public int resumeNewSave(Map<String, Object> paramMap) throws Exception {
		return resumeDao.resumeNewSave(paramMap);
	}

	// 이력서 리스트 불러오기
	@Override
	public List<ResumeModel> resumeList(Map<String, Object> paramMap) throws Exception {
		return resumeDao.resumeList(paramMap);
	}

	// 이력서 상세보기 초기화
	@Override
	public Map<String, Object> resumeDetail(Map<String, Object> paramMap) throws Exception {
		return resumeDao.resumeDetail(paramMap);
	}

	// 이력서 인적사항 초기화
	@Override
	public Map<String, Object> userDetail(Map<String, Object> paramMap) throws Exception {
		return resumeDao.userDetail(paramMap);
	}

	// 이력서 업데이트 (파일 없는 경우만 가능)
	@Override
	public int resumeUpdate(Map<String, Object> paramMap) throws Exception {
		return resumeDao.resumeUpdate(paramMap);
	}

	// 이력서 딜리트
	@Override
	public int resumeDelete(Map<String, Object> paramMap) throws Exception {
		return resumeDao.resumeDelete(paramMap);
	}

	// 이력서 리스트 카운트
	@Override
	public int countResumeList(Map<String, Object> paramMap) throws Exception {
		return resumeDao.countResumeList(paramMap);
	}
	
	// 이력서 인서트 (파일 없을 때, 있을 때 모두 가능)
	@Override
	public int resumeNewSaveFile(Map<String, Object> paramMap, HttpServletRequest request,
			List<MultipartFile> multiFile) throws Exception {
		
		String itemFilePath = resumePath + File.separator; 

		// 첨부 파일이 없는 경우
		if (multiFile.get(0).getOriginalFilename() == null || multiFile.get(0).getOriginalFilename() == "") {
			return resumeDao.resumeNewSave(paramMap);
		}
		// 첨부 파일이 있는 경우
		else {
			int filec = resumeDao.fileCdCheck(paramMap);
			paramMap.put("filec", filec);
			paramMap.put("filecd", filec);

			for (int i = 0; i < multiFile.size(); i++) {
				
				// UUID가 추가된 이름으로 파일이 저장된 후 해당 파일의 이름을 반환하여 변수에 대입한다.
				String saveFileName = this.uploadFile(rootPath + File.separator + itemFilePath,  multiFile.get(0).getOriginalFilename(), multiFile.get(0).getBytes());
				
				// 파일로부터 데이터를 가져와 DB에 저장할 파일의 이름, 용량, 물리주소, 가상주소, 파일 타입을 Map에 넣는다.
				paramMap.put("file_name", multiFile.get(i).getOriginalFilename());
				paramMap.put("file_size", multiFile.get(i).getSize());
				paramMap.put("file_madd", rootPath + File.separator + itemFilePath + saveFileName);
				paramMap.put("file_type", multiFile.get(i).getOriginalFilename().substring(multiFile.get(i).getOriginalFilename().lastIndexOf(".") + 1));
				
				// 파일 이름을 입력한 경우
				if (multiFile.get(i).getOriginalFilename() != null || !multiFile.get(i).getOriginalFilename().equals("")) {
					paramMap.put("file_nadd", logicalrootPath + File.separator + itemFilePath + saveFileName);
				}
				// 파일 이름을 입력하지 않은 경우
				else {
					paramMap.put("file_nadd", null);
				}
				
				// uploadFile() 메서드에서 미리 생성한 File 객체를 불러온 후 finalSave 변수에 대입한다.
				File finalSave = new File((String) paramMap.get("file_madd"));
				// 그 후 File 객체에게 실제로 등록된 파일을 넣어 생성한다.
				multiFile.get(i).transferTo(finalSave);
				
				// File DB에 등록되는 파일과 관련된 데이터를 저장한다.
				resumeDao.fileNewSave(paramMap);
				
			}
			
			return resumeDao.resumeNewSaveFile(paramMap);
			
		}

	}

	
	// 이력서 업데이트  (파일 없을 때, 있을 때 모두 가능)
	@Override
	public int resumeUpdateFile(Map<String, Object> paramMap, HttpServletRequest request, List<MultipartFile> multiFile)
			throws Exception {
		
		String itemFilePath = resumePath + File.separator;
		
		// 첨부 파일이 없는 경우
		if (multiFile.get(0).getOriginalFilename() == null || multiFile.get(0).getOriginalFilename() == "") {
			return resumeDao.resumeUpdate(paramMap);
		}
		// 첨부 파일이 있는 경우
		else {
			
			String filecd = (String) paramMap.get("filecd");
	
			// 기존의 첨부파일이 존재하는 경우 
			if(!"".equals(filecd)){
				
				// 기존 첨부파일을 삭제한다.
				Map<String, Object> resumeDetail = resumeDao.resumeDetail(paramMap);
				File exitfiel = new File((String)resumeDetail.get("file_madd"));
				exitfiel.delete();
				
			}
			// 기존의 첨부파일이 없는 경우
			else {
				
				// 새롭게 업데이트할 첨부파일에게 부여할 file_cd를 생성한다.
				int filec = resumeDao.fileCdCheck(paramMap);
				paramMap.put("filecd", filec);
				
			}
			
			for (int i = 0; i < multiFile.size(); i++) {
				
				// UUID가 추가된 이름으로 파일이 저장된 후 해당 파일의 이름을 반환하여 변수에 대입한다.
				String saveFileName = this.uploadFile(rootPath + File.separator + itemFilePath,  multiFile.get(0).getOriginalFilename(), multiFile.get(0).getBytes());
				
				// 파일로부터 데이터를 가져와 DB에 저장할 파일의 이름, 용량, 물리주소, 가상주소, 파일 타입을 Map에 넣는다.
				paramMap.put("file_name", multiFile.get(i).getOriginalFilename());
				paramMap.put("file_size", multiFile.get(i).getSize());
				paramMap.put("file_madd", rootPath + File.separator + itemFilePath + saveFileName);
				paramMap.put("file_type", multiFile.get(i).getOriginalFilename().substring(multiFile.get(i).getOriginalFilename().lastIndexOf(".") + 1));
				
				// 파일 이름을 입력한 경우
				if (multiFile.get(i).getOriginalFilename() != null || !multiFile.get(i).getOriginalFilename().equals("")) {
					paramMap.put("file_nadd", logicalrootPath + File.separator + itemFilePath + saveFileName);
				}
				// 파일 이름을 입력하지 않은 경우
				else {
					paramMap.put("file_nadd", null);
				}
				
				// uploadFile() 메서드에서 미리 생성한 File 객체를 불러온 후 finalSave 변수에 대입한다.
				File finalSave = new File((String) paramMap.get("file_madd"));
				// 그 후 File 객체에게 실제로 등록된 파일을 넣어 생성한다.
				multiFile.get(i).transferTo(finalSave);
				
				// 기존에 파일을 삭제하고 그 파일이 사용하던 file_cd를 새 파일에 부여한다.
				if(!"".equals(filecd)){
					resumeDao.fileUpdate(paramMap);
				} 
				// 기존에 파일이 없는 경우 새로운 file_cd를 새 파일에 부여하여 저장한다.
				else {
					resumeDao.fileUpdateNewSave(paramMap);
				}
		
			}

			return resumeDao.resumeUpdateFile(paramMap);

		}

	}
	
	
	// 파일 중복명 제거 
	private String uploadFile(String fullpath, String originalName, byte[] fileData) throws Exception{
		
		UUID uuid = UUID.randomUUID();
		String savedName = uuid.toString()+"_"+originalName;
		
		// 첫 번째 파라미터의 객체 폴더 안에 두 번째 파라미터라는 파일에 대한 File 객체를 생성한다.
		File target = new File(fullpath, savedName);
		
		// 첫 번째 파라미터에 들어간 파일을 복사한 후, 두 번째 파라미터에 들어간 File 객체에게 저장한다.
		FileCopyUtils.copy(fileData, target);
		
		return savedName;
	}

	
	// 이력서 열람 기업
	@Override
	public List<Map<String, Object>> resumeHistoryList(Map<String, Object> paramMap) throws Exception {

		return resumeDao.resumeHistoryList(paramMap);
	}

	// 이력서 제출
	@Override
	@Transactional
	public int submit(Post post) {
		
		Optional<ResumeSubmitModelForUser> optional = Optional.ofNullable(resumeDao.getOneByResumeAndAdNo(post));
		verifyAlreadyExists(optional);
		
		return resumeDao.saveSubmit(post);
	}
	// 이력서 열람 기업 카운트
	@Override
	public int countResumeHistoryList(Map<String, Object> paramMap) throws Exception {
		return resumeDao.countResumeHistoryList(paramMap);
	}

	private void verifyAlreadyExists(Optional<ResumeSubmitModelForUser> optionalResume){
		optionalResume.ifPresent(resume -> {
		    throw new RuntimeException(
		        String.format("이미 지원한 이력이 있습니다. resumeNo: %s, adNo: %s",
		            resume.getResumeNo(), resume.getAdNo())
		    );
		});
	}

	@Override
	public List<ResumeSubmitModelForUser> getSubmitList(ResumeQueryParam param) {
		return resumeDao.getSubmitList(param);
	}

	@Override
	public Map<String, Object> resumeDetailForInterview(Map<String, Object> paramMap) {
		return resumeDao.resumeDetailForInterview(paramMap);
	}
	
}
