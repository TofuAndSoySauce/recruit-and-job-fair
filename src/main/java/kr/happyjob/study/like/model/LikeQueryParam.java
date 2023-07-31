package kr.happyjob.study.like.model;

public class LikeQueryParam {

	private static final int DEFAULT_PAGE_SIZE = 5;

	private String keyword;
	private boolean excludesApplied;
	private boolean excludesExpired;
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

	public LikeQueryParam(String keyword, boolean excludesApplied, boolean excludesExpired, String loginId,
			int pageSize, int pageIndex, int currentPage) {
		super();
		this.keyword = keyword;
		this.excludesApplied = excludesApplied;
		this.excludesExpired = excludesExpired;
		this.loginId = loginId;
		this.pageSize = pageSize;
		this.pageIndex = pageIndex;
		this.currentPage = currentPage;
	}

	public LikeQueryParam() {
		super();
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public boolean isExcludesApplied() {
		return excludesApplied;
	}

	public void setExcludesApplied(boolean excludesApplied) {
		this.excludesApplied = excludesApplied;
	}

	public boolean isExcludesExpired() {
		return excludesExpired;
	}

	public void setExcludesExpired(boolean excludesExpired) {
		this.excludesExpired = excludesExpired;
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

	public static int getDefaultPageSize() {
		return DEFAULT_PAGE_SIZE;
	}

}
