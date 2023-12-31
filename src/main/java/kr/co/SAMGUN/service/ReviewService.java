package kr.co.SAMGUN.service;

import java.util.List;
import java.util.Map;

public interface ReviewService {

	int selectTotalCnt(Map<String, Object> hm);
	
	List<Map<String, Object>> listReviewType(Map<String, Object> hm);

	int boardDetailCount(Map<String, Object> hm);
	
	Map<String, Object> boardDetail(Map<String, Object> hm);

	Map<String, Object> boardModifyDetail(Map<String, Object> hm);
	
	Map<String, Object> boardPrev(Map<String, Object> hm);
	
	Map<String, Object> boardNext(Map<String, Object> hm);

	int boardModifySave(Map<String, Object> hm);

	int reviewBoardWrite(Map<String, String> hm);

	Map<String, Object> boardFileSelect(Map<String, Object> hm);

	int LikeCntReview(Map<String, Object> hm);
	
	int DeleteReview(Map<String, Object> hm);
	
	int ViewCntReview(Map<String, Object> hm);
	
	int ReviewMod(Map<String, Object> hm);
	
	int ReviewSave(Map<String, Object> hm);
	
	int ReviewCommentSave(Map<String, Object> hm);

	List<Map<String, Object>> CommentsList(Map<String, Object> hm);
	
	int CommentsModifyDetail(Map<String, Object> hm);
	
	int CommentsDelete(Map<String, Object> hm);
	
	int ReviewReplySave(Map<String, Object> hm);
	
}
