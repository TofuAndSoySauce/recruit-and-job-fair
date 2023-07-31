package kr.happyjob.study.userinfo.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import kr.happyjob.study.userinfo.model.MailModel;

public interface MailService {

	// 메일 보내기 함수
	public int sendMailFile(Map<String, Object> paramMap, HttpServletRequest request, List<MultipartFile> multiFile) throws Exception;
	
	// 보낸 메일함 총 데이터 구하는 함수
	public int countSendMailList(Map<String, Object> paramMap) throws Exception;
	
	// 보낸 메일함 조회 함수
	public List<MailModel> sendMailList(Map<String, Object> paramMap) throws Exception;
	
	// 받은 메일함 총 데이터 구하는 함수
	public int countReceMailList(Map<String, Object> paramMap) throws Exception;
	
	// 보낸 메일함 검색어가 있는 상태에서 페이지네이션을 클릭시 아무런 변화가 없어야 한다 (검색이 안되야 한다)
	public List<MailModel> noChangeSendMail(Map<String, Object> paramMap) throws Exception;
	
	// 보낸 메일함 검색어가 있는 상태에서 페이지네이션을 클릭시 아무런 변화가 없어야 한다 (검색이 안되야 한다) 총 데이터 구하는 함수
	public int noChangeCountSendMailList(Map<String, Object> paramMap) throws Exception;
		
	// 받은 메일함 조회 함수
	public List<MailModel> receMailList(Map<String, Object> paramMap) throws Exception;
	
	// 보낸 메일함 상세 보기 (제목을 클릭시) 함수
	public MailModel sendMailDetail(Map<String, Object> paramMap) throws Exception;
	
	// 보낸 메일함 상세 보기 (제목을 클릭시) 함수
	public MailModel Recemaildetail(Map<String, Object> paramMap) throws Exception;
	
	// 메일함 업데이트 (읽은 날짜, 수신 여부) 함수
	public int mailUpdate(Map<String, Object> paramMap) throws Exception;
	
	// 메일함 업데이트 (읽은 날짜, 수신 여부) 함수
	public int deleteMail(Map<String, Object> paramMap) throws Exception;
	
	// 메일 아이디 비교
	public int checkId(Map<String, Object> paramMap);

}