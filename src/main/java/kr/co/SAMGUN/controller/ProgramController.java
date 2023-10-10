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

import kr.co.SAMGUN.service.ProgramService;

@Controller
@RequestMapping("/program")
public class ProgramController {
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

		
		return "jsonView";
	}
}