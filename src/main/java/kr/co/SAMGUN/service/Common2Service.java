package kr.co.SAMGUN.service;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.SAMGUN.service.impl.Common2ServiceImpl;


public interface Common2Service {

	int checkId(Map<String, Object> hm);

	int joinSave(Map<String, Object> hm);

	int loginIdProc(Map<String, Object> hm);

	Map<String, Object> loginPwProc(Map<String, Object> hm);
	


}
