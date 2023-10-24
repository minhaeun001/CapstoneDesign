package kr.co.SAMGUN.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.SAMGUN.dao.LoginDAO;
import kr.co.SAMGUN.dao.MypageDAO;
import kr.co.SAMGUN.service.MypageService;

import java.io.File;
import java.util.ArrayList;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


@Service
public class MypageServiceImpl implements MypageService {
	private static final Logger logger = LoggerFactory.getLogger(LoginServiceImpl.class);
	
	@Autowired
	MypageDAO mypageDAO;
	
	@Override
	public int WithDraw(Map<String, Object> hm) {
		return mypageDAO.WithDraw(hm);
	}
	
	@Override
	public List<Map<String, Object>> InfoList(Map<String, Object> hm) {
		return mypageDAO.InfoList(hm);
	}
}