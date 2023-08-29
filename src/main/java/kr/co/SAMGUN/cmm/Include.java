package kr.co.SAMGUN.cmm;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/include")
public class Include extends HttpServlet {
	
	@RequestMapping(value = "/header.do")
	public String header(HttpServletRequest request, HttpServletResponse response) {
		return "include/header";
	}
	
	@RequestMapping(value = "/calendar.do")
	public String calendar(HttpServletRequest request, HttpServletResponse response) {
		return "include/calendar";
	}
	
}
