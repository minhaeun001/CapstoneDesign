package kr.co.SAMGUN.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.SAMGUN.dao.MypageDAO;
import kr.co.SAMGUN.service.MypageService;

import java.io.File;
import java.util.ArrayList;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


@Service
public class MypageServiceImpl implements MypageService {

	private static final Logger logger = LoggerFactory.getLogger(MypageServiceImpl.class);
	
	@Autowired
	MypageDAO mypageDAO;

	@Override
	public int selectTotalCnt(Map<String, Object> hm) {
		return mypageDAO.selectTotalCnt(hm);
	}

	@Override
	public List<Map<String, Object>> listMypageType(Map<String, Object> hm) {
		return mypageDAO.listMypageType(hm);
	}
	
	@Override
	public int boardDetailCount(Map<String, Object> hm) {
		return mypageDAO.boardDetailCount(hm);
	}

	@Override
	public Map<String, Object> boardDetail(Map<String, Object> hm) {
		return mypageDAO.boardDetail(hm);
	}

	@Override
	public Map<String, Object> boardModifyDetail(Map<String, Object> hm) {
		return mypageDAO.boardModifyDetail(hm);
	}

	@Override
	public int boardModifySave(Map<String, Object> hm) {
		return mypageDAO.boardModifySave(hm);
	}

	public int boardDelete(Map<String, Object> hm) {
		
		//삭제할 파일 정보 먼저 불러오기 
		Map<String, Object> resultMap = mypageDAO.boardFileSelect(hm);
		
		//DB에서 먼저 게시글 삭제 
		mypageDAO.boardDelete(hm);
		
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
	public int mypageBoardWrite(Map<String, String> hm) {
		return mypageDAO.mypageBoardWrite(hm);
	}

	@Override
	public Map<String, Object> boardFileSelect(Map<String, Object> hm) {
		return mypageDAO.boardFileSelect(hm);
	}

	@Override
	public int saveMypage(Map<String, Object> hm) {
		return mypageDAO.saveMypage(hm);
	}

	@Override
	public Map<String, Object> listMypage(Map<String, Object> hm) {
		return mypageDAO.listMypage(hm);
	}

	@Override
	public int selectTotalCnt2(Map<String, Object> hm) {
		return mypageDAO.selectTotalCnt2(hm);
	}

	@Override
	public List<Map<String, Object>> listProgramType(Map<String, Object> hm) {
		return mypageDAO.listProgramType(hm);
	}

	@Override
	public Map<String, Object> myInfo(Map<String, Object> hm) {
		return mypageDAO.myInfo(hm);
	}

	@Override
	public int myInfoModifySave(Map<String, Object> hm) {
		return mypageDAO.myInfoModifySave(hm);
	}

	
}