package kr.co.SAMGUN.service;

import java.util.List;
import java.util.Map;

public interface MypageService {

	int selectTotalCnt(Map<String, Object> hm);

	List<Map<String, Object>> listMypageType(Map<String, Object> hm);
	
	int boardDetailCount(Map<String, Object> hm);
	
	Map<String, Object> boardDetail(Map<String, Object> hm);

	Map<String, Object> boardModifyDetail(Map<String, Object> hm);

	int boardModifySave(Map<String, Object> hm);

	int boardDelete(Map<String, Object> hm);

	int mypageBoardWrite(Map<String, String> hm);

	Map<String, Object> boardFileSelect(Map<String, Object> hm);

	int saveMypage(Map<String, Object> hm);

	Map<String, Object> listMypage(Map<String, Object> hm);
	
	int selectTotalCnt2(Map<String, Object> hm);

	List<Map<String, Object>> listProgramType(Map<String, Object> hm);

	Map<String, Object> myInfo(Map<String, Object> hm);

	int myInfoModifySave(Map<String, Object> hm);



}
