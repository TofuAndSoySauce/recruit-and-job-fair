package kr.happyjob.study.resume.model;

import java.util.List;

public class ResumeAdDTO {
	private List<ResumeAdListDTO> list;
	private int countResumeList;
	
	
	public List<ResumeAdListDTO> getList() {
		return list;
	}
	public void setList(List<ResumeAdListDTO> list) {
		this.list = list;
	}
	public int getCountResumeList() {
		return countResumeList;
	}
	public void setCountResumeList(int countResumeList) {
		this.countResumeList = countResumeList;
	}
	@Override
	public String toString() {
		return "ResumeAdDTO [list=" + list + ", countResumeList=" + countResumeList + "]";
	}
}