package com.izitable.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.izitable.model.User;

public class AdminInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		
		User user = (User) session.getAttribute("user");
		if(user != null) { //로그인 한 경우
			if(!user.getUserEmail().equals("admin@izitable.com") ) { //일반 유저인 경우
				response.sendRedirect("/"); // 처음 페이지로 보냄
				return false;
			}
			return true;
		}
		
		response.sendRedirect("/login"); //로그인 안 한 경우, login 페이지로 보냄
		
		return false;
	}
	
}
