package com.izitable.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ShopTable extends Pager {
	
	//tbl_shop_table
	private int tableNo;
	private String tableName;
	private int tableNumber;
	
	private int shopNo;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date bookingDate;	//예약 날짜
	private String bookingTime;	//예약 시간
	
	
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

	public int getShopNo() {
		return shopNo;
	}

	public void setShopNo(int shopNo) {
		this.shopNo = shopNo;
	}

	public int getTableNo() {
		return tableNo;
	}

	public void setTableNo(int tableNo) {
		this.tableNo = tableNo;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public int getTableNumber() {
		return tableNumber;
	}

	public void setTableNumber(int tableNumber) {
		this.tableNumber = tableNumber;
	}

}
