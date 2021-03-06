package com.kh.myjob.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)throws Exception {
		HttpSession session = request.getSession();
		

		String prevPath = request.getHeader("referer");
		String contextPath = "http://localhost:8081";
		
		String prevRequestUrl = prevPath.substring(contextPath.length());
		
		
		Object result = session.getAttribute("loginInfo");
		
		if(result == null) {
			response.sendRedirect("/member/login?prevRequestUrl=" + prevRequestUrl);
			return false;
		}
		return true;
	}

	
	 
}
