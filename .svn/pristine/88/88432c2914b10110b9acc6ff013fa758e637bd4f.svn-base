package kr.happyjob.study.resume.model;

public class ProposalQueryParam {

	private static final int DEFAULT_PAGE_SIZE = 5;

	private String loginId;
	private int pageSize;
	private int pageIndex;
	private int currentPage;

	public void setDefaultPage() {
		this.setCurrentPage(1);
		this.setPageSize(DEFAULT_PAGE_SIZE);
	}

	public void setPageIndex() {
		pageIndex = (this.currentPage - 1) * this.pageSize;
	}

	public ProposalQueryParam(String loginId, int pageSize, int pageIndex, int currentPage) {
		super();
		this.loginId = loginId;
		this.pageSize = pageSize;
		this.pageIndex = pageIndex;
		this.currentPage = currentPage;
	}

	public ProposalQueryParam() {
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

}
