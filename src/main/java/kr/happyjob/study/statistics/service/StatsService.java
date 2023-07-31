package kr.happyjob.study.statistics.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import kr.happyjob.study.statistics.model.StatsModel;

public interface StatsService {
		
		// 기업별 통계 게시판
		public List<StatsModel> statslist(Map<String, Object> paramMap) throws Exception;
		public int countstatslist(Map<String, Object> paramMap) throws Exception;
		// 기업별 선호도		
		public List<StatsModel> statscol(Map<String, Object> paramMap) throws Exception;
		// 기업별 연령대&성별
		public List<StatsModel> statsbar(Map<String, Object> paramMap) throws Exception;
		// 기업별 연령대&성별 상세
		public List<StatsModel> statsbar2(Map<String, Object> paramMap) throws Exception;
		// -------------------------------------------------------------------------------------------------------------
		// 박람회별 게시판
		public List<StatsModel> statslist2(Map<String, Object> paramMap) throws Exception;
		public int countstatslist2(Map<String, Object> paramMap) throws Exception;
		// 박람회별 개인 성별
		public List<StatsModel> statspie1(Map<String, Object> paramMap) throws Exception;
		// 박람회별 개인 성별 상세
		public List<StatsModel> statspie1_2(Map<String, Object> paramMap) throws Exception;
		// 박람회별 기업 규모
		public List<StatsModel> statspie2(Map<String, Object> paramMap) throws Exception;
		// 박람회별 기업 규모 상세
		public List<StatsModel> statspie2_2(Map<String, Object> paramMap) throws Exception;
}
