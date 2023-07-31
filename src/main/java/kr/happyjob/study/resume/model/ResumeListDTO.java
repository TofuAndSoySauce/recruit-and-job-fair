package kr.happyjob.study.resume.model;

public class ResumeListDTO {
	
	private int submit_no;//번호
	private String resume_title;//제목
	private String name;//이름
	private String resume_experience;//경력
	private String interview_yn;//면접여부
	private String reg_date;//면접일시
	private String submit_status;//합격여부
	private int ad_no;
	private int resume_no;
	private String detail_name;
	private String interview_yn_nm;
	private String submit_status_nm;
	private String submit_interviewdate;
	private String submit_interviewtime;
	
	public int getSubmit_no() {
		return submit_no;
	}
	public void setSubmit_no(int submit_no) {
		this.submit_no = submit_no;
	}
	public String getResume_title() {
		return resume_title;
	}
	public void setResume_title(String resume_title) {
		this.resume_title = resume_title;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getInterview_yn() {
		return interview_yn;
	}
	public void setInterview_yn(String interview_yn) {
		this.interview_yn = interview_yn;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getSubmit_status() {
		return submit_status;
	}
	public void setSubmit_status(String submit_status) {
		this.submit_status = submit_status;
	}
	public int getAd_no() {
		return ad_no;
	}
	public void setAd_no(int ad_no) {
		this.ad_no = ad_no;
	}
	public int getResume_no() {
		return resume_no;
	}
	public void setResume_no(int resume_no) {
		this.resume_no = resume_no;
	}
	
	public String getResume_experience() {
		return resume_experience;
	}
	public void setResume_experience(String resume_experience) {
		this.resume_experience = resume_experience;
	}
	public String getDetail_name() {
		return detail_name;
	}
	public void setDetail_name(String detail_name) {
		this.detail_name = detail_name;
	}
	public String getSubmit_status_nm() {
		return submit_status_nm;
	}
	public void setSubmit_status_nm(String submit_status_nm) {
		this.submit_status_nm = submit_status_nm;
	}
	public String getInterview_yn_nm() {
		return interview_yn_nm;
	}
	public void setInterview_yn_nm(String interview_yn_nm) {
		this.interview_yn_nm = interview_yn_nm;
	}
	
	public String getSubmit_interviewdate() {
		return submit_interviewdate;
	}
	public void setSubmit_interviewdate(String submit_interviewdate) {
		this.submit_interviewdate = submit_interviewdate;
	}
	public String getSubmit_interviewtime() {
		return submit_interviewtime;
	}
	public void setSubmit_interviewtime(String submit_interviewtime) {
		this.submit_interviewtime = submit_interviewtime;
	}
	@Override
	public String toString() {
		return "ResumeListDTO [submit_no=" + submit_no + ", resume_title=" + resume_title + ", name=" + name
				+ ", resume_experience=" + resume_experience + ", interview_yn=" + interview_yn + ", reg_date="
				+ reg_date + ", submit_status=" + submit_status + ", ad_no=" + ad_no + ", resume_no=" + resume_no
				+ ", detail_name=" + detail_name + ", interview_yn_nm=" + interview_yn_nm + ", submit_status_nm="
				+ submit_status_nm + ", submit_interviewdate=" + submit_interviewdate + ", submit_interviewtime="
				+ submit_interviewtime + "]";
	}
	
	
	
	

}
