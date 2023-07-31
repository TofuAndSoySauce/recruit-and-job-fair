package kr.happyjob.study.like.model;

import java.util.ArrayList;
import java.util.List;

import lombok.Builder;

public class LikeRequestDto {

	public static class Post {

		private int adNo;
		private String loginId;
		private int likeNo;
		private String redirectPageUrl;

		public Post(int adNo, String loginId, int likeNo, String redirectPageUrl) {
			super();
			this.adNo = adNo;
			this.loginId = loginId;
			this.likeNo = likeNo;
			this.redirectPageUrl = redirectPageUrl;
		}
		
		public Post(int adNo, String loginId, String redirectPageUrl) {
			super();
			this.adNo = adNo;
			this.loginId = loginId;
			this.redirectPageUrl = redirectPageUrl;
		}

		public Post() {
			super();
		}

		public int getAdNo() {
			return adNo;
		}

		public void setAdNo(int adNo) {
			this.adNo = adNo;
		}

		public String getLoginId() {
			return loginId;
		}

		public void setLoginId(String loginId) {
			this.loginId = loginId;
		}

		public int getLikeNo() {
			return likeNo;
		}

		public void setLikeNo(int likeNo) {
			this.likeNo = likeNo;
		}

		public String getRedirectPageUrl() {
			return redirectPageUrl;
		}

		public void setRedirectPageUrl(String redirectPageUrl) {
			this.redirectPageUrl = redirectPageUrl;
		}

	}

	public static class Patch {

		private String loginId;
		private List<Integer> adNoList = new ArrayList<>();
		private int adNo;
		private String redirectPageUrl;
		
		public Patch(String loginId, int adNo, String redirectPageUrl) {
			super();
			this.loginId = loginId;
			this.adNo = adNo;
			this.redirectPageUrl = redirectPageUrl;
		}

		public Patch(String loginId, List<Integer> adNoList, int adNo, String redirectPageUrl) {
			super();
			this.loginId = loginId;
			this.adNoList = adNoList;
			this.adNo = adNo;
			this.redirectPageUrl = redirectPageUrl;
		}

		public String getLoginId() {
			return loginId;
		}

		public void setLoginId(String loginId) {
			this.loginId = loginId;
		}

		public List<Integer> getAdNoList() {
			return adNoList;
		}

		public void setAdNoList(List<Integer> adNoList) {
			this.adNoList = adNoList;
		}

		public int getAdNo() {
			return adNo;
		}

		public void setAdNo(int adNo) {
			this.adNo = adNo;
		}

		public String getRedirectPageUrl() {
			return redirectPageUrl;
		}

		public void setRedirectPageUrl(String redirectPageUrl) {
			this.redirectPageUrl = redirectPageUrl;
		}

		public Patch() {
			super();
		}

	}
}
