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
import kr.co.SAMGUN.dao.ReviewDAO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.apache.ibatis.session.SqlSession; 
import org.mybatis.spring.SqlSessionTemplate;


@Repository
public class ReviewDAOImpl implements ReviewDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private static String namespace = "kr.co.SAMGUN.dao.ReviewDAO";
	private static final Logger logger = LoggerFactory.getLogger(ReviewDAOImpl.class);
	

	@Override
	public int selectTotalCnt(Map<String, Object> hm) {
		return sqlSession.selectOne(namespace+".selectTotalCnt", hm);
	}
	
	@Override
	public List<Map<String, Object>> listReviewType(Map<String, Object> hm) {
		return  sqlSession.selectList(namespace+".listReviewType", hm);
	}
	
	@Override
	public List<Map<String, Object>> listBestReviewType(Map<String, Object> hm) {
		return  sqlSession.selectList(namespace+".listBestReviewType", hm);
	}
	
	@Override
	public int boardDetailCount(Map<String, Object> hm) {
		return sqlSession.update(namespace+".boardDetailCount", hm);
	}

	@Override
	public Map<String, Object> boardDetail(Map<String, Object> hm) {
			return  sqlSession.selectOne(namespace+".boardDetail", hm);
	}

	@Override
	public int reviewBoardWrite(Map<String, String> hm) {
		return  sqlSession.insert(namespace+".reviewBoardWrite", hm);
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
	public int LikeCntReview(Map<String, Object> hm) {
		return sqlSession.update(namespace+".LikeCntReview", hm);
	}
	
	@Override
	public int DeleteReview(Map<String, Object> hm) {
		return sqlSession.delete(namespace+".DeleteReview", hm);
	}
	
	@Override
	public int ViewCntReview(Map<String, Object> hm) {
		return sqlSession.delete(namespace+".ViewCntReview", hm);
	}
}
