package kr.happyjob.study.resume.model;

public class ResumeSubmitModelForUser {

	private int no;
	private String companyName;
	private String adTitle;
	private String dueDate;
	private String submitDate;
	private String memo;
	private String status;
	private String regDate;
	private int adNo;
	private String daysLeft;

	private int resumeNo;
	private String resumeTitle;
	private String loginId;
	private String interviewDate;
	private String experience;
	private String salary;
	private String isRead;
	private String adStatus;
	private String submitStatus;
	private String interviewYn;
	
	private int totalCount;

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public ResumeSubmitModelForUser() {
		super();
	}

	public ResumeSubmitModelForUser(int no, String companyName, String adTitle, String dueDate, String submitDate,
			String memo, String status, String regDate, int adNo, String daysLeft, int resumeNo, String resumeTitle,
			String loginId, String interviewDate, String experience, String salary, String isRead, String adStatus,
			String submitStatus, String interviewYn, int totalCount) {
		super();
		this.no = no;
		this.companyName = companyName;
		this.adTitle = adTitle;
		this.dueDate = dueDate;
		this.submitDate = submitDate;
		this.memo = memo;
		this.status = status;
		this.regDate = regDate;
		this.adNo = adNo;
		this.daysLeft = daysLeft;
		this.resumeNo = resumeNo;
		this.resumeTitle = resumeTitle;
		this.loginId = loginId;
		this.interviewDate = interviewDate;
		this.experience = experience;
		this.salary = salary;
		this.isRead = isRead;
		this.adStatus = adStatus;
		this.submitStatus = submitStatus;
		this.interviewYn = interviewYn;
		this.totalCount = totalCount;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getAdTitle() {
		return adTitle;
	}

	public void setAdTitle(String adTitle) {
		this.adTitle = adTitle;
	}

	public String getDueDate() {
		return dueDate;
	}

	public void setDueDate(String dueDate) {
		this.dueDate = dueDate;
	}

	public String getSubmitDate() {
		return submitDate;
	}

	public void setSubmitDate(String submitDate) {
		this.submitDate = submitDate;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public int getAdNo() {
		return adNo;
	}

	public void setAdNo(int adNo) {
		this.adNo = adNo;
	}

	public String getDaysLeft() {
		return daysLeft;
	}

	public void setDaysLeft(String daysLeft) {
		this.daysLeft = daysLeft;
	}

	public int getResumeNo() {
		return resumeNo;
	}

	public void setResumeNo(int resumeNo) {
		this.resumeNo = resumeNo;
	}

	public String getResumeTitle() {
		return resumeTitle;
	}

	public void setResumeTitle(String resumeTitle) {
		this.resumeTitle = resumeTitle;
	}

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public String getInterviewDate() {
		return interviewDate;
	}

	public void setInterviewDate(String interviewDate) {
		this.interviewDate = interviewDate;
	}

	public String getExperience() {
		return experience;
	}

	public void setExperience(String experience) {
		this.experience = experience;
	}

	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

	public String getIsRead() {
		return isRead;
	}

	public void setIsRead(String isRead) {
		this.isRead = isRead;
	}

	public String getAdStatus() {
		return adStatus;
	}

	public void setAdStatus(String adStatus) {
		this.adStatus = adStatus;
	}

	public String getSubmitStatus() {
		return submitStatus;
	}

	public void setSubmitStatus(String submitStatus) {
		this.submitStatus = submitStatus;
	}

	public String getInterviewYn() {
		return interviewYn;
	}

	public void setInterviewYn(String interviewYn) {
		this.interviewYn = interviewYn;
	}

}
