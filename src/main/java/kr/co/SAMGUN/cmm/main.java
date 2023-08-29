package kr.co.SAMGUN.cmm;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/main")
public class main{
	
	private static final Logger logger = LoggerFactory.getLogger(main.class);
	
	@RequestMapping(value = "/index.do")
	public String index(HttpServletRequest request, HttpServletResponse response ,Model model, RedirectAttributes redirect) {
		
		return "main/index";
	}
	
	@RequestMapping(value = "/login.do")
	public String login(HttpServletRequest request, HttpServletResponse response, Model model) {
		return "main/login";
	}
	
	@RequestMapping(value = "/join.do")
	public String join(HttpServletRequest request, HttpServletResponse response, Model model) {
		return "main/join";
	}
	
	@RequestMapping(value = "/logout.do")
	public String logout(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		HttpSession session = request.getSession();
		session.invalidate();
		
//		String sessionMsg = "";
//		
//		session.setAttribute("sessionMsg", sessionMsg);
//		
		
		return "jsonView";
	}
	
}
