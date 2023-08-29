package kr.co.SAMGUN.dao;

import java.util.List;
import java.util.Map;

public interface MypageDAO {

	public int selectTotalCnt(Map<String, Object> hm);

	public List<Map<String, Object>> listMypageType(Map<String, Object> hm);
	
	public int boardDetailCount(Map<String, Object> hm);
	
	public Map<String, Object> boardDetail(Map<String, Object> hm);

	public Map<String, Object> boardModifyDetail(Map<String, Object> hm);

	public int boardModifySave(Map<String, Object> hm);

	public int boardDelete(Map<String, Object> hm);

	public int mypageBoardWrite(Map<String, String> hm);

	public Map<String, Object> boardFileSelect(Map<String, Object> hm);

	public int saveMypage(Map<String, Object> hm);

	public Map<String, Object> listMypage(Map<String, Object> hm);

	public int selectTotalCnt2(Map<String, Object> hm);

	public List<Map<String, Object>> listProgramType(Map<String, Object> hm);

	public Map<String, Object> myInfo(Map<String, Object> hm);

	public int myInfoModifySave(Map<String, Object> hm);

}
