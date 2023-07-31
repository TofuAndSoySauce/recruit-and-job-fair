package kr.happyjob.study.resume.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.study.resume.dao.ResumeSubmitDao;
import kr.happyjob.study.resume.model.ResumeAdListDTO;
import kr.happyjob.study.resume.model.ResumeAppliDTO;
import kr.happyjob.study.resume.model.ResumeListDTO;
import kr.happyjob.study.resume.model.ResumeSubmitModel;


@Service
public class ResumeSubmitServiceImpl implements ResumeSubmitService {
	
	private ResumeSubmitDao dao;
	
	@Autowired
	 public ResumeSubmitServiceImpl(ResumeSubmitDao dao) {
		super();
		this.dao = dao;
	}
	//공고리스트
	@Override
	public List<ResumeAdListDTO> resumeAdList(ResumeAdListDTO rld) throws Exception {
		return dao.resumeAdList(rld);
	}
	
	//지원자현황리스트
	@Override
	public List<ResumeListDTO> resumeSubmitList(ResumeAdListDTO rld) throws Exception {
		return dao.resumeSubmitList(rld);
	}

	//이력서 보여주기
	@Override
	public ResumeAppliDTO resumeApplicant(int submit_no) throws Exception {
		return dao.resumeApplicant(submit_no);
	}
	@Override
	public int resumeResult(int submit_no) throws Exception {
		return dao.resumeResult(submit_no);
	}
	@Override
	public int resumePassResult(int submit_no) throws Exception {
		return dao.resumePassResult(submit_no);
	}
	
	//면접일정 등록
	@Override
	public int interviewUpdateDate(ResumeSubmitModel rsm) throws Exception {
		return dao.interviewUpdateDate(rsm);
	}
	//공고명 리스트 개수 가져오기
	@Override
	public int countResumeAdList(ResumeAdListDTO rld) throws Exception {
		return dao.countResumeAdList(rld);
	}
	//상세공고 리스트 개수 가져오기
	@Override
	public int countResumeSubmitList(ResumeAdListDTO rld) throws Exception {
		return dao.countResumeSubmitList(rld);
	}

}
