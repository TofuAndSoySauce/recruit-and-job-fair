package kr.happyjob.study.login.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.login.model.KakaoProfile;
import kr.happyjob.study.login.model.LgnInfoModel;
import kr.happyjob.study.login.model.UserInfo;
import kr.happyjob.study.login.model.UsrMnuAtrtModel;
import kr.happyjob.study.login.model.UsrMnuChildAtrtModel;


public interface LoginDao {
	
	/** 사용자 로그인 체크*/
	public String checkLogin(Map<String, Object> paramMap);
	
	/** 사용자 로그인 */
	public LgnInfoModel selectLogin(Map<String, Object> paramMap);
	
	/**  사용자 메뉴 권한 */
	public List<UsrMnuAtrtModel> listUsrMnuAtrt(Map<String, Object> paramMap);
	
	/**  사용자 자식 메뉴 권한 */
	public List<UsrMnuChildAtrtModel> listUsrChildMnuAtrt(Map<String, Object> paramMap);
	
	/** 사용자 ID 찾기 */
	public LgnInfoModel selectFindId(Map<String, Object> paramMap);

	/** 사용자 PW 찾기 */
	public LgnInfoModel selectFindPw(Map<String, Object> paramMap);
	
	/** 사용자 PW 찾기 ID 체크*/
	public LgnInfoModel registerIdCheck(Map<String, Object> paraMap);

	/** 사용자 회원가입*/
	public int registerUser(Map<String, Object> paramMap);
	
	/** 사용자스킬*/
	public int registerUser_skill(Map<String, Object> paramMap);
	
	/**loginID 중복체크*/
	public int check_loginID(LgnInfoModel model);
	
	/**이메일 중복체크*/
	public int check_email(LgnInfoModel model);
	
	/*소셜로그인 사용자 확인*/
	public UserInfo findById(String string);
	
	/*소셜로그인 회원가입*/
	public int addUser(Map<String, Object> param); 
	
}
