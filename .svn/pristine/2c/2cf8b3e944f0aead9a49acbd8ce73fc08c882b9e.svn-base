package kr.happyjob.study.resume.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.happyjob.study.resume.dao.ProposalDao;
import kr.happyjob.study.resume.model.ProposalQueryParam;
import kr.happyjob.study.resume.model.ProposalRequest.Patch;
import kr.happyjob.study.resume.model.ProposalResponse.Proposal;
import kr.happyjob.study.resume.model.ProposalResponse.ProposedCompany;

@Service
public class ProposalServiceImpl implements ProposalService {

	@Autowired
	ProposalDao proposalDao;
	
	@Override
	public List<Proposal> getList(ProposalQueryParam param) {
		return proposalDao.getProposalList(param);
	}

	@Override
	public ProposedCompany getProposedCompany(String companyLoginId) {
		
		Optional<ProposedCompany> company = Optional.ofNullable(proposalDao.getProposedCompany(companyLoginId));
		if(!company.isPresent()) throw new RuntimeException("없는 기업입니다. loginId 를 확인해주세요");
		return company.get();
	}

	@Override
	@Transactional
	public int updateStatus(Patch patch) {
		
		Optional<Integer> optional = Optional.ofNullable(proposalDao.getOneByLoginIdAndProposalNo(patch));
		
		if(!optional.isPresent()) 
			throw new RuntimeException(String.format("관련 제안 정보가 없습니다. 정보를 확인해주세요 loginId: %s, proposalNo: %d",  patch.getLoginId(), patch.getProposalNo()));
		
		if(patch.isAccepted())
			return proposalDao.updateAsAccepted(patch);
		else
			return proposalDao.updateAsDeclined(patch);
	
	}

}
