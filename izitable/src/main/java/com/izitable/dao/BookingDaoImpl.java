package com.izitable.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.izitable.model.Pager;
import com.izitable.model.ShopTable;
import com.izitable.model.ShopTime;
import com.izitable.model.Booking;

@Repository
public class BookingDaoImpl implements BookingDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public void add(Booking item) {
        sql.insert("booking.add", item);
	}

	@Override
	public List<Booking> userBookingList(Booking booking) {
		return sql.selectList("booking.userBookingList", booking);
	}

	@Override
	public void userBookingDelete(int bookingNo) {
		sql.delete("booking.userBookingDelete", bookingNo);
	}

	@Override
	public List<Booking> shopBookingList(Booking booking) {
		return sql.selectList("booking.shopBookingList", booking);
	}

	@Override
	public void shopBookingUpdate(Booking booking) {
		sql.update("booking.shopBookingUpdate", booking);
	}

	@Override
	public void shopBookingDelete(int shopNo) {
		sql.delete("booking.userBookingDelete", shopNo);
	}

	@Override
	public List<Booking> list(Pager pager) {
		return sql.selectList("booking.list", pager);
	}

	@Override
	public int total(Pager pager) {
		return sql.selectOne("booking.total", pager);
	}

	@Override
	public int totalShop(int shopNo) {
		return sql.selectOne("booking.totalShop", shopNo);
	}

	@Override
	public int totalUser(int userNo) {
		return sql.selectOne("booking.totalUser", userNo);
	}

	
	@Override
	public List<ShopTime> bookingTimeList(ShopTime shopTime) {
		return sql.selectList("booking.bookingTimeList", shopTime);
	}

	@Override
	public List<ShopTable> bookingTableList(ShopTable shopTable) {
		return sql.selectList("booking.bookingTableList", shopTable);
	}

	
	@Override
	public ShopTable selectTable(ShopTable st) {
		return sql.selectOne("booking.selectTable", st);
	}

}
