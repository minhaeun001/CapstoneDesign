package kr.co.SAMGUN.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.SAMGUN.dao.ProgramDAO;
import kr.co.SAMGUN.service.ProgramService;

@Service
public class ProgramServiceImpl implements ProgramService {

	private static final Logger logger = LoggerFactory.getLogger(ProgramServiceImpl.class);
	
	@Autowired
	ProgramDAO programDAO;
	
	@Override
	public List<Map<String, Object>> listProgramType(Map<String, Object> hm) {
		return programDAO.listProgramType(hm);
	}

	@Override
	public int selectTotalCnt(Map<String, Object> hm) {

		return programDAO.selectTotalCnt(hm);
  }

	@Override
	public int saveMypage(Map<String, Object> hm) {
		return programDAO.saveMypage(hm);
	}

	@Override
	public Map<String, Object> listMypage(Map<String, Object> hm) {
		return programDAO.listMypage(hm);
	}

	@Override
	public Map<String, Object> boardDetail(Map<String, Object> hm) {
		return programDAO.boardDetail(hm);
	}

	@Override
	public List<Map<String, Object>> listComments(Map<String, Object> hm) {
		return programDAO.listComments(hm);
	}

	@Override
	public int save_comments(Map<String, Object> hm) {
		return programDAO.save_comments(hm);
	}

	@Override
	public int listTotalComments(Map<String, Object> hm) {
		return programDAO.listTotalComments(hm);
	}

	@Override
	public int boardDetailCount(Map<String, Object> hm) {
		return programDAO.boardDetailCount(hm);
	}

	@Override
	public int boardUpdateGood(Map<String, Object> hm) {
		return programDAO.boardUpdateGood(hm);
	}

	@Override
	public Map<String, Object> boardGood(Map<String, Object> hm) {
		return programDAO.boardGood(hm);
	}
	
	@Override
	public int boardUpdateBad(Map<String, Object> hm) {
		return programDAO.boardUpdateBad(hm);
	}

	@Override
	public Map<String, Object> boardBad(Map<String, Object> hm) {
		return programDAO.boardBad(hm);
	}

	@Override
	public int UpdateCommentGood(Map<String, Object> hm) {
		return programDAO.UpdateCommentGood(hm);
	}

	@Override
	public Map<String, Object> commentGood(Map<String, Object> hm) {
		return programDAO.commentGood(hm);
	}

	@Override
	public int UpdateCommentBad(Map<String, Object> hm) {
		return programDAO.UpdateCommentBad(hm);
	}

	@Override
	public Map<String, Object> commentBad(Map<String, Object> hm) {
		return programDAO.commentBad(hm);
	}
}