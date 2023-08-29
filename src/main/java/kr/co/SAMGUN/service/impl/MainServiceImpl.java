package kr.co.SAMGUN.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.SAMGUN.dao.MainDAO;
import kr.co.SAMGUN.service.MainService;

@Service
public class MainServiceImpl implements MainService{

	private static final Logger logger = LoggerFactory.getLogger(MainServiceImpl.class);
	
	@Autowired
	MainDAO mainDAO;

	@Override
	public List<Map<String, Object>> bestProgram(Map<String, Object> hm) {
		return mainDAO.bestProgram(hm);
	}
	
	@Override
	public List<Map<String, Object>> bestProgram2(Map<String, Object> hm) {
		return mainDAO.bestProgram2(hm);
	}
	
}
