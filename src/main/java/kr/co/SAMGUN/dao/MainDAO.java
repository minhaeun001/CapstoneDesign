package kr.co.SAMGUN.dao;

import java.util.List;
import java.util.Map;

public interface MainDAO {

	List<Map<String, Object>> bestProgram(Map<String, Object> hm);

	List<Map<String, Object>> bestProgram2(Map<String, Object> hm);
	
}
