package kr.happyjob.study.resume.dao;

import java.util.List;

import kr.happyjob.study.resume.model.ResumeAdListDTO;
import kr.happyjob.study.resume.model.ResumeAppliDTO;
import kr.happyjob.study.resume.model.ResumeListDTO;
import kr.happyjob.study.resume.model.ResumeSubmitModel;

public interface ResumeSubmitDao {


	public List<ResumeAdListDTO> resumeAdList(ResumeAdListDTO rld)throws Exception;

	public List<ResumeListDTO> resumeSubmitList(ResumeAdListDTO rld) throws Exception;

	//이력서 보여주기
	public ResumeAppliDTO resumeApplicant(int submit_no) throws Exception;

	public int resumeResult(int submit_no)throws Exception;

	public int resumePassResult(int submit_no) throws Exception;

	//면접일정 등록
	public int interviewUpdateDate(ResumeSubmitModel rsm) throws Exception;

	public int countResumeAdList(ResumeAdListDTO rld) throws Exception;

	public int countResumeSubmitList(ResumeAdListDTO rld) throws Exception;


}
