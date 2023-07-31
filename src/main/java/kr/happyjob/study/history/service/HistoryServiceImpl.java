package kr.happyjob.study.history.service;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.happyjob.study.history.dao.HistoryDao;
import kr.happyjob.study.history.model.HistoryQueryParam;
import kr.happyjob.study.history.model.HistoryRequestDto.Post;
import kr.happyjob.study.history.model.HistoryResponseDto.History;

@Service
public class HistoryServiceImpl implements HistoryService {
	
	@Autowired
	HistoryDao historyDao;

	@Override
	public List<History> getHistory(HistoryQueryParam queryParam) {
		
		return historyDao.list(queryParam);
	}

	@Override
	public int save(Post post) {
		Optional<Integer> optional = Optional.ofNullable(historyDao.getOne(post));
		
		if(optional.isPresent()){
			return 0;
		} else {
			return historyDao.save(post);
		}
		
	}

	@Override
	@Transactional
	public void updateOldHistories() {
		LocalDate cutoffDateObj = LocalDate.now().minus(7, ChronoUnit.DAYS);
		String cutoffDate = cutoffDateObj.toString();
			
		List<Integer> histories = historyDao.getOldHistories(cutoffDate);
		
		int rows = 0;
		
		for(int historyNo : histories){
			historyDao.deleteOldHistory(historyNo);
			rows++;
		}
		
		System.out.println(String.format("성공적으로 삭제된 히스토리 수 : %d 개", rows));
		
	}
	
}
