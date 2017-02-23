package com.kst.shopmall.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kst.shopmall.vo.User;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		
		//로그인 정보를 user에 담음
		User user = (User)request.getSession().getAttribute("login");

		
		if(user==null){
			
			response.sendRedirect("/login");
			
			System.out.println("로그인이 안되있어서 컨트롤러에 접근이 불가~");
			return false;
		}else{
			System.out.println("로그인이 되있어서 컨트롤러에 접근 가능~");
			return true;
			
		}//if end

	}
}
