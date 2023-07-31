package kr.happyjob.study.fair.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.study.fair.dao.FairMgtDao;
import kr.happyjob.study.fair.model.FairMgtModel;

@Service
public class FairMgtServiceImpl implements FairMgtService {
	
	@Autowired
	FairMgtDao fairMgtDao;
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	@Override
	public List<FairMgtModel> fairlist(Map<String, Object> paramMap) throws Exception {
		
		return fairMgtDao.fairlist(paramMap);
	}

	@Override
	public int countfairlist(Map<String, Object> paramMap) throws Exception {
		
		return fairMgtDao.countfairlist(paramMap);
	}

	@Override
	public int rejectRequest(Map<String, Object> paramMap) throws Exception {
		
		return fairMgtDao.rejectRequest(paramMap);
	}

	@Override
	public int acceptRequest(Map<String, Object> paramMap) throws Exception {
		
		return fairMgtDao.acceptRequest(paramMap);
	}
}
