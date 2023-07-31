package kr.happyjob.study.resume.dao;

import java.util.List;

import kr.happyjob.study.resume.model.ProposalQueryParam;
import kr.happyjob.study.resume.model.ProposalRequest.Patch;
import kr.happyjob.study.resume.model.ProposalResponse.Proposal;
import kr.happyjob.study.resume.model.ProposalResponse.ProposedCompany;

public interface ProposalDao {
	List<Proposal> getProposalList(ProposalQueryParam param);
	ProposedCompany getProposedCompany(String companyLoginId);
	
	int updateAsAccepted(Patch patch);
	int updateAsDeclined(Patch patch);
	Integer getOneByLoginIdAndProposalNo(Patch patch);
}
