package com.model;

public class communityCommentDTO {

	private int commentNum;
	private String commentContent;
	private String memberID;
	private int commuNum;
	private int commentLike;
	private String commentDay;
	public int getCommentNum() {
		return commentNum;
	}
	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public String getMemberID() {
		return memberID;
	}
	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}
	public int getCommuNum() {
		return commuNum;
	}
	public void setCommuNum(int commuNum) {
		this.commuNum = commuNum;
	}
	public int getCommentLike() {
		return commentLike;
	}
	public void setCommentLike(int commentLike) {
		this.commentLike = commentLike;
	}
	public String getCommentDay() {
		return commentDay;
	}
	public void setCommentDay(String commentDay) {
		this.commentDay = commentDay;
	}
	public communityCommentDTO(int commentNum, String commentContent, String memberID, int commuNum, int commentLike,
			String commentDay) {
		super();
		this.commentNum = commentNum;
		this.commentContent = commentContent;
		this.memberID = memberID;
		this.commuNum = commuNum;
		this.commentLike = commentLike;
		this.commentDay = commentDay;
	}

	public communityCommentDTO() {
		
	}
	
		
}
