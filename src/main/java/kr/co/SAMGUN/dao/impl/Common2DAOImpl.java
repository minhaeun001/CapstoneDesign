package kr.co.SAMGUN.dao.impl;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import kr.co.SAMGUN.dao.Common2DAO;

@Repository
public class Common2DAOImpl implements Common2DAO {

	private SqlSessionTemplate sqlSession;
	private String namespace = "kr.co.SAMGUN.dao.Common2DAO";
	private static final Logger logger = LoggerFactory.getLogger(Common2DAOImpl.class);
	
	@Override
	public int checkId(Map<String, Object> hm) {
		return sqlSession.selectOne(namespace+".checkId", hm);
	}

	@Override
	public int joinSave(Map<String, Object> hm) {
		return sqlSession.insert(namespace+".joinSave", hm);
	}

	@Override
	public int loginIdProc(Map<String, Object> hm) {
		return sqlSession.selectOne(namespace+".loginIdProc", hm);
	}

	@Override
	public Map<String, Object> loginPwProc(Map<String, Object> hm) {
		

			return sqlSession.selectOne(namespace+".loginPwProc", hm);
	
		 
	}

}
