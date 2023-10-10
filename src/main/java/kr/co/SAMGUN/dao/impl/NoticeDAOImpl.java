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
import kr.co.SAMGUN.dao.NoticeDAO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.apache.ibatis.session.SqlSession; 
import org.mybatis.spring.SqlSessionTemplate;


@Repository
public class NoticeDAOImpl implements NoticeDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	private static String namespace = "kr.co.SAMGUN.dao.NoticeDAO";
	private static final Logger logger = LoggerFactory.getLogger(NoticeDAOImpl.class);
	

	@Override
	public int selectTotalCnt(Map<String, Object> hm) {
		return sqlSession.selectOne(namespace+".selectTotalCnt", hm);
	}
	
	@Override
	public List<Map<String, Object>> listNoticeType(Map<String, Object> hm) {
		return  sqlSession.selectList(namespace+".listNoticeType", hm);
	}
	
	@Override
	public Map<String, Object> boardPrev(Map<String, Object> hm) {
			return  sqlSession.selectOne(namespace+".boardPrev", hm);
	}

	@Override
	public Map<String, Object> boardNext(Map<String, Object> hm) {
			return  sqlSession.selectOne(namespace+".boardNext", hm);
	}
	
	@Override
	public Map<String, Object> boardDetail(Map<String, Object> hm) {
			return  sqlSession.selectOne(namespace+".boardDetail", hm);
	}

	@Override
	public int noticeBoardWrite(Map<String, Object> hm) {
		return  sqlSession.insert(namespace+".noticeBoardWrite", hm);
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
	public int noticeBoardReply(Map<String, Object> hm) {
		return  sqlSession.insert(namespace+".noticeBoardReply", hm);
	}

	@Override
	public int boardUpdateGSeqOrder(Map<String, Object> hm) {
		return sqlSession.update(namespace+".boardUpdateGSeqOrder", hm);
	}

	@Override
	public int boardDetailCount(Map<String, Object> hm) {
		return sqlSession.update(namespace+".boardDetailCount", hm);
	}

	@Override
	public List<Map<String, Object>> listNoticeType2(Map<String, Object> hm) {
		return null;
	}
	
	@Override
	public int DeleteNotice(Map<String, Object> hm) {
		return sqlSession.delete(namespace+".DeleteNotice", hm);
	}
	
	@Override
	public int ViewCntNotice(Map<String, Object> hm) {
		return sqlSession.delete(namespace+".ViewCntNotice", hm);
	}

	@Override
	public int boardLikeSelect(Map<String, Object> hm) {
		return sqlSession.selectOne(namespace+".boardLikeSelect", hm);
	}
	
	@Override
	public int boardLikeCheck(Map<String, Object> hm) {
		return sqlSession.selectOne(namespace+".boardLikeCheck", hm);
	}
	
	@Override
	public int boardLikeInsert(Map<String, Object> hm) {
		return sqlSession.insert(namespace+".boardLikeInsert", hm);
	}
	
	@Override
	public int LikeCntNotice(Map<String, Object> hm) {
		return sqlSession.delete(namespace+".LikeCntNotice", hm);
	}
	
	@Override
	public int NoticeSave(Map<String, Object> hm) {
		return sqlSession.insert(namespace+".NoticeSave", hm);
	}
	
	@Override
	public int NoticeMod(Map<String, Object> hm) {
		return sqlSession.update(namespace+".NoticeMod", hm);
	}
	
	@Override
	public int DeleteFile(Map<String, Object> hm) {
		return sqlSession.delete(namespace+".DeleteFile", hm);
	}
}
