package kr.happyjob.study.fair.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.study.fair.dao.JobFairBoothApplicationDao;
import kr.happyjob.study.fair.model.JobFairBoothApplicationModel;

@Service
public class JobFairBoothApplicationServiceImpl implements JobFairBoothApplicationService{

	@Autowired
	JobFairBoothApplicationDao jobFairBoothApplicationDao;
	
	@Override
	public List<JobFairBoothApplicationModel> jobFairBoothApplicationList(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return jobFairBoothApplicationDao.jobFairBoothApplicationList(paramMap);
	}

	//취업박람회테이블 데이터 총수
	@Override
	public int countJobFairBoothApplicationList(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return jobFairBoothApplicationDao.countJobFairBoothApplicationList(paramMap);
	}

	@Override
	public JobFairBoothApplicationModel jobFairBoothApplicationDetail(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return jobFairBoothApplicationDao.jobFairBoothApplicationDetail(paramMap);
	}

	@Override
	public int jobFairBoothApplicationSave(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return jobFairBoothApplicationDao.jobFairBoothApplicationSave(paramMap);
	}

	@Override
	public List<Map<String,Object>> jobFairBoothApplicationExistBooth(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return jobFairBoothApplicationDao.jobFairBoothApplicationExistBooth(paramMap);
	}

	@Override
	public List<Map<String,Object>> regionSelect() {
		// TODO Auto-generated method stub
		return jobFairBoothApplicationDao.regionSelect();
	}
	@Override
	public List<Map<String,Object>> boothTypeSelect() {
		// TODO Auto-generated method stub
		return jobFairBoothApplicationDao.boothTypeSelect();
	}

}
