package kr.happyjob.study.fair.model;

public class FairCreationModel {
	
	private int fair_no;
	private String fair_title;
	private String fair_content;
	private String fair_zipcode;
	private String fair_address1;
	private String fair_address2;
	private String fair_name;
	private String fair_location;
	private String fair_startdate;
	private String fair_enddate;
	private int fair_companyNum;
	private int fair_userNum;
	private String reg_date;
	private String update_date;
	private int is_delete;
	private int file_cd;
	private String loginID;
	private String type; // 전시장유형
	private String addr; // 주소
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public int getFair_no() {
		return fair_no;
	}
	public void setFair_no(int fair_no) {
		this.fair_no = fair_no;
	}
	public String getFair_title() {
		return fair_title;
	}
	public void setFair_title(String fair_title) {
		this.fair_title = fair_title;
	}
	public String getFair_content() {
		return fair_content;
	}
	public void setFair_content(String fair_content) {
		this.fair_content = fair_content;
	}
	public String getFair_zipcode() {
		return fair_zipcode;
	}
	public void setFair_zipcode(String fair_zipcode) {
		this.fair_zipcode = fair_zipcode;
	}
	public String getFair_address1() {
		return fair_address1;
	}
	public void setFair_address1(String fair_address1) {
		this.fair_address1 = fair_address1;
	}
	public String getFair_address2() {
		return fair_address2;
	}
	public void setFair_address2(String fair_address2) {
		this.fair_address2 = fair_address2;
	}
	public String getFair_name() {
		return fair_name;
	}
	public void setFair_name(String fair_name) {
		this.fair_name = fair_name;
	}
	public String getFair_location() {
		return fair_location;
	}
	public void setFair_location(String fair_location) {
		this.fair_location = fair_location;
	}
	public String getFair_startdate() {
		return fair_startdate;
	}
	public void setFair_startdate(String fair_startdate) {
		this.fair_startdate = fair_startdate;
	}
	public String getFair_enddate() {
		return fair_enddate;
	}
	public void setFair_enddate(String fair_enddate) {
		this.fair_enddate = fair_enddate;
	}
	public int getFair_companyNum() {
		return fair_companyNum;
	}
	public void setFair_companyNum(int fair_companyNum) {
		this.fair_companyNum = fair_companyNum;
	}
	public int getFair_userNum() {
		return fair_userNum;
	}
	public void setFair_userNum(int fair_userNum) {
		this.fair_userNum = fair_userNum;
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
	
}
