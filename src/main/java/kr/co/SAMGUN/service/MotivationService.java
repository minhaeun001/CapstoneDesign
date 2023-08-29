package kr.co.SAMGUN.service;

import java.util.List;
import java.util.Map;

public interface MotivationService {

	int selectTotalCnt(Map<String, Object> hm);

	List<Map<String, Object>> listMotivationType(Map<String, Object> hm);

	int boardDetailCount(Map<String, Object> hm);
	
	Map<String, Object> boardDetail(Map<String, Object> hm);

	Map<String, Object> boardModifyDetail(Map<String, Object> hm);

	int boardModifySave(Map<String, Object> hm);

	int boardDelete(Map<String, Object> hm);

	int motivationBoardWrite(Map<String, String> hm);

	Map<String, Object> boardFileSelect(Map<String, Object> hm);

}
