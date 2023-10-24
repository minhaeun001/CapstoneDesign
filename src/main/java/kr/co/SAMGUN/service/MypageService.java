package kr.co.SAMGUN.service;

import java.util.List;
import java.util.Map;

public interface MypageService {

	int WithDraw(Map<String, Object> hm);

	List<Map<String, Object>> InfoList(Map<String, Object> hm);
}
