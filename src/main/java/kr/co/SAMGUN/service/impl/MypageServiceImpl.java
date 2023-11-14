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
	
	@Override
	public int MypageMod(Map<String, Object> hm) {
		return mypageDAO.MypageMod(hm);
	}
	
	@Override
	public int Chkhp(Map<String, Object> hm) {
		return mypageDAO.Chkhp(hm);
	}
	
	@Override
	public int Chkpwd(Map<String, Object> hm) {
		return mypageDAO.Chkpwd(hm);
	}
	
	@Override
	public int Updatepwd(Map<String, Object> hm) {
		return mypageDAO.Updatepwd(hm);
	}
	
	@Override
	public List<Map<String, Object>> listReviewType(Map<String, Object> hm) {
		return mypageDAO.listReviewType(hm);
	}
	
	@Override
	public List<Map<String, Object>> listProgramType(Map<String, Object> hm) {
		return mypageDAO.listProgramType(hm);
	}
	
	@Override
	public List<Map<String, Object>> getProgramInfo(Map<String, Object> hm) {
		return mypageDAO.getProgramInfo(hm);
	}
}