package kr.happyjob.study.community.model;

/**
 * @author user
 *
 */
/**
 * @author user
 *
 */
public class QnalistDTO {
	
	private String user_type;
	private int qna_no;
	private String qna_title;
	private String qna_content;
	private int qna_answer;
	private String reg_date;
	private String loginID;
	private String comment_content;
	private int file_cd;
	private String file_name;
	private String file_nadd;
	private String file_madd;
	
	public String getUser_type() {
		return user_type;
	}
	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}
	public int getQna_no() {
		return qna_no;
	}
	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public int getQna_answer() {
		return qna_answer;
	}
	public void setQna_answer(int qna_answer) {
		this.qna_answer = qna_answer;
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
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public int getFile_cd() {
		return file_cd;
	}
	public void setFile_cd(int file_cd) {
		this.file_cd = file_cd;
	}
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
	@Override
	public String toString() {
		return "QnalistDTO [user_type=" + user_type + ", qna_no=" + qna_no + ", qna_title=" + qna_title
				+ ", qna_content=" + qna_content + ", qna_answer=" + qna_answer + ", reg_date=" + reg_date
				+ ", loginID=" + loginID + ", comment_content=" + comment_content + ", file_cd=" + file_cd
				+ ", file_name=" + file_name + ", file_nadd=" + file_nadd + ", file_madd=" + file_madd + "]";
	}

}
