package kr.co.SAMGUN.cmm;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

public class RequestMap  {
	
	private static final Logger logger = LoggerFactory.getLogger(RequestMap.class);
	
	@SuppressWarnings("rawtypes")
	public static HashMap<String, String> requestMap( HttpServletRequest request, String sManagerId) throws UnsupportedEncodingException {
		logger.debug("requestMap 도착");
		
		Enumeration e = request.getParameterNames();
		HashMap<String, String> hm = new HashMap<String, String>();
		while ( e.hasMoreElements() ){
			String name = (String) e.nextElement();
			String[] values = request.getParameterValues(name);		
			for (String value : values) {
				System.out.println("name=" + name + ",value=" + value);
				hm.put(name, value);
				
			}   
		}
		
		hm.put("sManagerId", sManagerId);
		
		return hm;
	
	}

	
	@SuppressWarnings("rawtypes")
	public static HashMap<String, String> requestMap( HttpServletRequest request, String sManagerId, Boolean utfBool) throws UnsupportedEncodingException {
		logger.debug("requestMap 도착");
		if (utfBool) {
			request.setCharacterEncoding("utf-8");
		}
		Enumeration e = request.getParameterNames();
		HashMap<String, String> hm = new HashMap<String, String>() ;
		while ( e.hasMoreElements() ){
			String name = (String) e.nextElement();
			String[] values = request.getParameterValues(name);		
			for (String value : values) {
				System.out.println("name=" + name + ",value=" + value);
				hm.put(name, value);
				
			}   
		}
		
		return hm;
	
	}


}
