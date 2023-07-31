package kr.happyjob.study.history.service;

import java.util.List;

import kr.happyjob.study.history.model.HistoryQueryParam;
import kr.happyjob.study.history.model.HistoryRequestDto.Post;
import kr.happyjob.study.history.model.HistoryResponseDto.History;

public interface HistoryService {
	
	List<History> getHistory(HistoryQueryParam queryParam);
	
	int save(Post post);
	
	void updateOldHistories();

}
