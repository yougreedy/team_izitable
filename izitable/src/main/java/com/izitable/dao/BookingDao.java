package com.izitable.dao;

import java.util.Date;
import java.util.List;

import com.izitable.model.Pager;
import com.izitable.model.ShopTable;
import com.izitable.model.ShopTime;
import com.izitable.model.Booking;

public interface BookingDao {

	void add(Booking item);

	List<Booking> userBookingList(Booking booking);

	void userBookingDelete(int bookingNo);

	List<Booking> shopBookingList(Booking booking);

	void shopBookingUpdate(Booking booking);

	void shopBookingDelete(int shopNo);

	List<Booking> list(Pager pager);

	int total(Pager pager);

	int totalShop(int shopNo);

	int totalUser(int userNo);

	
	List<ShopTime> bookingTimeList(ShopTime shopTime);

	List<ShopTable> bookingTableList(ShopTable shopTable);

	
	ShopTable selectTable(ShopTable st);

}
