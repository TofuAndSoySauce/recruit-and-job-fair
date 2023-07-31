package kr.happyjob.study.ad.model;

public class AdQueryParam {

	private static final int DEFAULT_PAGE_SIZE = 5;
	
	private String loginId;
	private String hireType;
	private String location;
	private String education;
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

	public AdQueryParam(String loginId, String hireType, String location, String education, String keyword,
			int pageSize, int pageIndex, int currentPage) {
		super();
		this.loginId = loginId;
		this.hireType = hireType;
		this.location = location;
		this.education = education;
		this.keyword = keyword;
		this.pageSize = pageSize;
		this.pageIndex = pageIndex;
		this.currentPage = currentPage;
	}

	public AdQueryParam() {
		super();
	}

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public String getHireType() {
		return hireType;
	}

	public void setHireType(String hireType) {
		this.hireType = hireType;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
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