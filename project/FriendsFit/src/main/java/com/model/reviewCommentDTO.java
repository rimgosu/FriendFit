package com.model;

public class reviewCommentDTO {

	private int reviewCommentNum;
	private String reviewCommentContent;
	private String memberID;
	private int reviewNum;
	private int reviewCommentLike;
	private String reviewCommentDay;
	public int getReviewCommentNum() {
		return reviewCommentNum;
	}
	public void setReviewCommentNum(int reviewCommentNum) {
		this.reviewCommentNum = reviewCommentNum;
	}
	public String getReviewCommentContent() {
		return reviewCommentContent;
	}
	public void setReviewCommentContent(String reviewCommentContent) {
		this.reviewCommentContent = reviewCommentContent;
	}
	public String getMemberID() {
		return memberID;
	}
	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}
	public int getReviewNum() {
		return reviewNum;
	}
	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}
	public int getReviewCommentLike() {
		return reviewCommentLike;
	}
	public void setReviewCommentLike(int reviewCommentLike) {
		this.reviewCommentLike = reviewCommentLike;
	}
	public String getReviewCommentDay() {
		return reviewCommentDay;
	}
	public void setReviewCommentDay(String reviewCommentDay) {
		this.reviewCommentDay = reviewCommentDay;
	}
	public reviewCommentDTO(int reviewCommentNum, String reviewCommentContent, String memberID, int reviewNum,
			int reviewCommentLike, String reviewCommentDay) {
		super();
		this.reviewCommentNum = reviewCommentNum;
		this.reviewCommentContent = reviewCommentContent;
		this.memberID = memberID;
		this.reviewNum = reviewNum;
		this.reviewCommentLike = reviewCommentLike;
		this.reviewCommentDay = reviewCommentDay;
	}
	
	public reviewCommentDTO() {
		
	}
	
	
}
