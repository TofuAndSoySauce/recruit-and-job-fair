package kr.happyjob.study.community.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.community.model.CommunityCommentModel;
import kr.happyjob.study.community.model.CommunityModel;

public interface CommunityDao {

	// 커뮤니티 리스트
	List<CommunityModel> communitylist(Map<String, Object> paramMap)throws Exception;
	// 페이징
	int countcommunitylist(Map<String, Object> paramMap)throws Exception;
	// 조회수
	int hit(Map<String, Object> paramMap)throws Exception;
	// 상세보기
	CommunityModel communitydetail(Map<String, Object> paramMap)throws Exception;
	// 등록
	int communitynewsave(Map<String, Object> paramMap)throws Exception;
	// 수정
	int communityupdate(Map<String, Object> paramMap)throws Exception;
	// 삭제
	int communitydelete(Map<String, Object> paramMap)throws Exception;
	// 등록+파일
	int communitynewsavefile(Map<String, Object> paramMap)throws Exception;
	// 파일 코드 체크
	int filecdcheck(Map<String, Object> paramMap)throws Exception;
	// 파일 저장
	void filenewsave(Map<String, Object> paramMap)throws Exception;
	// 등록+파일
	int communityfilenewsave(Map<String, Object> paramMap)throws Exception;
	// 수정+파일
	int communityupdatefile(Map<String, Object> paramMap)throws Exception;
	// 파일 수정
	void fileupdate(Map<String, Object> paramMap)throws Exception;
	
	// 커뮤니티 답글 리스트
	List<CommunityCommentModel> communitycommentlist(Map<String, Object> paramMap);
	// 답글 페이징
	int countcommentlist(Map<String, Object> paramMap);
	// 답글 등록
	int commetnnewsave(Map<String, Object> paramMap);
	// 답글 수정
	int commentupdate(Map<String, Object> paramMap);
	// 답글 삭제
	int commentdelete(Map<String, Object> paramMap);
	
	
	
	
}
