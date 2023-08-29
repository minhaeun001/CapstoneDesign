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
import kr.co.SAMGUN.dao.ProgramDAO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.apache.ibatis.session.SqlSession; 
import org.mybatis.spring.SqlSessionTemplate;


@Repository
public class ProgramDAOImpl implements ProgramDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private static String namespace = "kr.co.SAMGUN.dao.";
	private static final Logger logger = LoggerFactory.getLogger(ProgramDAOImpl.class);
	
//	운동 타입 리스트
	@Override
	public List<Map<String, Object>> listProgramType(Map<String, Object> hm) {
//		logger.debug(" listProgramType 도착 ");
//		logger.debug("listProgramType hm: " + hm);
		return sqlSession.selectList(namespace+".listProgramType", hm);
	}

//	총갯수
	@Override
	public int selectTotalCnt(Map<String, Object> hm) {
		return sqlSession.selectOne(namespace+".selectTotalCnt", hm);
	}
	
//마이페이지에 찜등록 
	@Override
	public int saveMypage(Map<String, Object> hm) {
		return sqlSession.selectOne(namespace+".saveMypage", hm);
	}

	@Override
	public Map<String, Object> listMypage(Map<String, Object> hm) {
		
		return sqlSession.selectOne(namespace+".listMypage", hm);
	}

	@Override
	public Map<String, Object> boardDetail(Map<String, Object> hm) {
		
		return sqlSession.selectOne(namespace+".boardDetail", hm);
	}

	@Override
	public List<Map<String, Object>> listComments(Map<String, Object> hm) {
		return sqlSession.selectList(namespace+".listComments", hm);
	}

	@Override
	public int save_comments(Map<String, Object> hm) {
		return sqlSession.insert(namespace+".save_comments", hm);
	}

	@Override
	public int listTotalComments(Map<String, Object> hm) {
		return sqlSession.selectOne(namespace+".listTotalComments", hm);
	}

	@Override
	public int boardDetailCount(Map<String, Object> hm) {
		return sqlSession.update(namespace+".boardDetailCount", hm);
	}

	@Override
	public int boardUpdateGood(Map<String, Object> hm) {
		return sqlSession.update(namespace+".boardUpdateGood", hm);
	}

	@Override
	public Map<String, Object> boardGood(Map<String, Object> hm) {
		return sqlSession.selectOne(namespace+".boardGood", hm);
	}
	@Override
	public int boardUpdateBad(Map<String, Object> hm) {
		return sqlSession.update(namespace+".boardUpdateBad", hm);
	}

	@Override
	public Map<String, Object> boardBad(Map<String, Object> hm) {
		return sqlSession.selectOne(namespace+".boardBad", hm);
	}

	@Override
	public int UpdateCommentGood(Map<String, Object> hm) {
		return sqlSession.update(namespace+".UpdateCommentGood", hm);
	}

	@Override
	public Map<String, Object> commentGood(Map<String, Object> hm) {
		return sqlSession.selectOne(namespace+".commentGood", hm);
	}

	@Override
	public int UpdateCommentBad(Map<String, Object> hm) {
		return sqlSession.update(namespace+".UpdateCommentBad", hm);
	}

	@Override
	public Map<String, Object> commentBad(Map<String, Object> hm) {
		return sqlSession.selectOne(namespace+".commentBad", hm);
	}
			
}
