package kr.co.SAMGUN.dao;

import java.util.List;
import java.util.Map;

public interface ReviewDAO {

	public int selectTotalCnt(Map<String, Object> hm);

	public List<Map<String, Object>> listReviewType(Map<String, Object> hm);
	
	public int boardDetailCount(Map<String, Object> hm);

	public Map<String, Object> boardDetail(Map<String, Object> hm);

	public Map<String, Object> boardModifyDetail(Map<String, Object> hm);
	
	public Map<String, Object> boardPrev(Map<String, Object> hm);
	
	public Map<String, Object> boardNext(Map<String, Object> hm);

	public int boardModifySave(Map<String, Object> hm);

	public int reviewBoardWrite(Map<String, String> hm);

	public Map<String, Object> boardFileSelect(Map<String, Object> hm);
	
	public int boardLikeSelect(Map<String, Object> hm);
	
	public int boardLikeCheck(Map<String, Object> hm);
	
	public int boardLikeInsert(Map<String, Object> hm);
	
	public int LikeCntReview(Map<String, Object> hm);
	
	public int DeleteReview(Map<String, Object> hm);
	
	public int ViewCntReview(Map<String, Object> hm);
	
	public int ReviewMod(Map<String, Object> hm);
	
	public int ReviewSave(Map<String, Object> hm);
	
	public int ReviewCommentSave(Map<String, Object> hm);
	
	public List<Map<String, Object>> CommentsList(Map<String, Object> hm);
	
	public int CommentsModifyDetail(Map<String, Object> hm);
	
	public int CommentsDelete(Map<String, Object> hm);
	
	public int ReviewReplySave(Map<String, Object> hm);
}
