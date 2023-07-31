package kr.happyjob.study.fair.service;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.fair.model.JobFairBoothApplicationModel;

public interface JobFairBoothApplicationService {

	List<JobFairBoothApplicationModel> jobFairBoothApplicationList(Map<String, Object> paramMap);

	int countJobFairBoothApplicationList(Map<String, Object> paramMap);

	JobFairBoothApplicationModel jobFairBoothApplicationDetail(Map<String, Object> paramMap);

	int jobFairBoothApplicationSave(Map<String, Object> paramMap);

	List<Map<String, Object> > jobFairBoothApplicationExistBooth(Map<String, Object> paramMap);

	List<Map<String, Object>> regionSelect();

	List<Map<String, Object>> boothTypeSelect();

}
