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
import kr.co.SAMGUN.service.ProgramService;

@Controller
@RequestMapping("/program")
public class ProgramController {
	@Autowired
	ProgramService programservice;

	private static final Logger logger = LoggerFactory.getLogger(ProgramController.class);

	
	@RequestMapping("/program.do")
	public String program(HttpServletRequest request , HttpServletResponse response, ModelMap model ) {
		//클라이언트에서 넘어온 변수를  map 에 자동으로 할당함
		//Map<String,String> hm = RequestUtil.requestToMap(request) ;
		logger.info("프로그램:" + "program/program");
		return "program/program";
	}
	
	@RequestMapping("/program_write.do")
	public String program_write(HttpServletRequest request , HttpServletResponse response, ModelMap model ) {
		//클라이언트에서 넘어온 변수를  map 에 자동으로 할당함
		//Map<String,String> hm = RequestUtil.requestToMap(request) ;
		logger.info("프로그램:" + "program/program_write");
		return "program/program_write";
	}
	
	@RequestMapping("/get_program.ajax")
	public String get_program(HttpServletRequest request, HttpServletResponse response, ModelMap model ) {
		
		Map<String, Object> hm = new HashMap<String, Object>();
		
		List<Map<String, Object>> result = programservice.listProgramType(hm);
		
		model.addAttribute("result", result);
		return "jsonView";
	}
	
	@RequestMapping("/buy_program.ajax")
	public String buy_program(HttpServletRequest request, HttpServletResponse response, ModelMap model ) {
		
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("m_id");
		String program_id = request.getParameter("program_id");
		
		Map<String,Object> hm = new HashMap<String, Object>();
		hm.put("m_id", m_id);
		hm.put("program_id", program_id);
		
		
//		int result = programservice.buyProgram(hm);
		
		model.addAttribute("result", request.getParameter("program_id"));
		
		return "jsonView";
	}
	
}