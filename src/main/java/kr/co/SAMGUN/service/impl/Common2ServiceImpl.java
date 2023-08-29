package kr.co.SAMGUN.service.impl;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.SAMGUN.dao.Common2DAO;
import kr.co.SAMGUN.service.Common2Service;

@Service
public class Common2ServiceImpl implements Common2Service{

	private static final Logger logger = LoggerFactory.getLogger(Common2ServiceImpl.class);
	
	@Autowired
	Common2DAO common2DAO;
	
	public int checkId(Map<String, Object> hm) {
		return common2DAO.checkId(hm);
	}

	@Override
	public int joinSave(Map<String, Object> hm) {
		return common2DAO.joinSave(hm);
	}

	@Override
	public int loginIdProc(Map<String, Object> hm) {
		return common2DAO.loginIdProc(hm);
	}

	@Override
	public Map<String, Object> loginPwProc(Map<String, Object> hm) {
		return common2DAO.loginPwProc(hm);
	}

}
