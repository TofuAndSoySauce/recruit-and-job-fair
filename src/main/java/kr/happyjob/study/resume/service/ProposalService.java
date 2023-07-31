package kr.happyjob.study.resume.service;

import java.util.List;

import kr.happyjob.study.resume.model.ProposalQueryParam;
import kr.happyjob.study.resume.model.ProposalRequest.Patch;
import kr.happyjob.study.resume.model.ProposalResponse.Proposal;
import kr.happyjob.study.resume.model.ProposalResponse.ProposedCompany;

public interface ProposalService {

	List<Proposal> getList(ProposalQueryParam param);
	ProposedCompany getProposedCompany(String companyLoginId);

	int updateStatus(Patch patch);
}
