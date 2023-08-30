package kr.co.SAMGUN.dao;

import java.util.List;
import java.util.Map;

public interface ReviewDAO {

	public int selectTotalCnt(Map<String, Object> hm);

	public List<Map<String, Object>> listReviewType(Map<String, Object> hm);
	
	public List<Map<String, Object>> listBestReviewType(Map<String, Object> hm);
	
	public int boardDetailCount(Map<String, Object> hm);

	public Map<String, Object> boardDetail(Map<String, Object> hm);

	public Map<String, Object> boardModifyDetail(Map<String, Object> hm);

	public int boardModifySave(Map<String, Object> hm);

	public int boardDelete(Map<String, Object> hm);

	public int reviewBoardWrite(Map<String, String> hm);

	public Map<String, Object> boardFileSelect(Map<String, Object> hm);

	public int LikeCntReview(Map<String, Object> hm);
	
	public int DeleteReview(Map<String, Object> hm);
	
	public int ViewCntReview(Map<String, Object> hm);
	
	public int ReviewMod(Map<String, Object> hm);
	
	public int ReviewSave(Map<String, Object> hm);
}
