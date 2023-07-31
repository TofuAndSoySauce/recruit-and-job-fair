package kr.happyjob.study.history.dao;

import java.time.LocalDate;
import java.util.List;

import kr.happyjob.study.history.model.HistoryQueryParam;
import kr.happyjob.study.history.model.HistoryRequestDto.Post;
import kr.happyjob.study.history.model.HistoryResponseDto.History;

public interface HistoryDao {
	
	List<History> list(HistoryQueryParam queryParam);
	
	int save(Post post);
	
	Integer getOne(Post post);
	
	List<Integer> getOldHistories(String cutoffDate);
	
	int deleteOldHistory(int historyNo);
	

}
