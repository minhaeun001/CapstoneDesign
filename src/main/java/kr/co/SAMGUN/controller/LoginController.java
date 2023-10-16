package kr.co.SAMGUN.controller;

import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
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

import kr.co.SAMGUN.service.LoginService;
import kr.co.SAMGUN.service.NoticeService;
import kr.co.SAMGUN.util.SHA256;

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
	
	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest request , HttpServletResponse response, ModelMap model ) {
		//클라이언트에서 넘어온 변수를  map 에 자동으로 할당함
		//Map<String,String> hm = RequestUtil.requestToMap(request) ;
		HttpSession session = request.getSession(); 
	    session.invalidate();
		logger.info("프로그램:" + "main/intro");
		return "main/intro";
	}
	
	@RequestMapping("/signup.do")
	public String signup(HttpServletRequest request , HttpServletResponse response, ModelMap model ) {
		//클라이언트에서 넘어온 변수를  map 에 자동으로 할당함
		//Map<String,String> hm = RequestUtil.requestToMap(request) ;
		logger.info("프로그램:" + "login/signup");
		return "login/signup";
	}
	
	@RequestMapping("/find_id.do")
	public String find_id(HttpServletRequest request , HttpServletResponse response, ModelMap model ) {
		//클라이언트에서 넘어온 변수를  map 에 자동으로 할당함
		//Map<String,String> hm = RequestUtil.requestToMap(request) ;
		logger.info("프로그램:" + "login/find_id");
		return "login/find_id";
	}
	
	@RequestMapping("/find_pwd.do")
	public String find_pwd(HttpServletRequest request , HttpServletResponse response, ModelMap model ) {
		//클라이언트에서 넘어온 변수를  map 에 자동으로 할당함
		//Map<String,String> hm = RequestUtil.requestToMap(request) ;
		logger.info("프로그램:" + "login/find_pwd");
		return "login/find_pwd";
	}
	
	@RequestMapping("/pwd_modify.do")
	public String pwd_modify(HttpServletRequest request , HttpServletResponse response, ModelMap model ) {
		//클라이언트에서 넘어온 변수를  map 에 자동으로 할당함
		//Map<String,String> hm = RequestUtil.requestToMap(request) ;
		logger.info("프로그램:" + "login/pwd_modify");
		return "login/pwd_modify";
	}
	
	@RequestMapping("/member_signup.ajax")
	public String member_signup(HttpServletRequest request , HttpServletResponse response, ModelMap model ) throws NoSuchAlgorithmException {
		
		String m_id = request.getParameter("m_id");
		String m_pwd = request.getParameter("m_pwd");
		String m_nm = request.getParameter("m_nm");
		String m_hp = request.getParameter("m_hp");
		String m_email = request.getParameter("m_email");
		String m_birth = request.getParameter("m_birth");
		String use_yn = request.getParameter("use_yn");

		SHA256 sha256 = new SHA256();
		 
		m_pwd = sha256.encrypt(m_pwd); 
		
		Map<String, Object> hm = new HashMap<String, Object>();
		hm.put("m_id", m_id);
		hm.put("m_pwd", m_pwd);
		hm.put("m_nm", m_nm);
		hm.put("m_hp", m_hp);
		hm.put("m_email", m_email);
		hm.put("m_birth", m_birth);
		hm.put("use_yn", use_yn);
		
		int CheckCnt = loginService.CheckNumber(hm); //결과적으로 리턴받는 타입 int
		Map<String, Object> result = new HashMap<String, Object>();
		// 휴대폰 번호가 존재할 경우
		if (CheckCnt > 0) {
			result.put("flag", "F");
			result.put("msg", "이미 등록된 번호입니다.");
		} else {
			int saveCnt = loginService.Signup(hm); //결과적으로 리턴받는 타입 int
			if(saveCnt > 0) {
				result.put("flag", "T");
				result.put("msg", "회원가입 되었습니다. 로그인을 해주세요.");
			} else {
				result.put("flag", "F");
				result.put("msg", "오류가 발생하였습니다. 다시 진행해주세요.");
			}

		}
		
		model.addAttribute("result",result);
		
		return "jsonView";
	}

	@RequestMapping("/member_signupcheck.ajax")
	public String member_signupcheck(HttpServletRequest request , HttpServletResponse response, ModelMap model ) {
		
		String m_id = request.getParameter("m_id");

		Map<String, Object> hm = new HashMap<String, Object>();
		hm.put("m_id", m_id);
		
		List<Map<String, Object>> SignupCheck = loginService.SignupCheck(hm); //결과적으로 리턴받는 타입 int
		Map<String, Object> result = new HashMap<String, Object>();
		
		result.put("SignupCheck",SignupCheck);
		
		model.addAttribute("result",result);
		return "jsonView";
	}
	
	@RequestMapping("/checkLoginLogic.ajax")
	public String checkLoginLogic(HttpServletRequest request , HttpServletResponse response, ModelMap model ) throws NoSuchAlgorithmException {
		
		String m_id = request.getParameter("m_id");
		String m_pwd = request.getParameter("m_pwd");
		String m_nm = "";
		String m_grade = "";

		SHA256 sha256 = new SHA256();
		 
		m_pwd = sha256.encrypt(m_pwd); 
		
		Map<String, Object> hm = new HashMap<String, Object>();
		hm.put("m_id", m_id);
		hm.put("m_pwd", m_pwd);

		
		// 결과값을 담을 바구니
		Map<String, Object> result = new HashMap<String, Object>();
		
		// 결과값
		List<Map<String, Object>> checkLoginResult = loginService.checkLoginLogic(hm);
		if ("T".equals( hm.get("flag")) ) {
			
			
			HttpSession session = request.getSession();
			session.setAttribute("m_id", m_id);
			session.setAttribute("m_nm", (String)hm.get("m_nm"));
			session.setAttribute("m_grade", (String)hm.get("m_grade"));
			
		}
			
		result.put("checkLoginResult", checkLoginResult);
				
		model.addAttribute("result", result);
		
		return "jsonView";
	}
	
	@RequestMapping("/find_my_id.ajax")
	public String find_my_id(HttpServletRequest request , HttpServletResponse response, ModelMap model ) {
		
		String m_hp = request.getParameter("m_hp");
		String m_nm = request.getParameter("m_nm");

		Map<String, Object> hm = new HashMap<String, Object>();
		hm.put("m_hp", m_hp);
		hm.put("m_nm", m_nm);
		
		List<Map<String, Object>> FindMyId = loginService.FindMyId(hm); //결과적으로 리턴받는 타입 int
		Map<String, Object> result = new HashMap<String, Object>();
		
		result.put("FindMyId",FindMyId);
		
		model.addAttribute("result",result);
		return "jsonView";
	}
	
	@RequestMapping("/find_my_pwd.ajax")
	public String find_my_pwd(HttpServletRequest request , HttpServletResponse response, ModelMap model ) {
		
		String m_id = request.getParameter("m_id");
		String m_hp = request.getParameter("m_hp");
		String m_nm = request.getParameter("m_nm");

		Map<String, Object> hm = new HashMap<String, Object>();
		hm.put("m_id", m_id);
		hm.put("m_hp", m_hp);
		hm.put("m_nm", m_nm);
		
		List<Map<String, Object>> FindMyPwd = loginService.FindMyPwd(hm); //결과적으로 리턴받는 타입 int
		Map<String, Object> result = new HashMap<String, Object>();
		
		result.put("FindMyPwd",FindMyPwd);
		
		model.addAttribute("result",result);
		return "jsonView";
	}
	
	@RequestMapping("/modify_pwd.ajax")
	public String modify_pwd(HttpServletRequest request , HttpServletResponse response, ModelMap model ) throws NoSuchAlgorithmException {
		
		String seqno = request.getParameter("seqno");
		String m_pwd = request.getParameter("m_pwd");

		SHA256 sha256 = new SHA256();
		 
		m_pwd = sha256.encrypt(m_pwd); 
		
		Map<String, Object> hm = new HashMap<String, Object>();
		hm.put("m_pwd", m_pwd);
		hm.put("seqno", seqno);
		
		int ModPwd = loginService.ModPwd(hm); //결과적으로 리턴받는 타입 int
		Map<String, Object> result = new HashMap<String, Object>();
		
		String flag = "F";
		result.put("msg", "실패!");
		
		if (ModPwd>0) {
			result.put("msg", "변경이 완료되었습니다. 로그인을 해주세요.");
			result.put("flag", "T");
		}
		
		model.addAttribute("result",result);
		
		return "jsonView";
	}
}