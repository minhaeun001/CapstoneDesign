package kr.co.SAMGUN.dao;

import java.util.List;
import java.util.Map;

public interface MypageDAO {
	public int WithDraw(Map<String, Object> hm);
	
	List<Map<String, Object>> InfoList(Map<String, Object> hm);
	
	public int MypageMod(Map<String, Object> hm);
	
	public int Chkhp(Map<String, Object> hm);
	
	public int Chkpwd(Map<String, Object> hm);
	
	public int Updatepwd(Map<String, Object> hm);
	
	public List<Map<String, Object>> listReviewType(Map<String, Object> hm);
	
	public List<Map<String, Object>> listProgramType(Map<String, Object> hm);
}