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

import kr.co.SAMGUN.dao.LoginDAO;
import kr.co.SAMGUN.service.LoginService;

@Service
public class LoginServiceImpl implements LoginService {

	private static final Logger logger = LoggerFactory.getLogger(LoginServiceImpl.class);
	
	@Autowired
	LoginDAO loginDAO;
	
	@Override
	public int Signup(Map<String, Object> hm) {
		return loginDAO.Signup(hm);
	}
	
	@Override
	public List<Map<String, Object>> SignupCheck(Map<String, Object> hm) {
	
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		Map<String, Object> resultMap = new HashMap<String, Object>();
			
		// 아이디 존재여부 체크
		int dblCheck = loginDAO.SignupCheck(hm);
		
		String dblCheckFlag = "true";
		
		if(dblCheck > 0) {
			//id가 존재한다면	
			dblCheckFlag = "false";
		}
		
		resultMap.put("dblCheckFlag", dblCheckFlag);
		result.add(resultMap);
		
		return result;
	}
	
	@Override
	public int CheckNumber(Map<String, Object> hm) {
		
		// 휴대폰 번호 존재여부 체크
		int hpCheck = loginDAO.CheckNumber(hm);
	
		return hpCheck;
	}
	
	@Override
	public List<Map<String, Object>> checkLoginLogic(Map<String, Object> hm) {
		
		// 결과값을 담을 리스트
		// 리스트: [] -> 키 = [인덱스] => 값 인덱스 0, 1, .....
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		
		// 맵: {"키":"값"} = 맵.키 => 값
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		
		String IdCheckFlag = "F";
		String flag = "F";
		String msg = "";
		
		
		hm.put("IdCheckFlag", IdCheckFlag);
		
		
		// 아이디 존재여부 체크
		int idCnt = loginDAO.SelectIdCnt(hm);
		
		
		if(idCnt > 0) {
			
			//id가 존재한다면	
			
			IdCheckFlag = "T";
			hm.put("IdCheckFlag", IdCheckFlag);
			
			int idAndPwdCnt = loginDAO.SelectIdCnt(hm);
			
			
			// 아이디와 패스워드가 존재하는지 체크
			if(idAndPwdCnt > 0) {
				Map<String, Object> map = loginDAO.SelectMember(hm);
				
				hm.put("m_nm", map.get("M_NM"));
				hm.put("m_grade", map.get("M_GRADE"));
				// 아이디와 비밀번호가 있다면
				flag = "T";
				msg = "환영합니다.";
				hm.put("flag", flag);
			} else {
				msg = "로그인 정보를 확인해주세요.";
			}
			
			
		} else {
			//id 존재하지 않는다면
			msg = "로그인 정보를 확인해주세요.";
		}
		
		
		resultMap.put("flag", flag);
		resultMap.put("msg", msg);
		result.add(resultMap);
		
		
		return result;
	}
	
	@Override
	public List<Map<String, Object>> FindMyId(Map<String, Object> hm) {
	
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		Map<String, Object> resultMap = new HashMap<String, Object>();
			
		// 휴대폰 번호 존재여부
		int hpCheck = loginDAO.CheckNumber(hm);
		
		String msg = "해당 정보가 없습니다.";
		String flag = "F";
		
		if(hpCheck > 0) {
			//핸드폰 번호가 존재한다면 이름 확인
			int nameCheck = loginDAO.CheckName(hm);
			
			if(nameCheck>0) {
				//핸드폰 번호와 이름이 같이 존재한다면
				Map<String, Object> map = loginDAO.FindMyId(hm);
				
				flag = "T";
				
				msg = "성공";
				hm.put("m_id", map.get("M_ID"));
				hm.put("flag", flag);
				resultMap.put("m_id", map.get("M_ID"));
			}
			
		}
		
		resultMap.put("flag", flag);
		resultMap.put("msg", msg);
		
		result.add(resultMap);
		
		return result;
	}
	
	@Override
	public List<Map<String, Object>> FindMyPwd(Map<String, Object> hm) {
	
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		Map<String, Object> resultMap = new HashMap<String, Object>();
			
		// 휴대폰 번호 존재여부
		int hpCheck = loginDAO.CheckNumber(hm);
		
		String msg = "해당 정보가 없습니다.";
		String flag = "F";
		
		if(hpCheck > 0) {
			//핸드폰 번호가 존재한다면 이름 확인
			int nameCheck = loginDAO.CheckName(hm);
			
			if(nameCheck>0) {
				//핸드폰 번호와 이름이 같이 존재한다면 아이디 확인
				int idCheck = loginDAO.SignupCheck(hm);
				
				if(idCheck>0) {
					Map<String, Object> map = loginDAO.FindMyPwd(hm);
					
					flag = "T";
					
					msg = "성공";
					hm.put("seq_no", map.get("SEQ_NO"));
					hm.put("flag", flag);
					resultMap.put("seq_no", map.get("SEQ_NO"));
				}
			}
			
		}
		
		resultMap.put("flag", flag);
		resultMap.put("msg", msg);
		
		result.add(resultMap);
		
		return result;
	}
	
	@Override
	public int ModPwd(Map<String, Object> hm) {
		return loginDAO.ModPwd(hm);
	}
}