package kr.happyjob.study.resume.model;

public class ResumeHistoryModel {
	
	private int history_no;
	private String reg_date;
	private String loginID;
	private int resume_no;
	
	public int getHistory_no() {
		return history_no;
	}
	public void setHistory_no(int history_no) {
		this.history_no = history_no;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getLoginID() {
		return loginID;
	}
	public void setLoginID(String loginID) {
		this.loginID = loginID;
	}
	public int getResume_no() {
		return resume_no;
	}
	public void setResume_no(int resume_no) {
		this.resume_no = resume_no;
	}
	
	@Override
	public String toString() {
		return "ResumeHistoryModel [history_no=" + history_no + ", reg_date=" + reg_date + ", loginID=" + loginID
				+ ", resume_no=" + resume_no + "]";
	}

}
