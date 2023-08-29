package kr.co.SAMGUN.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
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
	public List<Map<String, Object>> listBestReviewType(Map<String, Object> hm) {
		return reviewDAO.listBestReviewType(hm);
	}
	
	@Override
	public int boardDetailCount(Map<String, Object> hm) {
		return reviewDAO.boardDetailCount(hm);
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

	public int boardDelete(Map<String, Object> hm) {
		
		//삭제할 파일 정보 먼저 불러오기 
		Map<String, Object> resultMap = reviewDAO.boardFileSelect(hm);
		
		//DB에서 먼저 게시글 삭제 
		reviewDAO.boardDelete(hm);
		
		//DB게시글 삭제 후 파일 정보 삭제
		String tmp_path_name = resultMap.get("FILE_PATH") + File.separator + resultMap.get("TARGET_FILE_NAME1");
		File file1 = new File(tmp_path_name);
		
		if(file1.exists()) {
			file1.delete();
		}
		
		tmp_path_name = resultMap.get("FILE_PATH") + File.separator + resultMap.get("TARGET_FILE_NAME2");
		File file2 = new File(tmp_path_name);
		
		if(file2.exists()) {
			file2.delete();
		}
		
		tmp_path_name = resultMap.get("FILE_PATH") + File.separator + resultMap.get("TARGET_FILE_NAME3");
		File file3 = new File(tmp_path_name);
		
		if(file3.exists()) {
			file3.delete();
		}
		
		tmp_path_name = resultMap.get("FILE_PATH") + File.separator + resultMap.get("TARGET_FILE_NAME4");
		File file4= new File(tmp_path_name);
		
		if(file4.exists()) {
			file4.delete();
		}
		
		return 1;
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
		return reviewDAO.LikeCntReview(hm);
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
}