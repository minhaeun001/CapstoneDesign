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
	
	@RequestMapping("/mypage_modify.ajax")
	public String mypage_modify(HttpServletRequest request , HttpServletResponse response, ModelMap model ) throws Exception {
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("m_id");
		
		String seq_no = request.getParameter("seq_no");
		String m_hp =request.getParameter("m_hp");
		String m_email = request.getParameter("m_email");
		String msg = "전화번호를 확인해주세요.";
		String flag = "F";
		
		Map<String, Object> hm = new HashMap<String, Object>();
		hm.put("modid", m_id);
		hm.put("seq_no",seq_no);
		hm.put("m_hp", m_hp);
		hm.put("m_email", m_email);
		
		int Chkhp = mypageService.Chkhp(hm);
		
		//이미 등록된 휴대폰 번호라면
		if(Chkhp>0) {
			msg = "이미 등록된 휴대폰 번호입니다.";
		} else {
			int modCnt = mypageService.MypageMod(hm);
			if(modCnt>0) {
				msg="수정되었습니다.";
				flag="T";
			}
		}
	
		Map<String, Object> result = new HashMap<String, Object>();
		
		result.put("msg",msg);
		result.put("flag",flag);
		model.addAttribute("result",result);
		return "jsonView";
	}
	
	@RequestMapping("/fn_mod_pwd.ajax")
	public String fn_mod_pwd(HttpServletRequest request , HttpServletResponse response, ModelMap model ) throws Exception {
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("m_id");
		
		SHA256 sha256 = new SHA256();
		
		String m_opwd = request.getParameter("m_opwd");
		String m_szpwd =request.getParameter("m_szpwd");
		
		m_opwd = sha256.encrypt(m_opwd);
		m_szpwd = sha256.encrypt(m_szpwd);
		
		String msg = "문제가 발생했습니다. 다시 시도해주세요.";
		String flag = "F";
		
		Map<String, Object> hm = new HashMap<String, Object>();
		hm.put("modid", m_id);
		hm.put("m_opwd",m_opwd);
		hm.put("m_szpwd", m_szpwd);
		
		int Chkpwd = mypageService.Chkpwd(hm);
		
		
		if(Chkpwd>0) {
			//만약 기존 비밀번호와 동일하다면
			
			msg="기존 비밀번호와 동일한 비밀번호로는 변경이 불가능합니다.";
		} else {
			int Updatepwd = mypageService.Updatepwd(hm);
			
			if(Updatepwd>0) {
				msg = "수정 되었습니다.";
				flag = "T";
			}
		}
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		result.put("msg",msg);
		result.put("flag",flag);
		model.addAttribute("result",result);
		return "jsonView";
	}
	
	@RequestMapping("/fn_review_info.ajax")
	public String fn_review_info(HttpServletRequest request , HttpServletResponse response, ModelMap model ) throws Exception {
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("m_id");

		String board_type = request.getParameter("board_type");
		String board_sub_type = request.getParameter("board_sub_type");
		
		Map<String, Object> hm = new HashMap<String, Object>();
		hm.put("m_id", m_id);
		hm.put("board_type", board_type);
		hm.put("board_sub_type", board_sub_type);

		List<Map<String, Object>> rstList = mypageService.listReviewType(hm);
		
		model.addAttribute("result", rstList);
		
		return "jsonView";
	}
}