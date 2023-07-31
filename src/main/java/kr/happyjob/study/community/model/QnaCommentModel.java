package kr.happyjob.study.community.model;

public class QnaCommentModel {

	private int comment_no;
	private String comment_content;
	private String reg_date;
	private String update_date;
	private int is_delete;
	private int qna_no;
	private String loginID;
	
	
	@Override
	public String toString() {
		return "QnaCommentModel [comment_no=" + comment_no + ", comment_content=" + comment_content + ", reg_date="
				+ reg_date + ", update_date=" + update_date + ", is_delete=" + is_delete + ", qna_no=" + qna_no
				+ ", loginID=" + loginID + "]";
	}


	public int getComment_no() {
		return comment_no;
	}


	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}


	public String getComment_content() {
		return comment_content;
	}


	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
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


	public int getQna_no() {
		return qna_no;
	}


	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}


	public String getLoginID() {
		return loginID;
	}


	public void setLoginID(String loginID) {
		this.loginID = loginID;
	}


	
	
	
}
