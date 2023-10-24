package com.izitable.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Booking extends Pager{
	
	private int bookingNo;		//예약 번호
	private int userNo;			//회원 번호
	private int shopNo;			//매장 번호
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date bookingDate;	//예약 날짜
	private String bookingTime;	//예약 시간
	private int bookingMemNum;	//예약 인원
	
	private String compName;	//매장 이름
	
	private String userEmail;	//회원 이메일
	private String userPhone;	//회원 연락처
	
	private String userName;	//회원 이름
	
	private String message;		//요청사항
	
	private int tableNo;		//테이블 번호
	private int tableNumber;	//테이블 인원수
	private String tableName;	//테이블 이름


	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public int getTableNo() {
		return tableNo;
	}

	public void setTableNo(int tableNo) {
		this.tableNo = tableNo;
	}

	public int getTableNumber() {
		return tableNumber;
	}

	public void setTableNumber(int tableNumber) {
		this.tableNumber = tableNumber;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public int getBookingNo() {
		return bookingNo;
	}

	public void setBookingNo(int bookingNo) {
		this.bookingNo = bookingNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
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

	public String getBookingTime() {
		return bookingTime;
	}

	public void setBookingTime(String bookingTime) {
		this.bookingTime = bookingTime;
	}

	public int getBookingMemNum() {
		return bookingMemNum;
	}

	public void setBookingMemNum(int bookingMemNum) {
		this.bookingMemNum = bookingMemNum;
	}

	public String getCompName() {
		return compName;
	}

	public void setCompName(String compName) {
		this.compName = compName;
	}
		
}
