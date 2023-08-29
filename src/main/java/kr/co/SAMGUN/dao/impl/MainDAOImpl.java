package kr.co.SAMGUN.dao.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import kr.co.SAMGUN.dao.Common2DAO;
import kr.co.SAMGUN.dao.MainDAO;

@Repository
public class MainDAOImpl implements MainDAO {

	private SqlSessionTemplate sqlSession;
	private String namespace = "kr.co.SAMGUN.dao.MainDAO";
	private static final Logger logger = LoggerFactory.getLogger(MainDAOImpl.class);
	@Override
	public List<Map<String, Object>> bestProgram(Map<String, Object> hm) {
		return sqlSession.selectList(namespace+".bestProgram", hm);
	}
	
	@Override
	public List<Map<String, Object>> bestProgram2(Map<String, Object> hm) {
		return sqlSession.selectList(namespace+".bestProgram2", hm);
	}
	
	

}
