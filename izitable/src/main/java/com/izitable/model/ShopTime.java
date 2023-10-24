package com.izitable.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ShopTime {
	
	//tbl_shop_time
	private int timeNo;
	private String timeDay;
	private String timeHour;
	
	private int shopNo;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date bookingDate;
	
	private int startTime;		//영업 시작시간
	private int endTime;		//영업 끝시간
	
	public int getStartTime() {
		return startTime;
	}
	public void setStartTime(int startTime) {
		this.startTime = startTime;
	}
	public int getEndTime() {
		return endTime;
	}
	public void setEndTime(int endTime) {
		this.endTime = endTime;
	}

	public int getShopNo() {
		return shopNo;
	}

	public void setShopNo(int shopNo) {
		this.shopNo = shopNo;
	}

	public Date getBookingDate() {
		return bookingDate;
	}

	public void setBookingDate(Date bookingDate) {
		this.bookingDate = bookingDate;
	}

	public int getTimeNo() {
		return timeNo;
	}

	public void setTimeNo(int timeNo) {
		this.timeNo = timeNo;
	}

	public String getTimeDay() {
		return timeDay;
	}

	public void setTimeDay(String timeDay) {
		this.timeDay = timeDay;
	}

	public String getTimeHour() {
		return timeHour;
	}

	public void setTimeHour(String timeHour) {
		this.timeHour = timeHour;
	}

}
