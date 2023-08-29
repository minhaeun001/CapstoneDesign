package kr.co.SAMGUN.dao;

import java.util.Map;

public interface Common2DAO {

	int checkId(Map<String, Object> hm);

	int joinSave(Map<String, Object> hm);

	int loginIdProc(Map<String, Object> hm);

	Map<String, Object> loginPwProc(Map<String, Object> hm);

}
