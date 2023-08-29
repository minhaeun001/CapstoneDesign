package kr.co.SAMGUN.dao;

import java.util.List;
import java.util.Map;

public interface NoticeDAO {

	public int selectTotalCnt(Map<String, Object> hm);

	public List<Map<String, Object>> listNoticeType(Map<String, Object> hm);
	
	public List<Map<String, Object>> listNoticeType2(Map<String, Object> hm);
	
	public Map<String, Object> boardDetail(Map<String, Object> hm);

	public Map<String, Object> boardModifyDetail(Map<String, Object> hm);

	public int boardModifySave(Map<String, Object> hm);

	public int boardDelete(Map<String, Object> hm);

	public int noticeBoardWrite(Map<String, Object> hm);

	public Map<String, Object> boardFileSelect(Map<String, Object> hm);

	public int noticeBoardReply(Map<String, Object> hm);

	public int boardUpdateGSeqOrder(Map<String, Object> hm);

	public int boardDetailCount(Map<String, Object> hm);
	
	public int DeleteNotice(Map<String, Object> hm);

	public int ViewCntNotice(Map<String, Object> hm);
	
	public int LikeCntNotice(Map<String, Object> hm);
	
	public int NoticeSave(Map<String, Object> hm);
	
	public int NoticeMod(Map<String, Object> hm);
}
