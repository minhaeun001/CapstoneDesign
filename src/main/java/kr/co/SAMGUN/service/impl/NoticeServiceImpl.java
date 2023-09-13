package kr.co.SAMGUN.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.util.ArrayList;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.SAMGUN.dao.NoticeDAO;
import kr.co.SAMGUN.service.NoticeService;

@Service
public class NoticeServiceImpl implements NoticeService {

	private static final Logger logger = LoggerFactory.getLogger(NoticeServiceImpl.class);
	
	@Autowired
	NoticeDAO noticeDAO;

	@Override
	public int selectTotalCnt(Map<String, Object> hm) {
		return noticeDAO.selectTotalCnt(hm);
	}

	@Override
	public List<Map<String, Object>> listNoticeType(Map<String, Object> hm) {
		return noticeDAO.listNoticeType(hm);
	}
	
	@Override
	public List<Map<String, Object>> listNoticeType2(Map<String, Object> hm) {
		return noticeDAO.listNoticeType2(hm);
	}

	@Override
	public Map<String, Object> boardDetail(Map<String, Object> hm) {
		return noticeDAO.boardDetail(hm);
	}

	@Override
	public Map<String, Object> boardPrev(Map<String, Object> hm) {
		
		Map<String, Object> prevMap = noticeDAO.boardPrev(hm);
			return  noticeDAO.boardPrev(hm);	 
	}
	
	@Override
	public Map<String, Object> boardNext(Map<String, Object> hm) {
		return noticeDAO.boardNext(hm);
	}
	
	@Override
	public Map<String, Object> boardModifyDetail(Map<String, Object> hm) {
		return noticeDAO.boardModifyDetail(hm);
	}

	@Override
	public int boardModifySave(Map<String, Object> hm) {
		return noticeDAO.boardModifySave(hm);
	}

	public int boardDelete(Map<String, Object> hm) {
		
		//삭제할 파일 정보 먼저 불러오기 
		Map<String, Object> resultMap = noticeDAO.boardFileSelect(hm);
		
		//DB에서 먼저 게시글 삭제 
		noticeDAO.boardDelete(hm);
		
		//DB게시글 삭제 후 파일 정보 삭제
		String tmp_path_name = resultMap.get("FILE_PATH") + File.separator + resultMap.get("TARGET_FILE_NAME1");
		File file1 = new File(tmp_path_name);
		
		if(file1.exists()) {
			file1.delete();
		}
		
		tmp_path_name = resultMap.get("FILE_PATH") + File.separator + resultMap.get("TARGET_FILE_NAME2");
		File file2 = new File(tmp_path_name);
		
		if(file2.exists()) {
			file2.delete();
		}
		
		tmp_path_name = resultMap.get("FILE_PATH") + File.separator + resultMap.get("TARGET_FILE_NAME3");
		File file3 = new File(tmp_path_name);
		
		if(file3.exists()) {
			file3.delete();
		}
		
		tmp_path_name = resultMap.get("FILE_PATH") + File.separator + resultMap.get("TARGET_FILE_NAME4");
		File file4= new File(tmp_path_name);
		
		if(file4.exists()) {
			file4.delete();
		}
		
		return 1;
	}

	@Override
	public int noticeBoardWrite(Map<String, Object> hm) {
		return noticeDAO.noticeBoardWrite(hm);
	}

	@Override
	public Map<String, Object> boardFileSelect(Map<String, Object> hm) {
		return noticeDAO.boardFileSelect(hm);
	}

	@Override
	public int noticeBoardReply(Map<String, Object> hm) {
		return noticeDAO.noticeBoardReply(hm);
	}

	@Override
	public int boardUpdateGSeqOrder(Map<String, Object> hm) {
		return noticeDAO.boardUpdateGSeqOrder(hm);
	}

	@Override
	public int boardDetailCount(Map<String, Object> hm) {
		return noticeDAO.boardDetailCount(hm);
	}
	
	@Override
	public int DeleteNotice(Map<String, Object> hm) {
		
		// 자료타입  변수명  =  결과값
		// 자료타입 == 결과값 타입과 같아야 함.
		int resultCnt = noticeDAO.DeleteNotice(hm);
		
		return resultCnt;
	}

	@Override
	public int ViewCntNotice(Map<String, Object> hm) {
		return noticeDAO.ViewCntNotice(hm);
	}
	
	@Override
	public int LikeCntNotice(Map<String, Object> hm) {
int i =0;
		
		if (noticeDAO.boardLikeCheck(hm) == 0) {
			i = noticeDAO.boardLikeInsert(hm);
			i = noticeDAO.LikeCntNotice(hm);
		}
		
		i = noticeDAO.boardLikeSelect(hm);
		return i;
	}
	
	@Override
	public int NoticeSave(Map<String, Object> hm) {
		return noticeDAO.NoticeSave(hm);
	}
	
	@Override
	public int NoticeMod(Map<String, Object> hm) {
		return noticeDAO.NoticeMod(hm);
	}
}