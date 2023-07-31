package kr.happyjob.study.fair.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.study.fair.dao.JobFairDao;
import kr.happyjob.study.fair.model.JobFairModel;
import kr.happyjob.study.userinfo.dao.MailDao;

@Service
public class JobFairServiceImp implements JobFairService{
	
	@Autowired
	JobFairDao jobFairDao;
	
	@Autowired
	MailDao mailDao;
	
	// 박람회 조회 함수
	@Override
	public List<JobFairModel> jobFairlist(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return jobFairDao.jobFairlist(paramMap);
	}
	
	// 박람회 조회 총 건수 구하는 함수
	@Override
	public int countJobFairList(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return jobFairDao.countJobFairList(paramMap);
	}
	
	// 박람회 상세 보기
	@Override
	public Map<String, Object> JobFairDetail(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return jobFairDao.JobFairDetail(paramMap);
	}

	@Override
	public int JobFair(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return jobFairDao.jobFair(paramMap);
	}

	// 박람회 수용 인원 변경
	@Override
	public int updateJobFair(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return jobFairDao.udpateJobFair(paramMap);
	}
	
	// 신청 메일 보내기
	@Override
	public int sendMail(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return jobFairDao.sendMail(paramMap);
	}

}