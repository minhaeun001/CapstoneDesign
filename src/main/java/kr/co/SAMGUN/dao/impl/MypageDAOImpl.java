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
import kr.co.SAMGUN.dao.MypageDAO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.SqlSession; 
import org.mybatis.spring.SqlSessionTemplate;


@Repository
public class MypageDAOImpl implements MypageDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private static String namespace = "kr.co.SAMGUN.dao.MypageDAO";
	private static final Logger logger = LoggerFactory.getLogger(MypageDAOImpl.class);
	
	@Override
	public int WithDraw(Map<String, Object> hm) {
		return sqlSession.delete(namespace+".WithDraw", hm);
	}
	
	@Override
	public List<Map<String, Object>> InfoList(Map<String, Object> hm) {
		return sqlSession.selectList(namespace+".InfoList", hm);
	}
	
	@Override
	public int MypageMod(Map<String, Object> hm) {
		return sqlSession.update(namespace+".MypageMod", hm);
	}
	
	@Override
	public int Chkhp(Map<String, Object> hm) {
		return sqlSession.selectOne(namespace+".Chkhp", hm);
	}
	
	@Override
	public int Chkpwd(Map<String, Object> hm) {
		return sqlSession.selectOne(namespace+".Chkpwd", hm);
	}
	
	@Override
	public int Updatepwd(Map<String, Object> hm) {
		return sqlSession.update(namespace+".Updatepwd", hm);
	}
	
	@Override
	public List<Map<String, Object>> listReviewType(Map<String, Object> hm) {
		return  sqlSession.selectList(namespace+".listReviewType", hm);
	}
}
