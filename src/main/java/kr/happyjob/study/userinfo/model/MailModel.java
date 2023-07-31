package kr.happyjob.study.userinfo.model;

// 내가 반드시 조회나 등록 수정을 할때 필요한 속성은 반드시 모델에 변수로 추가를 해야 한다.
public class MailModel {
	
	private int mail_no;
	private String mail_title;
	private String mail_content;
	private int read_yn;
	private String read_date;
	private String reg_date;
	private String update_date;
	private int is_delete;
	private String loginID;
	private String mail_other;
	private int file_cd;
	private int resume_no;
	private String name;
	private String file_name;
	private String file_nadd;
	private String file_madd;
	private String detail_name;
	private int cpage;
	
	public int getCpage() {
		return cpage;
	}
	public void setCpage(int cpage) {
		this.cpage = cpage;
	}
	public String getDetail_name() {
		return detail_name;
	}
	public void setDetail_name(String detail_name) {
		this.detail_name = detail_name;
	}
	private int file_size;
	
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getFile_nadd() {
		return file_nadd;
	}
	public void setFile_nadd(String file_nadd) {
		this.file_nadd = file_nadd;
	}
	public String getFile_madd() {
		return file_madd;
	}
	public void setFile_madd(String file_madd) {
		this.file_madd = file_madd;
	}
	public int getFile_size() {
		return file_size;
	}
	public void setFile_size(int file_size) {
		this.file_size = file_size;
	}
	public int getMail_no() {
		return mail_no;
	}
	public void setMail_no(int mail_no) {
		this.mail_no = mail_no;
	}
	public String getMail_title() {
		return mail_title;
	}
	public void setMail_title(String mail_title) {
		this.mail_title = mail_title;
	}
	public String getMail_content() {
		return mail_content;
	}
	public void setMail_content(String mail_content) {
		this.mail_content = mail_content;
	}
	public int getRead_yn() {
		return read_yn;
	}
	public void setRead_yn(int read_yn) {
		this.read_yn = read_yn;
	}
	public String getRead_date() {
		return read_date;
	}
	public void setRead_date(String read_date) {
		this.read_date = read_date;
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
	public String getLoginID() {
		return loginID;
	}
	public void setLoginID(String loginID) {
		this.loginID = loginID;
	}
	public String getMail_other() {
		return mail_other;
	}
	public void setMail_other(String mail_other) {
		this.mail_other = mail_other;
	}
	public int getFile_cd() {
		return file_cd;
	}
	public void setFile_cd(int file_cd) {
		this.file_cd = file_cd;
	}
	public int getResume_no() {
		return resume_no;
	}
	public void setResume_no(int resume_no) {
		this.resume_no = resume_no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}