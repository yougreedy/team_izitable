package com.izitable.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.izitable.model.Booking;
import com.izitable.model.Image;
import com.izitable.model.Pager;
import com.izitable.model.Shop;
import com.izitable.model.ShopTable;
import com.izitable.model.ShopTime;
import com.izitable.model.User;
import com.izitable.service.BookingService;
import com.izitable.service.ShopService;

@Controller
@RequestMapping("/shop")
public class ShopController {
	final String path = "shop/";
	
	@Autowired
	ShopService shopService;
	
	@Autowired
	BookingService bookingService;
	
	//매장 프로필 사진 업로드 경로
	private String uploadPath = "D:/upload/";
		
	List<Image> list = new ArrayList<Image>();
	
	
	//매장 정보 변경
	@GetMapping("/update/{shopNo}")
	String update(@PathVariable int shopNo, Model model) {
		
		Shop item = shopService.item(shopNo);
		
		model.addAttribute("item", item);
		
		return path + "shopUpdate";
	}
	
	//매장 정보 변경
	String webPath = "/upload/";
	@PostMapping("/update/{shopNo}")
	String update(Shop item, Image image, HttpServletRequest req) throws IOException {
		
		//매장 프로필 사진 업로드
		MultipartFile file = image.getUploadFile();
		System.out.println(file.getOriginalFilename());
		
		String folderPath = req.getSession().getServletContext().getRealPath(webPath);
		System.out.println(folderPath);
		
		if(file != null && !file.isEmpty()) {
			String filename = file.getOriginalFilename();
			String extension = filename.substring(filename.lastIndexOf("."));
	        String randomFileName = generateRandomFileName() + extension;
	        
	        String filePath = folderPath + randomFileName;
			
			
			//file.transferTo(new File(uploadPath  + filename));
			file.transferTo(new File(filePath));
			
			System.out.println(file.getOriginalFilename());
			
			list.add(image);
			
			item.setImgFilename(randomFileName);
		}
		
		shopService.update(item);
		
		return "redirect:./{shopNo}";
	}
	
	// 파일명을 난수로 생성하는 함수
	private String generateRandomFileName() {
	    // 파일명을 난수로 생성하는 로직을 구현
	    String uuid = UUID.randomUUID().toString();
	    return uuid;
	}
	
	//매장 페이지 예약 목록
	@GetMapping("/booking/{shopNo}")
	String shopBookingList(@PathVariable int shopNo, Pager pager, Model model, HttpSession session, Booking booking) {
		
		String msg = (String) session.getAttribute("msg");
		if(msg != null) {
			model.addAttribute("msg", msg);
			session.removeAttribute("msg");
		}
		
		int total = (int) bookingService.totalShop(shopNo);
		pager.setTotal(total);
		model.addAttribute("pager", pager);
		
		pager.setKeyword("");
		pager.setPerPage(5);
		booking.setPerPage(5);
		booking.setUserNo(shopNo);
		
		List<Booking> list = bookingService.shopBookingList(booking);		
		
		model.addAttribute("list", list);
		
		model.addAttribute("shopNo", shopNo);
		
		return path + "shopBookingList";
	}
	
	//매장 페이지 예약 수정
	@PostMapping("/booking/{shopNo}/update/{bookingNo}")
	String shopBookingUpdate(@PathVariable int shopNo, @PathVariable int bookingNo, Booking booking, Model model) {
		booking.setShopNo(shopNo);
		booking.setBookingNo(bookingNo);
		bookingService.shopBookingUpdate(booking);
		
		//return path + "bookingList";
		return "redirect:../";
	}
	
	//매장 페이지 예약 삭제
	@GetMapping("/booking/{shopNo}/delete/{bookingNo}")
	String shopBookingDelete(@PathVariable int shopNo, @PathVariable int bookingNo, Model model) {
		
		bookingService.shopBookingDelete(shopNo);
		
		//return path + "bookingList";
		return "redirect:../";
	}
	
	//매장 설정
	@GetMapping("/setting/{shopNo}")
	String shopSetting(@PathVariable int shopNo, ShopTime shopTm, ShopTable shopTb, Model model, /*String timeDay,*/ Pager pager, @RequestParam(value = "timeDay", required = false) String timeDay, HttpSession session) {
		if (timeDay != null) shopTm.setTimeDay(timeDay);
		else shopTm.setTimeDay("2");
		
		shopTb.setShopNo(shopNo);

		int total = (int) shopService.totalShopTable(shopNo);
		pager.setTotal(total);
		model.addAttribute("pager", pager);
		
		pager.setKeyword("");
		pager.setPerPage(5);
		shopTb.setPerPage(5);
		shopTb.setShopNo(shopNo);
		
		
		List<Shop> timelist = shopService.shopSettingTimeList(shopTm);
		List<Shop> tablelist = shopService.shopSettingTableList(shopTb);
		
		model.addAttribute("timelist", timelist);
		model.addAttribute("tablelist", tablelist);
		model.addAttribute("timeDay", shopTm.getTimeDay());
		
		String msg = (String) session.getAttribute("msg");
		session.removeAttribute("msg");
		model.addAttribute("msg", msg);
		
		return path + "shopSetting";
	}
	
	//매장 시간대 등록
	@PostMapping("/setting/{shopNo}/addtime")
	String shopSettingTimeAdd(@PathVariable int shopNo, ShopTime shopTm, HttpSession session, RedirectAttributes redirect) {
		shopTm.setShopNo(shopNo);
		
		for (int i=shopTm.getStartTime(); i<=shopTm.getEndTime(); i++) {
			shopTm.setTimeHour(String.valueOf(i));
			int checkCnt = shopService.shopSettingTimeCheck(shopTm);
			if (checkCnt == 0) shopService.shopSettingTimeAdd(shopTm);
			else session.setAttribute("msg", "이미 존재하는 영업시간입니다");
		}		
		
		session.setAttribute("shopTm", shopTm);
		
		redirect.addAttribute("timeDay", shopTm.getTimeDay());
		
		return "redirect:.";
	}
	
	//매장 시간대 삭제
	@GetMapping("/setting/{shopNo}/deleteTime/{timeNo}")
	String shopSettingTimeDel(@PathVariable int shopNo, @PathVariable int timeNo, RedirectAttributes redirect) {
		
		ShopTime shopTm = shopService.shopSettingTimeItem(timeNo);
		redirect.addAttribute("timeDay", shopTm.getTimeDay());
		
		shopService.shopSettingTimeDel(timeNo);
		
		System.out.println(shopTm.getTimeDay());
		
		return "redirect:../";
	}
	
	//매장 테이블 등록
	@PostMapping("/setting/{shopNo}/addtable")
	String shopSettingTableAdd(@PathVariable int shopNo, ShopTable shopTb) {
		shopTb.setShopNo(shopNo);
		shopService.shopSettingTableAdd(shopTb);
		
		return "redirect:.";
	}
	
	//매장 테이블 삭제
	@GetMapping("/setting/{shopNo}/deleteTable/{tableNo}")
	String shopSettingTableDel(@PathVariable int shopNo, @PathVariable int tableNo) {
		
		shopService.shopSettingTableDel(tableNo);
		
		return "redirect:../";
	}

}
