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
@RequestMapping("/mypage")
public class MypageController {

	@Autowired
	MypageService mypageService;
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@RequestMapping("/admin.do")
	public String admin(HttpServletRequest request , HttpServletResponse response, ModelMap model ) {
		//클라이언트에서 넘어온 변수를  map 에 자동으로 할당함
		//Map<String,String> hm = RequestUtil.requestToMap(request) ;
		
		logger.info("프로그램:" + "mypage/admin");
		return "mypage/admin";
	}
	
	@RequestMapping("/training.do")
	public String training(HttpServletRequest request , HttpServletResponse response, ModelMap model ) {
		//클라이언트에서 넘어온 변수를  map 에 자동으로 할당함
		//Map<String,String> hm = RequestUtil.requestToMap(request) ;
		logger.info("프로그램:" + "mypage/training");
		return "mypage/training";
	}
	
	@RequestMapping("/mypage_change.do")
	public String mypage_change(HttpServletRequest request , HttpServletResponse response, ModelMap model ) {
		//클라이언트에서 넘어온 변수를  map 에 자동으로 할당함
		//Map<String,String> hm = RequestUtil.requestToMap(request) ;
		logger.info("프로그램:" + "mypage/mypage_change");
		return "mypage/mypage_change";
	}
	
	@RequestMapping("/mypage_review.do")
	public String mypage_review(HttpServletRequest request , HttpServletResponse response, ModelMap model ) {
		//클라이언트에서 넘어온 변수를  map 에 자동으로 할당함
		//Map<String,String> hm = RequestUtil.requestToMap(request) ;
		logger.info("프로그램:" + "mypage/mypage_review");
		return "mypage/mypage_review";
	}
	
	@RequestMapping("/mypage_running.do")
	public String mypage_running(HttpServletRequest request , HttpServletResponse response, ModelMap model ) {
		//클라이언트에서 넘어온 변수를  map 에 자동으로 할당함
		//Map<String,String> hm = RequestUtil.requestToMap(request) ;
		logger.info("프로그램:" + "mypage/mypage_running");
		return "mypage/mypage_running";
	}
	
	@RequestMapping("/mypage_password_change.do")
	public String mypage_password_change(HttpServletRequest request , HttpServletResponse response, ModelMap model ) {
		//클라이언트에서 넘어온 변수를  map 에 자동으로 할당함
		//Map<String,String> hm = RequestUtil.requestToMap(request) ;
		logger.info("프로그램:" + "mypage/mypage_password_change");
		return "mypage/mypage_password_change";
	}
	
	@RequestMapping("/mypage_withdraw.do")
	public String mypage_withdraw(HttpServletRequest request , HttpServletResponse response, ModelMap model ) {
		//클라이언트에서 넘어온 변수를  map 에 자동으로 할당함
		//Map<String,String> hm = RequestUtil.requestToMap(request) ;
		logger.info("프로그램:" + "mypage/mypage_withdraw");
		return "mypage/mypage_withdraw";
	}
	
	@RequestMapping("/with_draw_ajax.ajax")
	public String with_draw_ajax(HttpServletRequest request , HttpServletResponse response, ModelMap model ) throws Exception {
		
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("m_id");
		String sm_nm = (String) session.getAttribute("m_nm");
		
		Map<String, Object> result = new HashMap<String, Object>();

		String m_nm = request.getParameter("m_nm");
		String m_pwd = request.getParameter("m_pwd");
		
		SHA256 sha256 = new SHA256();
		 
		m_pwd = sha256.encrypt(m_pwd); 
		
		Map<String, Object> hm = new HashMap<String, Object>();
		hm.put("m_id", m_id);
		hm.put("m_nm", m_nm);
		hm.put("m_pwd", m_pwd);
		hm.put("sm_nm", sm_nm);
		
		String msg = "정보를 확인해주세요.";
		String flag = "F";
		
		int WithDraw = mypageService.WithDraw(hm); //결과적으로 리턴받는 타입 int
		
		if(WithDraw>0) {
			msg = "회원 탈퇴 되었습니다.";
			flag = "T";
		}
		
		result.put("msg", msg);
		result.put("flag", flag);
		
		model.addAttribute("result",result);
		return "jsonView";
	}
	
	@RequestMapping("/mypage_view.ajax")
	public String mypage_view(HttpServletRequest request , HttpServletResponse response, ModelMap model ) throws Exception {
		
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("m_id");
		String m_nm = (String) session.getAttribute("m_nm");
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		if( null == m_id || "".equals(m_id)) {
			String msg = "로그인 후 이용해주세요.";
			
			result.put("msg", msg);
			model.addAttribute("result", result);
			model.addAttribute("flag", "F");
			return "jsonView";
		}
		
		Map<String, Object> hm = new HashMap<String, Object>();
		hm.put("m_id", m_id);
		hm.put("m_nm", m_nm);
		
		List<Map<String, Object>> InfoList = mypageService.InfoList(hm);

		
		model.addAttribute("result", InfoList);
		
		return "jsonView";
	}
}