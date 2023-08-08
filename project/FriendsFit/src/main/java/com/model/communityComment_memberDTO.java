package com.model;

public class communityComment_memberDTO {
	private String id;
	private int point;
	private String registerDate;
	private String content;
	private int like;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getRegisterDate() {
		return registerDate;
	}
	public void setRegisterDate(String registerDate) {
		this.registerDate = registerDate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getLike() {
		return like;
	}
	public void setLike(int like) {
		this.like = like;
	}
	public communityComment_memberDTO(String id, int point, String registerDate, String content, int like) {
		super();
		this.id = id;
		this.point = point;
		this.registerDate = registerDate;
		this.content = content;
		this.like = like;
	}
	
	public communityComment_memberDTO() {
		
	}
}
