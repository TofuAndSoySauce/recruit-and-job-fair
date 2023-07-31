package kr.happyjob.study.resume.model;

public class ResumeAdListDTO {
	
	private int ad_no;//공고번호
	private String ad_title;//공고제목
	private String ad_position;//직무
	private String ad_type;//고용형태
	private String ad_date;//마감기간
	private String loginID;//로그인 아이디
	private String resumeAd_title;//제목
	private String start_date;
	private String end_date;
	private String ad_position_nm;
	private String ad_type_nm;
	private int pageSize;
	private int cpage;
	private int pageIndex;
	public int getAd_no() {
		return ad_no;
	}
	public void setAd_no(int ad_no) {
		this.ad_no = ad_no;
	}
	public String getAd_title() {
		return ad_title;
	}
	public void setAd_title(String ad_title) {
		this.ad_title = ad_title;
	}
	public String getAd_position() {
		return ad_position;
	}
	public void setAd_position(String ad_position) {
		this.ad_position = ad_position;
	}
	public String getAd_type() {
		return ad_type;
	}
	public void setAd_type(String ad_type) {
		this.ad_type = ad_type;
	}
	public String getAd_date() {
		return ad_date;
	}
	public void setAd_date(String ad_date) {
		this.ad_date = ad_date;
	}
	public String getLoginID() {
		return loginID;
	}
	public void setLoginID(String loginID) {
		this.loginID = loginID;
	}
	public String getResumeAd_title() {
		return resumeAd_title;
	}
	public void setResumeAd_title(String resumeAd_title) {
		this.resumeAd_title = resumeAd_title;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getAd_position_nm() {
		return ad_position_nm;
	}
	public void setAd_position_nm(String ad_position_nm) {
		this.ad_position_nm = ad_position_nm;
	}
	public String getAd_type_nm() {
		return ad_type_nm;
	}
	public void setAd_type_nm(String ad_type_nm) {
		this.ad_type_nm = ad_type_nm;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getCpage() {
		return cpage;
	}
	public void setCpage(int cpage) {
		this.cpage = cpage;
	}
	public int getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}
	@Override
	public String toString() {
		return "ResumeAdListDTO [ad_no=" + ad_no + ", ad_title=" + ad_title + ", ad_position=" + ad_position
				+ ", ad_type=" + ad_type + ", ad_date=" + ad_date + ", loginID=" + loginID + ", resumeAd_title="
				+ resumeAd_title + ", start_date=" + start_date + ", end_date=" + end_date + ", ad_position_nm="
				+ ad_position_nm + ", ad_type_nm=" + ad_type_nm + ", pageSize=" + pageSize + ", cpage=" + cpage
				+ ", pageIndex=" + pageIndex + "]";
	}
	
}