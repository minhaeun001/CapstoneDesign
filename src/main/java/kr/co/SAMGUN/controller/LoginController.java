package kr.co.SAMGUN.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.SAMGUN.service.LoginService;
import kr.co.SAMGUN.service.NoticeService;

@Controller
@RequestMapping("/login")
public class LoginController {

	@Autowired
	LoginService loginService;
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	
	@RequestMapping("/login.do")
	public String login(HttpServletRequest request , HttpServletResponse response, ModelMap model ) {
		//클라이언트에서 넘어온 변수를  map 에 자동으로 할당함
		//Map<String,String> hm = RequestUtil.requestToMap(request) ;
		logger.info("프로그램:" + "login/login");
		return "login/login";
	}
	
	@RequestMapping("/signup.do")
	public String signup(HttpServletRequest request , HttpServletResponse response, ModelMap model ) {
		//클라이언트에서 넘어온 변수를  map 에 자동으로 할당함
		//Map<String,String> hm = RequestUtil.requestToMap(request) ;
		logger.info("프로그램:" + "login/signup");
		return "login/signup";
	}
	
	@RequestMapping("/member_signup.ajax")
	public String member_signup(HttpServletRequest request , HttpServletResponse response, ModelMap model ) {
		
		String m_id = request.getParameter("m_id");
		String m_pwd = request.getParameter("m_pwd");
		String m_nm = request.getParameter("m_nm");
		String m_hp = request.getParameter("m_hp");
		String m_email = request.getParameter("m_email");
		String m_birth = request.getParameter("m_birth");

		Map<String, Object> hm = new HashMap<String, Object>();
		hm.put("m_id", m_id);
		hm.put("m_pwd", m_pwd);
		hm.put("m_nm", m_nm);
		hm.put("m_hp", m_hp);
		hm.put("m_email", m_email);
		hm.put("m_birth", m_birth);
		
		int saveCnt = loginService.Signup(hm); //결과적으로 리턴받는 타입 int
		Map<String, Object> result = new HashMap<String, Object>();
		
		result.put("saveCnt",saveCnt);
		model.addAttribute("result",result);
		return "jsonView";
	}
}