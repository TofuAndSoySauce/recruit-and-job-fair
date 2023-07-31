package kr.happyjob.study.fair.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.fair.model.JobFairBoothMgtModel;

public interface JobFairBoothMgtDao {

	JobFairBoothMgtModel jobFairBoothMgtDetail(Map<String, Object> paramMap);

	int countJobFairBoothMgtList(Map<String, Object> paramMap);

	List<JobFairBoothMgtModel> jobFairBoothMgtList(Map<String, Object> paramMap);

	int jobFairBoothMgtCancel(Map<String, Object> paramMap);
	
	List<Map<String, Object>> regionSelect();
	
	List<Map<String, Object>> boothTypeSelect();
}
