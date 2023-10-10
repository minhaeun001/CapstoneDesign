package kr.co.SAMGUN.service;

import java.util.List;
import java.util.Map;

public interface NoticeService {

	int selectTotalCnt(Map<String, Object> hm);

	List<Map<String, Object>> listNoticeType(Map<String, Object> hm);
	List<Map<String, Object>> listNoticeType2(Map<String, Object> hm);

	Map<String, Object> boardDetail(Map<String, Object> hm);

	Map<String, Object> boardModifyDetail(Map<String, Object> hm);
	
	Map<String, Object> boardPrev(Map<String, Object> hm);
	
	Map<String, Object> boardNext(Map<String, Object> hm);

	int boardModifySave(Map<String, Object> hm);

	int boardDelete(Map<String, Object> hm);

	int noticeBoardWrite(Map<String, Object> hm);

	Map<String, Object> boardFileSelect(Map<String, Object> hm);

	int noticeBoardReply(Map<String, Object> hm);

	int boardUpdateGSeqOrder(Map<String, Object> hm);

	int boardDetailCount(Map<String, Object> hm);
	
	int DeleteNotice(Map<String, Object> hm);

	int ViewCntNotice(Map<String, Object> hm);

	int LikeCntNotice(Map<String, Object> hm);
	
	int NoticeSave(Map<String, Object> hm);
	
	int NoticeMod(Map<String, Object> hm);
	
	int DeleteFile(Map<String, Object> hm);
}
