package kr.happyjob.study.ad.model;

public class AdResponseDto {
	
	public static class Ad {
		
		private int no;
		private String companyName;
		private String title;
		private String hireType;
		private String experience;
		private String salary;
		private String education;
		private String location;
		private String dueDate;
		private String daysLeft;
		private String position;
		private int totalCount;
		private boolean applied;
		private boolean bookmarked;
		private boolean deleted;
		private String appliedAt;
		
		public Ad(int no, String companyName, String title, String hireType, String experience, String salary,
				String education, String location, String dueDate, String daysLeft, String position, int totalCount,
				boolean applied, boolean bookmarked, boolean deleted, String appliedAt) {
			super();
			this.no = no;
			this.companyName = companyName;
			this.title = title;
			this.hireType = hireType;
			this.experience = experience;
			this.salary = salary;
			this.education = education;
			this.location = location;
			this.dueDate = dueDate;
			this.daysLeft = daysLeft;
			this.position = position;
			this.totalCount = totalCount;
			this.applied = applied;
			this.bookmarked = bookmarked;
			this.deleted = deleted;
			this.appliedAt = appliedAt;
		}
		public Ad() {
			super();
		}
		public int getNo() {
			return no;
		}
		public void setNo(int no) {
			this.no = no;
		}
		public String getCompanyName() {
			return companyName;
		}
		public void setCompanyName(String companyName) {
			this.companyName = companyName;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getHireType() {
			return hireType;
		}
		public void setHireType(String hireType) {
			this.hireType = hireType;
		}
		public String getExperience() {
			return experience;
		}
		public void setExperience(String experience) {
			this.experience = experience;
		}
		public String getSalary() {
			return salary;
		}
		public void setSalary(String salary) {
			this.salary = salary;
		}
		public String getEducation() {
			return education;
		}
		public void setEducation(String education) {
			this.education = education;
		}
		public String getLocation() {
			return location;
		}
		public void setLocation(String location) {
			this.location = location;
		}
		public String getDueDate() {
			return dueDate;
		}
		public void setDueDate(String dueDate) {
			this.dueDate = dueDate;
		}
		public String getDaysLeft() {
			return daysLeft;
		}
		public void setDaysLeft(String daysLeft) {
			this.daysLeft = daysLeft;
		}
		public String getPosition() {
			return position;
		}
		public void setPosition(String position) {
			this.position = position;
		}
		public int getTotalCount() {
			return totalCount;
		}
		public void setTotalCount(int totalCount) {
			this.totalCount = totalCount;
		}
		public boolean isApplied() {
			return applied;
		}
		public void setApplied(boolean applied) {
			this.applied = applied;
		}
		public boolean isBookmarked() {
			return bookmarked;
		}
		public void setBookmarked(boolean bookmarked) {
			this.bookmarked = bookmarked;
		}
		public boolean isDeleted() {
			return deleted;
		}
		public void setDeleted(boolean deleted) {
			this.deleted = deleted;
		}
		public String getAppliedAt() {
			return appliedAt;
		}
		public void setAppliedAt(String appliedAt) {
			this.appliedAt = appliedAt;
		}
	
		
	}


}