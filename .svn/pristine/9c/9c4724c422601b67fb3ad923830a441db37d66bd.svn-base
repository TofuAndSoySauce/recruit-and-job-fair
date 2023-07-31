package kr.happyjob.study.fair.service;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.fair.model.JobFairModel;

public interface JobFairService {
	
	// 박람회 조회 함수
	List<JobFairModel> jobFairlist(Map<String, Object> paramMap);
	
	// 박람회 조회 총 건수 구하는 함수
	int countJobFairList(Map<String, Object> paramMap);

	// 박람회 상세 보기
	Map<String, Object> JobFairDetail(Map<String, Object> paramMap);
	
	// 박람회 신청하기
	int JobFair(Map<String, Object> paramMap);
	
	// 박람회 수용 인원 변경
	int updateJobFair(Map<String, Object> paramMap);
	
	// 신청 메일 보내기
	int sendMail(Map<String, Object> paramMap) throws Exception;

}