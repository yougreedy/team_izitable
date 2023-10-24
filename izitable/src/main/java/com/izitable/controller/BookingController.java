package com.izitable.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.izitable.model.Booking;
import com.izitable.model.Shop;
import com.izitable.model.ShopTable;
import com.izitable.model.ShopTime;
import com.izitable.service.BookingService;
import com.izitable.service.ShopService;

@Controller
@RequestMapping("/booking")
public class BookingController {

	final String path = "booking/";
	
	@Autowired
	BookingService bookingservice;
	
	@Autowired
	ShopService shopService;
	
	//매장 상세정보
	@GetMapping("/{shopNo}")
	String item(@PathVariable int shopNo, Model model) {
		Shop item = shopService.item(shopNo);
		
		model.addAttribute("info", item);
		
		return "shop/shopList";
	}
	
	//예약 추가
	@SuppressWarnings("null")
	@PostMapping("/add")
    String add(Booking item, ShopTable st) {
		
		//예약한 테이블 정보 가져오기 (테이블 이름, 테이블 번호)
		st.setShopNo(item.getShopNo());
		if (item.getBookingMemNum() == 1 || item.getBookingMemNum() == 2) st.setTableNumber(2);
		else if ((item.getBookingMemNum() == 3 || item.getBookingMemNum() == 4)) st.setTableNumber(4);
		else if ((item.getBookingMemNum() == 5 || item.getBookingMemNum() == 6)) st.setTableNumber(6);
		ShopTable stitem = bookingservice.selectTable(st);
		item.setTableNo(stitem.getTableNo());
		item.setTableNumber(stitem.getTableNumber());
		item.setTableName(stitem.getTableName());
		
		bookingservice.add(item);
		
		return path + "confirm";
	}
	
	//예약 페이지 이동
	@GetMapping("/shop/{shopNo}")
	String booking(@PathVariable int shopNo, Shop shop, Model model) {
		
		//조회수 1증가
		shopService.viewCount(shopNo);
		
		Shop item = shopService.item(shopNo);
		
		model.addAttribute("shop", item);
		
		return path + "booking";
	}
	
	//날짜(bookingDate) - 요일(timeDay) - 영업시간(timeHour) - 예약시간(bookingTime)
	@PostMapping("/time")
	@ResponseBody
	List<ShopTime> time(ShopTime shopTime) {
		List<ShopTime> list = bookingservice.bookingTimeList(shopTime);
		System.out.println(list.get(0).getTimeHour());
		
		return list;
	}
	
	//예약시간(bookingTime) - 테이블인원(tableNumber) - 예약인원(bookingMemNum)
	@PostMapping("/memNum")
	@ResponseBody
	List<ShopTable> memNum(ShopTable shopTable){
		List<ShopTable> list = bookingservice.bookingTableList(shopTable);
		System.out.println(list.get(0).getTableNumber());
		
		/* null pointer exception 발생..
		List<Integer> memNum = null;
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getTableNumber() == 2) {
				memNum.add(1);
				memNum.add(2);
			} else if (list.get(i).getTableNumber() == 4) {
				memNum.add(3);
				memNum.add(4);
			} else if (list.get(i).getTableNumber() == 6) {
				memNum.add(5);
				memNum.add(6);
			}
		}
		*/
		
		return list;
	}
	
}
