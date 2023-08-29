package kr.co.SAMGUN.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.SAMGUN.service.impl.Common2ServiceImpl;


public interface MainService {

	List<Map<String, Object>> bestProgram(Map<String, Object> hm);

	List<Map<String, Object>> bestProgram2(Map<String, Object> hm);
	


}
