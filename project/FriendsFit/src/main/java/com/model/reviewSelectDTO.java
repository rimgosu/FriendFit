package com.model;

public class reviewSelectDTO {

	private int reviewNum;
	private String reviewTitle;
	private String reviewContent;
	private String memberID;
	private int fileNum;
	
	private int facilityNum;
	private int reviewLike;
	private int reviewView;
	private int reviewGrade;
	private String reviewDay;
	public int getReviewNum() {
		return reviewNum;
	}
	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}
	public String getReviewTitle() {
		return reviewTitle;
	}
	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public String getMemberID() {
		return memberID;
	}
	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}
	public int getFileNum() {
		return fileNum;
	}
	public void setFileNum(int fileNum) {
		this.fileNum = fileNum;
	}
	public int getFacilityNum() {
		return facilityNum;
	}
	public void setFacilityNum(int facilityNum) {
		this.facilityNum = facilityNum;
	}
	public int getReviewLike() {
		return reviewLike;
	}
	public void setReviewLike(int reviewLike) {
		this.reviewLike = reviewLike;
	}
	public int getReviewView() {
		return reviewView;
	}
	public void setReviewView(int reviewView) {
		this.reviewView = reviewView;
	}
	public int getReviewGrade() {
		return reviewGrade;
	}
	public void setReviewGrade(int reviewGrade) {
		this.reviewGrade = reviewGrade;
	}
	public String getReviewDay() {
		return reviewDay;
	}
	public void setReviewDay(String reviewDay) {
		this.reviewDay = reviewDay;
	}
	public reviewSelectDTO(int reviewNum, String reviewTitle, String reviewContent, String memberID, int fileNum,
			int facilityNum, int reviewLike, int reviewView, int reviewGrade, String reviewDay) {
		super();
		this.reviewNum = reviewNum;
		this.reviewTitle = reviewTitle;
		this.reviewContent = reviewContent;
		this.memberID = memberID;
		this.fileNum = fileNum;
		this.facilityNum = facilityNum;
		this.reviewLike = reviewLike;
		this.reviewView = reviewView;
		this.reviewGrade = reviewGrade;
		this.reviewDay = reviewDay;
	}
	
	
	
}
