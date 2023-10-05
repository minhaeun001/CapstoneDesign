package kr.co.SAMGUN.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import kr.co.SAMGUN.dao.LoginDAO;
import kr.co.SAMGUN.dao.NoticeDAO;
import kr.co.SAMGUN.service.impl.LoginServiceImpl;
import kr.co.SAMGUN.service.impl.NoticeServiceImpl;

public interface LoginService {

	int Signup(Map<String, Object> hm);
	
	List<Map<String, Object>> CheckNumber(Map<String, Object> hm);
	
	List<Map<String, Object>> SignupCheck(Map<String, Object> hm);

	List<Map<String, Object>> checkLoginLogic(Map<String, Object> hm);
	
}
