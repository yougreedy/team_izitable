package com.izitable.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.izitable.model.Image;
import com.izitable.model.Pager;
import com.izitable.model.Shop;
import com.izitable.model.User;
import com.izitable.service.MailSendService;
import com.izitable.service.ShopService;
import com.izitable.service.UserService;

@Controller
public class RootController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	ShopService shopService;
	
	@Autowired
	MailSendService mailservice;
	
	
	//매장 프로필 사진 업로드 경로
	private String uploadPath = "D:/upload/";
	
	List<Image> list = new ArrayList<Image>();
	
	
	//메인 페이지
	@GetMapping("/")
	String index(HttpSession session, Model model, Pager pager) {
		String msg = (String) session.getAttribute("msg");
		
		if(msg != null) {
			model.addAttribute("msg", msg);
			session.removeAttribute("msg");
		}

		pager.setKeyword("");
		pager.setPerPage(5);
		List<Shop> list = shopService.list_popular(pager);
		model.addAttribute("list", list);
		
		return "main";
	}
	
	//로그인
	@GetMapping("/login")
	public String login(HttpSession session, Model model) {
		
		//기존에 로그인 정보가 있다면 강제 로그아웃
		Shop shop = (Shop) session.getAttribute("shop");
		User user = (User) session.getAttribute("user");
		if (shop != null) session.removeAttribute("shop");
		if (user != null) session.removeAttribute("user");
		
		String msg = (String) session.getAttribute("msg");
		
		if(msg != null) {
			model.addAttribute("msg", msg);
			session.removeAttribute("msg");
		}
		
		return "login";
	}
	
	@PostMapping("/login")
	String login(User user, Shop shop, HttpSession session) {
		//매장 로그인
		if (shop.getShopEmail() != null) {
			
			Boolean result = shopService.login(shop); //return값을 true, false로 받기 위해 Boolean으로 result 받음
			
			if(result) { //result가 true면 로그인 되었다 => session에 사용자 정보를 저장			
				session.setAttribute("msg", "환영합니다");
				session.setAttribute("shop", shop); //result가 Boolean 타입이므로, item을 받아야 Customer 정보가 담아짐,
				return "redirect:/shop/booking/"+shop.getShopNo();
			}
			
			else {
				session.setAttribute("msg", "로그인에 실패하였습니다");
				return "redirect:/login";	
			}
			
		}
		//일반 로그인
		else {
		
			Boolean result = userService.login(user); //return값을 true, false로 받기 위해 Boolean으로 result 받음
			
			if(result) { //result가 true면 로그인 되었다 => session에 사용자 정보를 저장			
				session.setAttribute("msg", "환영합니다");
				session.setAttribute("user", user); //result가 Boolean 타입이므로, item을 받아야 Customer 정보가 담아짐,
			}
			
			else {
				session.setAttribute("msg", "로그인에 실패하였습니다");
				return "redirect:/login";
			}
		}
		
		/*
		String target = (String) session.getAttribute("target");
		System.out.println(target);
		if ( target != null ) 
			return "redirect:" + target; //target에서 기존 url 꺼내서 보냄
		else 
		*/	
			return "redirect:/";
	}
	
	//카카오 로그인
	@PostMapping("/kakaoLogin")
	public String kakaoLogin(@ModelAttribute("userVO") User user, HttpServletRequest request, ModelMap model, HttpSession session ) {
		//model에 값이 있는지 확인한다. 
		user.setUserPwd(user.getUserEmail());
		User userVO = userService.actionlogin(user);
		if(userVO != null && userVO.getUserEmail() != null && !userVO.getUserEmail().equals("") && userVO.getUserPhone().equals("kakao가입자") ) {
			
			if(userVO.getUserEmail() != null && userVO.getUserName() != null) {
				request.getSession().setAttribute("user", userVO);
				return "redirect:/";
			
			}else {
				model.addAttribute("loginMessage", "fail.common.login"); //로그인 정보가 올바르지 않습니다.	
				return "redirect:/login";
				}
		}
		else {
			User kakao = user;
			kakao.setUserEmail(user.getUserEmail());
			kakao.setUserPwd("");
			kakao.setUserName(user.getUserName());
			kakao.setUserPhone("kakao가입자");
			kakao.setUserPhoneCert(kakao.getUserPhoneCert());
			userService.addKakao(kakao);
			
			session.setAttribute("user", kakao);
		}
		return "redirect:/";
	}
	
	
	//로그아웃
	@GetMapping("/logout")
	String logout(HttpSession session) {
		session.invalidate(); //session에 있는 정보 무효화 => 모든 정보가 없어짐
		
		return "redirect:/";
	}
	
	
	//약관 동의
	@GetMapping("/siteUseAgree")
	String siteUseAgree() {
		return "join/SiteUseAgree";
	}
	
	//회원가입 유형
	@RequestMapping("/joinType")
	//@PostMapping("/joinType")
	String joinType() {
		return "join/joinType";
	}
	
	//회원가입 (일반회원)
	@GetMapping("/join/user")
	String joinUser(@ModelAttribute("searchVO") User user, HttpServletRequest request, ModelMap model) {
		
		return "join/joinUser";
	}
	
	//회원가입 (매장)
	@GetMapping("/join/shop")
	String joinShop() {
		return "join/joinShop";
	}
	
	
	String webPath = "/upload/";
	@PostMapping("/join")
	String join(User user, Shop shop, Image image, HttpServletRequest req) throws IOException {
		if (user.getUserEmail() != null) userService.add(user);
		else {
			shop.setCompAddr1( shop.getCompAddr1() + " " + shop.getDetailAddr() ); 
			shop.setCompAddr2( shop.getCompAddr2() + " " + shop.getDetailAddr() );
			
			//매장 프로필 사진 업로드
			MultipartFile file = image.getUploadFile();
			System.out.println(file.getOriginalFilename());
			
			String folderPath = req.getSession().getServletContext().getRealPath(webPath);
			
			System.out.println(folderPath);
			
			if(file != null && !file.isEmpty()) {
				String filename = file.getOriginalFilename();
				String extension = filename.substring(filename.lastIndexOf("."));
	            String randomFileName = generateRandomFileName() + extension;
	            
	            //파일 저장 경로
	            String filePath = folderPath + randomFileName;
				
				//file.transferTo(new File(uploadPath  + filename));
				file.transferTo(new File(filePath));
				
				System.out.println(file.getOriginalFilename());
				
				list.add(image);
				
				shop.setImgFilename(randomFileName);
			}
			
			shopService.add(shop);
		}
		
		return "join/joinComplete";
	}
	
	// 파일명을 난수로 생성하는 함수
	private String generateRandomFileName() {
	    // UUID를 사용하여 파일명을 생성
	    return UUID.randomUUID().toString();
	}
	
	//아이디 중복체크
	@ResponseBody
	@GetMapping("/join/duplicateCheck")
	public HashMap<String, String> duplicateCheck(String email, HttpSession session) {
		String successYn = "Y";
		String message = "성공";
		
		
		HashMap<String, String> jo = new HashMap<String, String>();
		// response.setContentType("application/json; charset=utf-8"); 
		System.out.println(email);
		int duplicateCnt = userService.duplicateCheck(email); //일반 회원 가입의 경우 중복 체크
		
		
		if(duplicateCnt == 0)
			duplicateCnt = shopService.duplicateCheck(email); //매장 가입의 경우 중복 체크
		
		if(duplicateCnt > 0) {
			successYn = "N";
			message = "이미 사용중인 이메일입니다.";
		}
		//이메일인증
		else {
			System.out.println("이메일 인증 요청");
			System.out.println("이메일 인증 이메일 :" + email);
				
			mailservice.joinEmail(email);
		
		}

		jo.put("successYn", successYn);
		jo.put("message", message);
		
		return jo;
	}
	
	/*
	@ResponseBody //viewResolver한테 줘서 jsp 파일을 찾지 말고, 그대로 client에 보여줘라,
	@GetMapping("/checkId/{custid}")
	String checkId(@PathVariable String custid) {
		if(customerService.item(custid) == null) //true면 ID 사용 가능, false면 사용 불가능
			return "OK";		
		else
			return "FAIL";
	}
	*/
	
	final String path = "shop/";
	
	//매장 목록 (음식점)
	@GetMapping("/list")
	String list(Model model, Pager pager) {
		
		List<Shop> list = shopService.list_map(pager);
		
		model.addAttribute("list", list);
		
		return path + "shopList";
	}
	
	//매장 목록 (필터) 
	@PostMapping("/list")
	String list(Model model, @ModelAttribute("Shop") Shop shop) {
		
		//System.out.println(shop.getCity());
		
		List<Shop> list = shopService.list(shop);
		
		model.addAttribute("list", list);
		
		model.addAttribute("si", shop.getSi());
		model.addAttribute("gu", shop.getGu());
		model.addAttribute("dong", shop.getDong());
		model.addAttribute("categoryNo", shop.getCategoryNo());
		
		//List<Shop> silist = shopService.siList();
		List<Shop> gulist = shopService.guList(shop);
		List<Shop> donglist = shopService.dongList(shop);
		
		//model.addAttribute("silist", silist);
		model.addAttribute("gulist", gulist);
		model.addAttribute("donglist", donglist);
		
		return path + "shopList";
	}
	
	//매장 상세정보
	@GetMapping("/item/{shopNo}")
	String item(@PathVariable int shopNo, Model model) {
		Shop item = shopService.item(shopNo);
		
		model.addAttribute("info", item);
		
		return path + "shopList";
	}
	
}
