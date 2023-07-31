package kr.happyjob.study.resume.model;

import java.util.List;

public class ResumeSubmitListDto {
	private List<ResumeListDTO> list;
	private int countResumeSubmitList;
	public List<ResumeListDTO> getList() {
		return list;
	}
	public void setList(List<ResumeListDTO> list) {
		this.list = list;
	}
	public int getCountResumeSubmitList() {
		return countResumeSubmitList;
	}
	public void setCountResumeSubmitList(int countResumeSubmitList) {
		this.countResumeSubmitList = countResumeSubmitList;
	}
	@Override
	public String toString() {
		return "ResumeSubmitListDto [list=" + list + ", countResumeSubmitList=" + countResumeSubmitList + "]";
	}
}
