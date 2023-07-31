package kr.happyjob.study.resume.model;

public class ResumeQueryParam {
	
	private static final int DEFAULT_PAGE_SIZE = 10;
	
	private String loginId;
	private boolean isRead;
	private boolean excludesExpired;
	private String keyword;
	private int pageSize;
	private int pageIndex;
	private int currentPage;
	
	public void setDefaultPage() {
		this.setCurrentPage(1);
		this.setPageSize(DEFAULT_PAGE_SIZE);	
	}
	
	public void setPageIndex(){
		pageIndex = (this.currentPage - 1) * this.pageSize;
	}

	public ResumeQueryParam(String loginId, boolean isRead, boolean excludesExpired, String keyword, int pageSize,
			int pageIndex, int currentPage) {
		this.loginId = loginId;
		this.isRead = isRead;
		this.excludesExpired = excludesExpired;
		this.keyword = keyword;
		this.pageSize = pageSize;
		this.pageIndex = pageIndex;
		this.currentPage = currentPage;
	}

	public ResumeQueryParam() {
	}

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public boolean isRead() {
		return isRead;
	}

	public void setRead(boolean isRead) {
		this.isRead = isRead;
	}

	public boolean isExcludesExpired() {
		return excludesExpired;
	}

	public void setExcludesExpired(boolean excludesExpired) {
		this.excludesExpired = excludesExpired;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public static int getDefaultPageSize() {
		return DEFAULT_PAGE_SIZE;
	}
	
}
