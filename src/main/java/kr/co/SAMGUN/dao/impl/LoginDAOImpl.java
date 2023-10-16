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
	private static String namespace = "kr.co.SAMGUN.dao.LoginDAO";
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
	public int CheckNumber(Map<String, Object> hm) {
		return sqlSession.selectOne(namespace+".CheckNumber", hm);
	}
	
	@Override
	public int SelectIdCnt(Map<String, Object> hm) {
		return sqlSession.selectOne(namespace+".SelectIdCnt", hm);
	}
	
	@Override
	public Map<String,Object> SelectMember(Map<String, Object> hm) {
		return sqlSession.selectOne(namespace+".SelectMember", hm);
	}
	
	@Override
	public Map<String,Object> FindMyId(Map<String, Object> hm) {
		return sqlSession.selectOne(namespace+".FindMyId", hm);
	}
	
	@Override
	public int CheckName(Map<String, Object> hm) {
		return sqlSession.selectOne(namespace+".CheckName", hm);
	}
	
	@Override
	public Map<String,Object> FindMyPwd(Map<String, Object> hm) {
		return sqlSession.selectOne(namespace+".FindMyId", hm);
	}
	
	@Override
	public int ModPwd(Map<String, Object> hm) {
		return sqlSession.update(namespace+".ModPwd", hm);
	}

}
