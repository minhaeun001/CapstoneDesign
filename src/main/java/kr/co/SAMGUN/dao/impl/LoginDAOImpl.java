package kr.co.SAMGUN.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.co.SAMGUN.cmm.DBConnection;
import kr.co.SAMGUN.dao.LoginDAO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.apache.ibatis.session.SqlSession; 
import org.mybatis.spring.SqlSessionTemplate;


@Repository
public class LoginDAOImpl implements LoginDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private static String namespace = "kr.co.SAMGUN.dao.MotivationDAO";
	private static final Logger logger = LoggerFactory.getLogger(LoginDAOImpl.class);
	
	@Override
	public int Signup(Map<String, Object> hm) {
		return sqlSession.insert(namespace+".Signup", hm);
	}
	
	@Override
	public int SignupCheck(Map<String, Object> hm) {
		return sqlSession.selectOne(namespace+".SignupCheck", hm);
	}
	
	@Override
	public int SelectIdCnt(Map<String, Object> hm) {
		return sqlSession.selectOne(namespace+".SelectIdCnt", hm);
	}
}
