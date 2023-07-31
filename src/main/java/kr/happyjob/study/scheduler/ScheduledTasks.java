package kr.happyjob.study.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kr.happyjob.study.history.service.HistoryService;

@Component
public class ScheduledTasks {

	@Autowired
	HistoryService historyService;
	
	@Scheduled(cron = "0 * * * * *") // every minute
	public void updateOldHistory(){
		
		System.out.println("스케줄러 동작");
		historyService.updateOldHistories();
		
	}
	
	
}
