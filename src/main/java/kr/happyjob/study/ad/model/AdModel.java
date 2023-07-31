package kr.happyjob.study.ad.model;

public class AdModel {
	
	private int ad_no;
	private String ad_title;
	private String ad_content;
	private String ad_type;
	private String ad_location;
	private String ad_position;
	private String ad_role;
	private int ad_salary;
	private String ad_experience;
	private String ad_education;
	private String ad_perference;
	private String ad_date;
	private String ad_yn;
	private String ad_status;
	private String reg_date;
	private String update_date;
	private int is_delete;
	private int file_cd;
	private String loginID;
	
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
	public String getAd_content() {
		return ad_content;
	}
	public void setAd_content(String ad_content) {
		this.ad_content = ad_content;
	}
	public String getAd_type() {
		return ad_type;
	}
	public void setAd_type(String ad_type) {
		this.ad_type = ad_type;
	}
	public String getAd_location() {
		return ad_location;
	}
	public void setAd_location(String ad_location) {
		this.ad_location = ad_location;
	}
	public String getAd_position() {
		return ad_position;
	}
	public void setAd_position(String ad_position) {
		this.ad_position = ad_position;
	}
	public String getAd_role() {
		return ad_role;
	}
	public void setAd_role(String ad_role) {
		this.ad_role = ad_role;
	}
	public int getAd_salary() {
		return ad_salary;
	}
	public void setAd_salary(int ad_salary) {
		this.ad_salary = ad_salary;
	}
	public String getAd_experience() {
		return ad_experience;
	}
	public void setAd_experience(String ad_experience) {
		this.ad_experience = ad_experience;
	}
	public String getAd_education() {
		return ad_education;
	}
	public void setAd_education(String ad_education) {
		this.ad_education = ad_education;
	}
	public String getAd_perference() {
		return ad_perference;
	}
	public void setAd_perference(String ad_perference) {
		this.ad_perference = ad_perference;
	}
	public String getAd_date() {
		return ad_date;
	}
	public void setAd_date(String ad_date) {
		this.ad_date = ad_date;
	}
	public String getAd_yn() {
		return ad_yn;
	}
	public void setAd_yn(String ad_yn) {
		this.ad_yn = ad_yn;
	}
	public String getAd_status() {
		return ad_status;
	}
	public void setAd_status(String ad_status) {
		this.ad_status = ad_status;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}
	public int getIs_delete() {
		return is_delete;
	}
	public void setIs_delete(int is_delete) {
		this.is_delete = is_delete;
	}
	public int getFile_cd() {
		return file_cd;
	}
	public void setFile_cd(int file_cd) {
		this.file_cd = file_cd;
	}
	public String getLoginID() {
		return loginID;
	}
	public void setLoginID(String loginID) {
		this.loginID = loginID;
	}
	
	@Override
	public String toString() {
		return "AdModel [ad_no=" + ad_no + ", ad_title=" + ad_title + ", ad_content=" + ad_content + ", ad_type="
				+ ad_type + ", ad_location=" + ad_location + ", ad_position=" + ad_position + ", ad_role=" + ad_role
				+ ", ad_salary=" + ad_salary + ", ad_experience=" + ad_experience + ", ad_education=" + ad_education
				+ ", ad_perference=" + ad_perference + ", ad_date=" + ad_date + ", ad_yn=" + ad_yn + ", ad_status="
				+ ad_status + ", reg_date=" + reg_date + ", update_date=" + update_date + ", is_delete=" + is_delete
				+ ", file_cd=" + file_cd + ", loginID=" + loginID + "]";
	}

}
