package com.izitable.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.izitable.model.Shop;
import com.izitable.model.User;

//다수의 컨트롤러 실행 전후에 수행해야하는 공통작업들은
//핸들러인터셉터를 사용하여 구현 가능

//@WebFilter()로 등록하거나 설정파일(web.xml)에 등록
public class ShopInterceptor implements HandlerInterceptor{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 컨트롤러 실행 전에 실행되는 메서드
		// handler : 현재 인터셉터 이후에 실행될 인터셉터 또는 컨트롤러
		// 반환값 : 이후에 실행될 인터셉터 또는 컨트롤러의 실행 여부
		
		//요청보낸 사용자의 세션을 가져와서 
		HttpSession session = request.getSession();
		
		//세션에 로그인 정보를 꺼내와서
		Shop shop = (Shop) session.getAttribute("shop"); 
		
		//로그인 정보가 없다면,
		if (shop==null) {
		
			//로그인 페이지로 이동
			response.sendRedirect(request.getContextPath() + "/login"); // 로그인 화면으로 이동
			return false; //컨트롤러 실행하지 않음
		}
		
		return true; //컨트롤러 실행 //else는 굳이 안 적어줘도 됨, if에서 이미 return 해버렸으므로,
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

}
