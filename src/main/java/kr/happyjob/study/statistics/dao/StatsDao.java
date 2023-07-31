package kr.happyjob.study.statistics.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.community.model.NoticeModel;
import kr.happyjob.study.statistics.model.StatsModel;

public interface StatsDao {
	
	//public int noticenewsave(Map<String, Object> paramMap) throws Exception;
	//public int noticeupdate(Map<String, Object> paramMap) throws Exception;
	//public int noticedelete(Map<String, Object> paramMap) throws Exception;

	// 기업별
	public List<StatsModel> statslist(Map<String, Object> paramMap) throws Exception;
	public int countstatslist(Map<String, Object> paramMap) throws Exception;
	// 기업별 선호도
	public List<StatsModel> statscol(Map<String, Object> paramMap3) throws Exception;
	// 기업별 연령대&성별
	public List<StatsModel> statsbar(Map<String, Object> paramMap4) throws Exception;
	// 기업별 연령대&성별 상세
	public List<StatsModel> statsbar2(Map<String, Object> paramMap7) throws Exception;
	// ------------------------------------------------------------------------------------------------------------------
	// 박람회별
	public List<StatsModel> statslist2(Map<String, Object> paramMap2) throws Exception;
	public int countstatslist2(Map<String, Object> paramMap2) throws Exception;
	// 박람회별 개인 성별
	public List<StatsModel> statspie1(Map<String, Object> paramMap5) throws Exception;
	// 박람회별 개인 성별 상세
	public List<StatsModel> statspie1_2(Map<String, Object> paramMap8) throws Exception;
	// 박람회별 기업 규모
	public List<StatsModel> statspie2(Map<String, Object> paramMap6) throws Exception;
	// 박람회별 기업 규모 상세
	public List<StatsModel> statspie2_2(Map<String, Object> paramMap9) throws Exception;
	//public int pluswatch(Map<String, Object> paramMap) throws Exception;

	/** 공지사항 파일 저장 */
	//public int noticefilenewsave(Map<String, Object> paramMap) throws Exception;

	/* 곻지사항 수정 */
	//public int noticenewupdatefile(Map<String, Object> paramMap) throws Exception;

	/** 파일 코드 체크 */
	//public int filecdcheck(Map<String, Object> paramMap) throws Exception;

	/** 파일 저장 */
	//public void filenewsave(Map<String, Object> paramMap) throws Exception;

	/** 파일 수정 */
	//public void fileupdate(Map<String, Object> paramMap) throws Exception;

}
