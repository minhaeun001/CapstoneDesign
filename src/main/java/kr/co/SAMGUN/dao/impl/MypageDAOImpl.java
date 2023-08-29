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
	public int selectTotalCnt(Map<String, Object> hm) {
		return sqlSession.selectOne(namespace+".selectTotalCnt", hm);
	}
	
	@Override
	public List<Map<String, Object>> listMypageType(Map<String, Object> hm) {
		return  sqlSession.selectList(namespace+".listMypageType", hm);
	}
	
	@Override
	public int boardDetailCount(Map<String, Object> hm) {
		return sqlSession.update(namespace+".boardDetailCount", hm);
	}

	@Override
	public Map<String, Object> boardDetail(Map<String, Object> hm) {
		
		int i = sqlSession.update(namespace+".boardDetailCount", hm);
		
		if(i>0) {
			return  sqlSession.selectOne(namespace+".boardDetail", hm);
		}else {
			return null;
		}
	}
	
	@Override
	public int mypageBoardWrite(Map<String, String> hm) {
		return  sqlSession.insert(namespace+".mypageBoardWrite", hm);
	}

	@Override
	public Map<String, Object> boardModifyDetail(Map<String, Object> hm) {
		return sqlSession.selectOne(namespace+".boardModifyDetail", hm);
	}

	@Override
	public int boardModifySave(Map<String, Object> hm) {
		return sqlSession.update(namespace+".boardModifySave", hm);
	}

	@Override
	public int boardDelete(Map<String, Object> hm) {
		return sqlSession.delete(namespace+".boardDelete", hm);
	}

	@Override
	public Map<String, Object> boardFileSelect(Map<String, Object> hm) {
		return sqlSession.selectOne(namespace+".boardFileSelect", hm);
	}

	@Override
	public int saveMypage(Map<String, Object> hm) {
		return  sqlSession.insert(namespace+".saveMypage", hm);
	}

	@Override
	public Map<String, Object> listMypage(Map<String, Object> hm) {
		return  sqlSession.selectOne(namespace+".listMypage", hm);
	}

	@Override
	public int selectTotalCnt2(Map<String, Object> hm) {
		return  sqlSession.selectOne(namespace+".selectTotalCnt2", hm);
	}

	@Override
	public List<Map<String, Object>> listProgramType(Map<String, Object> hm) {
		return  sqlSession.selectList(namespace+".listProgramType", hm);
	}

	@Override
	public Map<String, Object> myInfo(Map<String, Object> hm) {
		return sqlSession.selectOne(namespace+".myInfo", hm);
	}

	@Override
	public int myInfoModifySave(Map<String, Object> hm) {
		return sqlSession.update(namespace+".myInfoModifySave", hm);
	}
	
}
