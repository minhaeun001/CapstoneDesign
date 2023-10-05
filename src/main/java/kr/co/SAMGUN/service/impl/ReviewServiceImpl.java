package kr.co.SAMGUN.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.math.BigDecimal;
import java.util.ArrayList;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.SAMGUN.dao.ReviewDAO;
import kr.co.SAMGUN.service.ReviewService;

@Service
public class ReviewServiceImpl implements ReviewService {

	private static final Logger logger = LoggerFactory.getLogger(ReviewServiceImpl.class);
	
	@Autowired
	ReviewDAO reviewDAO;

	@Override
	public int selectTotalCnt(Map<String, Object> hm) {
		return reviewDAO.selectTotalCnt(hm);
	}

	@Override
	public List<Map<String, Object>> listReviewType(Map<String, Object> hm) {
		return reviewDAO.listReviewType(hm);
	}
	
	@Override
	public int boardDetailCount(Map<String, Object> hm) {
		return reviewDAO.boardDetailCount(hm);
	}


	@Override
	public Map<String, Object> boardPrev(Map<String, Object> hm) {
		
		Map<String, Object> prevMap = reviewDAO.boardPrev(hm);
			return  reviewDAO.boardPrev(hm);	 
	}
	
	@Override
	public Map<String, Object> boardNext(Map<String, Object> hm) {
		return reviewDAO.boardNext(hm);
	}
	
	@Override
	public Map<String, Object> boardDetail(Map<String, Object> hm) {
		return reviewDAO.boardDetail(hm);
	}

	@Override
	public Map<String, Object> boardModifyDetail(Map<String, Object> hm) {
		return reviewDAO.boardModifyDetail(hm);
	}

	@Override
	public int boardModifySave(Map<String, Object> hm) {
		return reviewDAO.boardModifySave(hm);
	}

	@Override
	public int reviewBoardWrite(Map<String, String> hm) {
		return reviewDAO.reviewBoardWrite(hm);
	}

	@Override
	public Map<String, Object> boardFileSelect(Map<String, Object> hm) {
		return reviewDAO.boardFileSelect(hm);
	}
	
	@Override
	public int LikeCntReview(Map<String, Object> hm) {
		int i =0;
		
		if (reviewDAO.boardLikeCheck(hm) == 0) {
			i = reviewDAO.boardLikeInsert(hm);
			i = reviewDAO.LikeCntReview(hm);
		}
		
		i = reviewDAO.boardLikeSelect(hm);
		return i;
	}
	
	@Override
	public int DeleteReview(Map<String, Object> hm) {
		
		// 자료타입  변수명  =  결과값
		// 자료타입 == 결과값 타입과 같아야 함.
		int resultCnt = reviewDAO.DeleteReview(hm);
		
		return resultCnt;
	}
	
	@Override
	public int ViewCntReview(Map<String, Object> hm) {
		return reviewDAO.ViewCntReview(hm);
	}
	
	@Override
	public int ReviewMod(Map<String, Object> hm) {
		return reviewDAO.ReviewMod(hm);
	}
	
	@Override
	public int ReviewSave(Map<String, Object> hm) {
		return reviewDAO.ReviewSave(hm);
	}
	
	@Override
	public int ReviewCommentSave(Map<String, Object> hm) {
		return reviewDAO.ReviewCommentSave(hm);
	}

	@Override
	public List<Map<String, Object>> CommentsList(Map<String, Object> hm) {
		return reviewDAO.CommentsList(hm);
	}
	
	@Override
	public int CommentsModifyDetail(Map<String, Object> hm) {
		return reviewDAO.CommentsModifyDetail(hm);
	}
	
	@Override
	public int CommentsDelete(Map<String, Object> hm) {
		return reviewDAO.CommentsDelete(hm);
	}
	
	@Override
	public int ReviewReplySave(Map<String, Object> hm) {
		return reviewDAO.ReviewReplySave(hm);
	}

}