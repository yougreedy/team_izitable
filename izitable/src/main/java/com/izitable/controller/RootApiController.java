package com.izitable.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.izitable.model.Shop;
import com.izitable.service.ShopService;
import com.izitable.service.UserService;

@Controller
@RequestMapping("/api")
public class RootApiController {
	
	final String path = "/";
	
	@Autowired
	UserService userService;
	
	@Autowired
	ShopService shopService;	
	
	//매장 목록 (메인 페이지)
	@GetMapping("/list")
	String list() {
		
		return path + "shopList";
	}
	
	//매장 목록 (필터) 
	@PostMapping("/list")
	@ResponseBody
	List<Shop> list(Shop shop) {
		
		//System.out.println(shop.getCity());
		
		List<Shop> list = shopService.list(shop);
		
		return list;
	}
	
	//매장 상세정보
	@GetMapping("/item/{shopNo}")
	String item(@PathVariable int shopNo, Model model) {
		Shop item = shopService.item(shopNo);
		
		model.addAttribute("info", item);
		
		return path + "shopList";
	}
	
	
	/*
	@PostMapping("/si")
	@ResponseBody
	List<Shop> si() {
		
		List<Shop> list = shopService.siList();
		
		return list;
	}
	
	@PostMapping("/gu")
	@ResponseBody
	List<Shop> gu(Shop shop) {
		
		List<Shop> list = shopService.guList(shop);
		
		return list;
	}
	
	@PostMapping("/dong")
	@ResponseBody
	List<Shop> dong(Shop shop) {
		
		List<Shop> list = shopService.dongList(shop);
		
		return list;
	}
	*/

}
