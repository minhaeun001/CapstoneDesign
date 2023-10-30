package kr.co.SAMGUN.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface ProgramDAO {

	public List<Map<String, Object>> listProgramType(Map<String, Object> hm);

	public int selectTotalCnt(Map<String, Object> hm);

	public int saveMypage(Map<String, Object> hm);

	public Map<String, Object> listMypage(Map<String, Object> hm);

	public Map<String, Object> boardDetail(Map<String, Object> hm);

	public List<Map<String, Object>> listComments(Map<String, Object> hm);

	public int save_comments(Map<String, Object> hm);

	public int listTotalComments(Map<String, Object> hm);

	public int boardDetailCount(Map<String, Object> hm);

	public int boardUpdateGood(Map<String, Object> hm);

	public Map<String, Object> boardGood(Map<String, Object> hm);
	
	public int boardUpdateBad(Map<String, Object> hm);

	public Map<String, Object> boardBad(Map<String, Object> hm);

	public int UpdateCommentGood(Map<String, Object> hm);

	public Map<String, Object> commentGood(Map<String, Object> hm);

	public int UpdateCommentBad(Map<String, Object> hm);

	public Map<String, Object> commentBad(Map<String, Object> hm);
	
	public int buyProgram(Map<String, Object> hm);
	
}
