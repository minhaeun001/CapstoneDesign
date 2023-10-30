package kr.co.SAMGUN.service;

import java.util.List;
import java.util.Map;

public interface MypageService {

	int WithDraw(Map<String, Object> hm);

	List<Map<String, Object>> InfoList(Map<String, Object> hm);
	
	int MypageMod(Map<String, Object> hm);
	
	int Chkhp(Map<String, Object> hm);
}
