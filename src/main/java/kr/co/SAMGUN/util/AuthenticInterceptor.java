package kr.co.SAMGUN.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.TreeSet;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.mvc.WebContentInterceptor;


public class AuthenticInterceptor extends WebContentInterceptor {
	
//	@Override
//	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws ServletException  {
//		System.out.println("preHandle");
////		request.getRequestURL();
//		String uriStr = (String)request.getRequestURI();
//	  
//		//session 체크가 필요한 페이지
//		if ( uriStr.indexOf("/review/") > -1) {
//			
//			HttpSession session = request.getSession(false); //false 로 하면 세션이 없으면 null  true 일때는 세션이 없으면 세션을 생성한다.
//			if(session.getAttribute("mId") == null) {
//				String url = request.getContextPath() + "/tmp/common/login.do";  //로그인 화면으로 이동한다.
//				try {
//					response.sendRedirect(url);
//				} catch (IOException e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}
//
//				return false;
//			}
//		}
//		
//		return true;
//	}
//	
//	
//	@Override
//    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
//		System.out.println("postHandle");
//	}
}