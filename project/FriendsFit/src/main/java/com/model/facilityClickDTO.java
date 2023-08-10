package com.model;

public class facilityClickDTO {

	private int facilityNum;
	private String facilityName;
	private String facilityCategoy;
	private String facilityMainFacility;
	private String facilityTime;
	
	private String facilityTel;
	private String facilityPrice;
	private String facilityPayment;
	private String facilityAmenities;
	private String facilityHomepage;
	
	private String facilityTag;
	private String facilityInfo;
	private String facilityYear;
	private int facilitySize;
	private String facilityAddr;
	
	private double facilityX;
	private double facilityY;
	private String facilityDay;
	private int fileNum;
	private String facilityImageSrc;
	
	
	
	

	@Override
	public String toString() {
		return "facilityClickDTO [facilityNum=" + facilityNum + ", facilityName=" + facilityName + ", facilityCategoy="
				+ facilityCategoy + ", facilityMainFacility=" + facilityMainFacility + ", facilityTime=" + facilityTime
				+ ", facilityTel=" + facilityTel + ", facilityPrice=" + facilityPrice + ", facilityPayment="
				+ facilityPayment + ", facilityAmenities=" + facilityAmenities + ", facilityHomepage="
				+ facilityHomepage + ", facilityTag=" + facilityTag + ", facilityInfo=" + facilityInfo
				+ ", facilityYear=" + facilityYear + ", facilitySize=" + facilitySize + ", facilityAddr=" + facilityAddr
				+ ", facilityX=" + facilityX + ", facilityY=" + facilityY + ", facilityDay=" + facilityDay
				+ ", fileNum=" + fileNum + ", facilityImageSrc=" + facilityImageSrc + ", getFacilityNum()="
				+ getFacilityNum() + ", getFacilityName()=" + getFacilityName() + ", getFacilityCategoy()="
				+ getFacilityCategoy() + ", getFacilityMainFacility()=" + getFacilityMainFacility()
				+ ", getFacilityTime()=" + getFacilityTime() + ", getFacilityTel()=" + getFacilityTel()
				+ ", getFacilityPrice()=" + getFacilityPrice() + ", getFacilityPayment()=" + getFacilityPayment()
				+ ", getFacilityAmenities()=" + getFacilityAmenities() + ", getFacilityHomepage()="
				+ getFacilityHomepage() + ", getFacilityTag()=" + getFacilityTag() + ", getFacilityInfo()="
				+ getFacilityInfo() + ", getFacilityYear()=" + getFacilityYear() + ", getFacilitySize()="
				+ getFacilitySize() + ", getFacilityAddr()=" + getFacilityAddr() + ", getFacilityX()=" + getFacilityX()
				+ ", getFacilityY()=" + getFacilityY() + ", getFacilityDay()=" + getFacilityDay() + ", getFileNum()="
				+ getFileNum() + ", getFacilityImageSrc()=" + getFacilityImageSrc() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}





	public facilityClickDTO(int facilityNum, String facilityName, String facilityCategoy, String facilityMainFacility,
			String facilityTime, String facilityTel, String facilityPrice, String facilityPayment,
			String facilityAmenities, String facilityHomepage, String facilityTag, String facilityInfo,
			String facilityYear, int facilitySize, String facilityAddr, double facilityX, double facilityY,
			String facilityDay, int fileNum, String facilityImageSrc) {
		super();
		this.facilityNum = facilityNum;
		this.facilityName = facilityName;
		this.facilityCategoy = facilityCategoy;
		this.facilityMainFacility = facilityMainFacility;
		this.facilityTime = facilityTime;
		this.facilityTel = facilityTel;
		this.facilityPrice = facilityPrice;
		this.facilityPayment = facilityPayment;
		this.facilityAmenities = facilityAmenities;
		this.facilityHomepage = facilityHomepage;
		this.facilityTag = facilityTag;
		this.facilityInfo = facilityInfo;
		this.facilityYear = facilityYear;
		this.facilitySize = facilitySize;
		this.facilityAddr = facilityAddr;
		this.facilityX = facilityX;
		this.facilityY = facilityY;
		this.facilityDay = facilityDay;
		this.fileNum = fileNum;
		this.facilityImageSrc = facilityImageSrc;
	}





	public int getFacilityNum() {
		return facilityNum;
	}





	public void setFacilityNum(int facilityNum) {
		this.facilityNum = facilityNum;
	}





	public String getFacilityName() {
		return facilityName;
	}





	public void setFacilityName(String facilityName) {
		this.facilityName = facilityName;
	}





	public String getFacilityCategoy() {
		return facilityCategoy;
	}





	public void setFacilityCategoy(String facilityCategoy) {
		this.facilityCategoy = facilityCategoy;
	}





	public String getFacilityMainFacility() {
		return facilityMainFacility;
	}





	public void setFacilityMainFacility(String facilityMainFacility) {
		this.facilityMainFacility = facilityMainFacility;
	}





	public String getFacilityTime() {
		return facilityTime;
	}





	public void setFacilityTime(String facilityTime) {
		this.facilityTime = facilityTime;
	}





	public String getFacilityTel() {
		return facilityTel;
	}





	public void setFacilityTel(String facilityTel) {
		this.facilityTel = facilityTel;
	}





	public String getFacilityPrice() {
		return facilityPrice;
	}





	public void setFacilityPrice(String facilityPrice) {
		this.facilityPrice = facilityPrice;
	}





	public String getFacilityPayment() {
		return facilityPayment;
	}





	public void setFacilityPayment(String facilityPayment) {
		this.facilityPayment = facilityPayment;
	}





	public String getFacilityAmenities() {
		return facilityAmenities;
	}





	public void setFacilityAmenities(String facilityAmenities) {
		this.facilityAmenities = facilityAmenities;
	}





	public String getFacilityHomepage() {
		return facilityHomepage;
	}





	public void setFacilityHomepage(String facilityHomepage) {
		this.facilityHomepage = facilityHomepage;
	}





	public String getFacilityTag() {
		return facilityTag;
	}





	public void setFacilityTag(String facilityTag) {
		this.facilityTag = facilityTag;
	}





	public String getFacilityInfo() {
		return facilityInfo;
	}





	public void setFacilityInfo(String facilityInfo) {
		this.facilityInfo = facilityInfo;
	}





	public String getFacilityYear() {
		return facilityYear;
	}





	public void setFacilityYear(String facilityYear) {
		this.facilityYear = facilityYear;
	}





	public int getFacilitySize() {
		return facilitySize;
	}





	public void setFacilitySize(int facilitySize) {
		this.facilitySize = facilitySize;
	}





	public String getFacilityAddr() {
		return facilityAddr;
	}





	public void setFacilityAddr(String facilityAddr) {
		this.facilityAddr = facilityAddr;
	}





	public double getFacilityX() {
		return facilityX;
	}





	public void setFacilityX(double facilityX) {
		this.facilityX = facilityX;
	}





	public double getFacilityY() {
		return facilityY;
	}





	public void setFacilityY(double facilityY) {
		this.facilityY = facilityY;
	}





	public String getFacilityDay() {
		return facilityDay;
	}





	public void setFacilityDay(String facilityDay) {
		this.facilityDay = facilityDay;
	}





	public int getFileNum() {
		return fileNum;
	}





	public void setFileNum(int fileNum) {
		this.fileNum = fileNum;
	}





	public String getFacilityImageSrc() {
		return facilityImageSrc;
	}





	public void setFacilityImageSrc(String facilityImageSrc) {
		this.facilityImageSrc = facilityImageSrc;
	}





	public facilityClickDTO() {
		
	}
	
	
	
}
