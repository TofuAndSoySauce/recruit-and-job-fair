package kr.happyjob.study.ad.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.study.ad.dao.ProposalStatusDao;
import kr.happyjob.study.ad.model.ProposalStatusModel;
import kr.happyjob.study.userinfo.dao.MailDao;

@Service
public class ProposalStatusServiceImp implements ProposalStatusService{
	
	@Autowired
	ProposalStatusDao proposalStatusDao;
	
	@Autowired
	MailDao mailDao;
	
	// 이력서 조회 함수
	@Override
	public List<ProposalStatusModel> resumeList(Map<String, Object> paramMap) throws Exception {
		
		return proposalStatusDao.resumeList(paramMap);
		
	}
	
	// 이력서 총건 구하는 함수
	@Override
	public int countResumeList(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return proposalStatusDao.countResumeList(paramMap);
	}
	
	// 면접 일자 신청 함수
	@Override
	public int joboffer(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return proposalStatusDao.joboffer(paramMap);
	}

	// 이력서 열람 기업 등록 함수
	@Override
	public int resumeHistory(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		
		return proposalStatusDao.resumeHistory(paramMap);
	}
	
	// 면접 신청 메일 보내기 (업체가 취준생에게)
	@Override
	public int sendMail(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return mailDao.sendMail(paramMap);
	}
	
	// 면접 취소 보내기
	@Override
	public int jobcancle(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return proposalStatusDao.jobcancle(paramMap);
	}
	
	// 업체 열람 조회 
	@Override
	public Map<String, Object> resumeHistoryList(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		
		return proposalStatusDao.resumeHistoryList(paramMap);
	}

	// 이력서 상세 보기 및 히스토리 번호 보기
	@Override
	public Map<String, Object> resumeDetail(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return proposalStatusDao.resumeDetail(paramMap);
	}

	// 면접 제의 번호 구하기
	@Override
	public Map<String, Object> proposalno(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return proposalStatusDao.proposalno(paramMap);
	}

	// 히스토리 번호 구하기
	@Override
	public int historyno(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return proposalStatusDao.historyno(paramMap);
	}
	
	// 면접 제안 신청 상태 조회
	@Override
	public List<ProposalStatusModel> ProposStatus(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return proposalStatusDao.ProposStatus(paramMap);
	}
	
	// 면접 제안 신청 상태 전체 건수 구하기
	@Override
	public int countProposStatus(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return proposalStatusDao.countProposStatus(paramMap);
	}
	
}