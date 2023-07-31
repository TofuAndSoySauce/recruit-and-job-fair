package kr.happyjob.study.userinfo.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.study.ad.model.AdModel;
import kr.happyjob.study.userinfo.dao.UserInfoDao;

@Service
public class UserInfoServiceImpl implements UserInfoService {
	
	@Autowired
	UserInfoDao userInfoDao;
	
	private final Logger logger = LogManager.getLogger(this.getClass());

	// 채용공고 리스트 불러오기
	@Override
	public List<AdModel> adList(Map<String, Object> paramMap) throws Exception {
		return userInfoDao.adList(paramMap);
	}

	// 채용공고 상세보기 초기화
	@Override
	public Map<String, Object> adDetail(Map<String, Object> paramMap) throws Exception {
		return userInfoDao.adDetail(paramMap);
	}
	
	// 채용공고 수락 
	@Override
	public void acceptAd(Map<String, Object> paramMap) throws Exception {
		userInfoDao.acceptAd(paramMap);
	}

	// 채용공고 반려 
	@Override
	public void cancelAd(Map<String, Object> paramMap) throws Exception {
		userInfoDao.cancelAd(paramMap);
	}

	// 채용공고 리스트 카운트
	@Override
	public int countAdList(Map<String, Object> paramMap) throws Exception {
		return userInfoDao.countAdList(paramMap);
	}

}
