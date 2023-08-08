package com.model;

public class communityDTO {

	private int commuNum;
	private String commuTitle;
	private String commuContent;
	private int fileNum;
	private String memberID;
	
	private int commuLike;
	private int commuView;
	private String commuDay;
	private String facilityCategory;
	public int getCommuNum() {
		return commuNum;
	}
	public void setCommuNum(int commuNum) {
		this.commuNum = commuNum;
	}
	public String getCommuTitle() {
		return commuTitle;
	}
	public void setCommuTitle(String commuTitle) {
		this.commuTitle = commuTitle;
	}
	public String getCommuContent() {
		return commuContent;
	}
	public void setCommuContent(String commuContent) {
		this.commuContent = commuContent;
	}
	public int getFileNum() {
		return fileNum;
	}
	public void setFileNum(int fileNum) {
		this.fileNum = fileNum;
	}
	public String getMemberID() {
		return memberID;
	}
	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}
	public int getCommuLike() {
		return commuLike;
	}
	public void setCommuLike(int commuLike) {
		this.commuLike = commuLike;
	}
	public int getCommuView() {
		return commuView;
	}
	public void setCommuView(int commuView) {
		this.commuView = commuView;
	}
	public String getCommuDay() {
		return commuDay;
	}
	public void setCommuDay(String commuDay) {
		this.commuDay = commuDay;
	}
	public String getFacilityCategory() {
		return facilityCategory;
	}
	public void setFacilityCategory(String facilityCategory) {
		this.facilityCategory = facilityCategory;
	}
	public communityDTO(int commuNum, String commuTitle, String commuContent, int fileNum, String memberID,
			int commuLike, int commuView, String commuDay, String facilityCategory) {
		super();
		this.commuNum = commuNum;
		this.commuTitle = commuTitle;
		this.commuContent = commuContent;
		this.fileNum = fileNum;
		this.memberID = memberID;
		this.commuLike = commuLike;
		this.commuView = commuView;
		this.commuDay = commuDay;
		this.facilityCategory = facilityCategory;
	}
	
	public communityDTO() {
		
	}
	
}
