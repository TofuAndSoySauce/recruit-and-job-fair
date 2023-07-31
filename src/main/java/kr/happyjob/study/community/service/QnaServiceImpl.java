package kr.happyjob.study.community.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import kr.happyjob.study.community.dao.QnaDao;
import kr.happyjob.study.community.model.NoticeModel;
import kr.happyjob.study.community.model.QnaCommentModel;
import kr.happyjob.study.community.model.QnaDTO;
import kr.happyjob.study.community.model.QnaModel;
import kr.happyjob.study.community.model.QnalistDTO;

@Service
public class QnaServiceImpl implements QnaService {

	private QnaDao dao;

	@Value("${fileUpload.qnaPath}")
	private String qnaPath;
	
	@Value("${fileUpload.rootPath}")
	private String rootPath;
	
	@Value("${fileUpload.logicalrootPath}")
	private String logicalrootPath;
	
	
	@Autowired
	public QnaServiceImpl(QnaDao dao) {
		super();
		this.dao = dao;
	}


	@Override
	public List<QnalistDTO> qnaList(QnaDTO dto) throws Exception {
		return dao.qnaList(dto);
	}


	@Override
	public int qnaInsert(QnaModel qm, HttpServletRequest request, MultipartFile multifile) throws Exception {
		//파일이 비어있지 않을 경우에만 파일 저장
		if(multifile.getOriginalFilename() != null && !multifile.getOriginalFilename().equals("") ) {
			String itemFilePath = qnaPath + File.separator;
			
			//file 시퀀스 체크
			int filecd = dao.fileCdCheck();
			String saveFileName = this.uploadFile(rootPath + File.separator + itemFilePath, multifile.getOriginalFilename(), multifile.getBytes());
			
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("file_cd", filecd);
			paramMap.put("file_name", multifile.getOriginalFilename());
			paramMap.put("file_size", multifile.getSize());
			String file_madd = rootPath + File.separator + itemFilePath + saveFileName;
			paramMap.put("file_madd", file_madd);
			paramMap.put("file_type", multifile.getOriginalFilename().substring(multifile.getOriginalFilename().lastIndexOf(".") + 1));
			paramMap.put("file_nadd", logicalrootPath + File.separator + itemFilePath + saveFileName);

			File finalsave = new File(file_madd);
			multifile.transferTo(finalsave);
			
			//qna 테이블 저장용
			qm.setFile_cd(filecd);
			
			dao.qnaFileInsert(paramMap);
		}
		
		int insertResult = dao.qnaInsert(qm);		
		
		return insertResult;
	}


	@Override
	public QnalistDTO qnaDetail(int qna_no)throws Exception {
		return dao.qnaDetail(qna_no); 
	}


	@Override
	public int qnaDelete(int qna_no) throws Exception {
		return dao.qnaDelete(qna_no);
	}

	@Override
	public int qnaUpdate(QnaModel qm, HttpServletRequest request, MultipartFile multifile) throws Exception {
		
		//파일이 비어있지 않을 경우에만 파일 저장
		if(multifile.getOriginalFilename() != null && !multifile.getOriginalFilename().equals("") ) {
			// 파일을 가지고 있는지 확인
			int filecd = qm.getFile_cd();

			int updateFileCd = 0;
			
			if(filecd != 0){
				// 기존에 파일이 있었고, 새로운 파일로 update를 할 때
				QnalistDTO qnaDetail = this.qnaDetail(qm.getQna_no());
				File exitfiel = new File(qnaDetail.getFile_madd());
				exitfiel.delete();
				updateFileCd = qnaDetail.getFile_cd();
			} else {
				// 기존에 파일이 없었고, 새로운 파일을 추가할 때
				int newFileCd = dao.fileCdCheck();
				updateFileCd = newFileCd;
			}
			
			String itemFilePath = qnaPath + File.separator;
			
			String saveFileName = this.uploadFile(rootPath + File.separator + itemFilePath, multifile.getOriginalFilename(), multifile.getBytes());
			
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("file_cd", updateFileCd);
			paramMap.put("file_name", multifile.getOriginalFilename());
			paramMap.put("file_size", multifile.getSize());
			String file_madd = rootPath + File.separator + itemFilePath + saveFileName;
			paramMap.put("file_madd", file_madd);
			paramMap.put("file_type", multifile.getOriginalFilename().substring(multifile.getOriginalFilename().lastIndexOf(".") + 1));
			paramMap.put("file_nadd", logicalrootPath + File.separator + itemFilePath + saveFileName);

			File finalsave = new File(file_madd);
			multifile.transferTo(finalsave);
			
			if(filecd != 0){
				// 기존에 파일이 있었고, 새로운 파일로 update를 할 때
				dao.qnaFileUpdate(paramMap);
			} else {
				// 기존에 파일이 없었고, 새로운 파일을 추가할 때
				dao.qnaFileInsert(paramMap);
			}
			//qna 테이블에 저장용
			qm.setFile_cd(updateFileCd);
		}
		return dao.qnaUpdate(qm);
	}


	@Override
	public int insertComment(QnaCommentModel qcm) throws Exception {
		//한개의 번호가 댓글 가능하게끔 구현(중복x)
		/*qna_no로 qna_comment 테이블을 조회 (List로)
		 * 리스트 값이 0보다 크면 댓글이 있는거니까 update
		 * 아니라면 댓글이 없는거니까 기존 insert
		 * */
		List<QnaCommentModel> list = dao.searchComment(qcm);
		
		System.out.println(list.size());
		
		if(list.size()>0){
			return dao.updateComment(qcm);
		}else{
			//답변여부 분기처리
			dao.qnaAnswer(qcm);
			return dao.insertComment(qcm);
		}
		
	}


	@Override
	public int countQnaList(QnaDTO dto) throws Exception {
		return dao.countQnaList(dto);
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
