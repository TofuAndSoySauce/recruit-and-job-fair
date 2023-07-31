package kr.happyjob.study.history.model;

public class HistoryQueryParam {
	
	private static final int DEFAULT_PAGE_SIZE = 10;
	
	private String loginId;
	private int pageSize;
	private int pageIndex;
	private int currentPage;
	private String keyword;
	
	public void setDefaultPage() {
		this.setCurrentPage(1);
		this.setPageSize(DEFAULT_PAGE_SIZE);	
	}
	
	public void setPageIndex(){
		pageIndex = (this.currentPage - 1) * this.pageSize;
	}

	public HistoryQueryParam(String loginId, int pageSize, int pageIndex, int currentPage, String keyword) {
		super();
		this.loginId = loginId;
		this.pageSize = pageSize;
		this.pageIndex = pageIndex;
		this.currentPage = currentPage;
		this.keyword = keyword;
	}

	public HistoryQueryParam() {
		super();
	}

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
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

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public static int getDefaultPageSize() {
		return DEFAULT_PAGE_SIZE;
	}
	

}
