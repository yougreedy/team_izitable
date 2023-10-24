package com.izitable.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.izitable.dao.BookingDao;
import com.izitable.model.Pager;
import com.izitable.model.ShopTable;
import com.izitable.model.ShopTime;
import com.izitable.model.Booking;

@Service
public class BookingServiceImpl implements BookingService {

	@Autowired
	BookingDao dao;

	@Override
	public void add(Booking item) {
        dao.add(item);		
	}

	@Override
	public List<Booking> userBookingList(Booking booking) {
		return dao.userBookingList(booking);
	}

	@Override
	public void userBookingDelete(int bookingNo) {
		dao.userBookingDelete(bookingNo);
	}

	@Override
	public List<Booking> shopBookingList(Booking booking) {
		return dao.shopBookingList(booking);
	}

	@Override
	public void shopBookingUpdate(Booking booking) {
		dao.shopBookingUpdate(booking);
	}

	@Override
	public void shopBookingDelete(int shopNo) {
		dao.shopBookingDelete(shopNo);
	}

	@Override
	public List<Booking> list(Pager pager) {
		int total = dao.total(pager);

		pager.setTotal(total);
		
		return dao.list(pager);
	}

	@Override
	public int totalShop(int shopNo) {
		return dao.totalShop(shopNo);
	}
	
	@Override
	public int totalUser(int userNo) {
		return dao.totalUser(userNo);
	}

	
	@Override
	public List<ShopTime> bookingTimeList(ShopTime shopTime) {
		return dao.bookingTimeList(shopTime);
	}

	@Override
	public List<ShopTable> bookingTableList(ShopTable shopTable) {
		return dao.bookingTableList(shopTable);
	}

	
	@Override
	public ShopTable selectTable(ShopTable st) {
		return dao.selectTable(st);
	}
}
