package kr.co.SAMGUN.dao;

import java.util.List;
import java.util.Map;

public interface MotivationDAO {

	public int selectTotalCnt(Map<String, Object> hm);

	public List<Map<String, Object>> listMotivationType(Map<String, Object> hm);

	public int boardDetailCount(Map<String, Object> hm);
	
	public Map<String, Object> boardDetail(Map<String, Object> hm);

	public Map<String, Object> boardModifyDetail(Map<String, Object> hm);

	public int boardModifySave(Map<String, Object> hm);

	public int boardDelete(Map<String, Object> hm);

	public int motivationBoardWrite(Map<String, String> hm);

	public Map<String, Object> boardFileSelect(Map<String, Object> hm);





}
