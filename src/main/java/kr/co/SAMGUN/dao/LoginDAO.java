package kr.co.SAMGUN.dao;

import java.util.List;
import java.util.Map;

public interface LoginDAO {
	
	public int Signup(Map<String, Object> hm);
	
	public int SignupCheck(Map<String, Object> hm);
	
	public int CheckNumber(Map<String, Object> hm);
	
	public int SelectIdCnt(Map<String, Object> hm);

	public Map<String,Object> SelectMember(Map<String, Object> hm);
}
