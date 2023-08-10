package com.model;

public class columnDTO {

	private int columnNum;
	private String columnTitle;
	private String columnContent;
	private int fileNum;
	private String columnDay;
	
	private String columnWriter;
	
	
	
	public columnDTO(int columnNum, String columnTitle, String columnContent, int fileNum, String columnDay,
			String columnWriter) {
		super();
		this.columnNum = columnNum;
		this.columnTitle = columnTitle;
		this.columnContent = columnContent;
		this.fileNum = fileNum;
		this.columnDay = columnDay;
		this.columnWriter = columnWriter;
	}



	public int getColumnNum() {
		return columnNum;
	}



	public void setColumnNum(int columnNum) {
		this.columnNum = columnNum;
	}



	public String getColumnTitle() {
		return columnTitle;
	}



	public void setColumnTitle(String columnTitle) {
		this.columnTitle = columnTitle;
	}



	public String getColumnContent() {
		return columnContent;
	}



	public void setColumnContent(String columnContent) {
		this.columnContent = columnContent;
	}



	public int getFileNum() {
		return fileNum;
	}



	public void setFileNum(int fileNum) {
		this.fileNum = fileNum;
	}



	public String getColumnDay() {
		return columnDay;
	}



	public void setColumnDay(String columnDay) {
		this.columnDay = columnDay;
	}



	public String getColumnWriter() {
		return columnWriter;
	}



	public void setColumnWriter(String columnWriter) {
		this.columnWriter = columnWriter;
	}



	public columnDTO() {
		
	}
	
}
