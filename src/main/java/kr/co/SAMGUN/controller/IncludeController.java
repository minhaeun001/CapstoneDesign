package kr.co.SAMGUN.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.SAMGUN.service.MypageService;
import kr.co.SAMGUN.util.SHA256;

@Controller
@RequestMapping("/include")
public class IncludeController {
	
	private static final Logger logger = LoggerFactory.getLogger(IncludeController.class);

	
	@RequestMapping("/running.do")
	public String running(HttpServletRequest request , HttpServletResponse response, ModelMap model ) {
		//클라이언트에서 넘어온 변수를  map 에 자동으로 할당함
		//Map<String,String> hm = RequestUtil.requestToMap(request) ;
		logger.info("프로그램:" + "include/running");
		return "include/running";
	}
	
	@RequestMapping("/mypage_change.do")
	public String mypage_change(HttpServletRequest request , HttpServletResponse response, ModelMap model ) {
		//클라이언트에서 넘어온 변수를  map 에 자동으로 할당함
		//Map<String,String> hm = RequestUtil.requestToMap(request) ;
		logger.info("프로그램:" + "include/mypage_change");
		return "include/mypage_change";
	}
	
	@RequestMapping("/with_draw.do")
	public String with_draw(HttpServletRequest request , HttpServletResponse response, ModelMap model ) {
		//클라이언트에서 넘어온 변수를  map 에 자동으로 할당함
		//Map<String,String> hm = RequestUtil.requestToMap(request) ;
		logger.info("프로그램:" + "include/with_draw");
		return "include/with_draw";
	}
}