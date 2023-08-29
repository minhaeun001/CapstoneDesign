package kr.co.SAMGUN.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeSet;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.SAMGUN.service.NoticeService;
import kr.co.SAMGUN.util.*;

@Controller
@RequestMapping("/notice2")
public class Example {

	private static final Logger logger = LoggerFactory.getLogger(Example.class);

	@Autowired
	NoticeService noticeService;
	
	
	@RequestMapping("/notice_01_list.do")
	public String notice_01_list(HttpServletRequest request , HttpServletResponse response, ModelMap model ) {
		//클라이언트에서 넘어온 변수를  map 에 자동으로 할당함
		//Map<String,String> hm = RequestUtil.requestToMap(request) ;
		logger.info("프로그램:" + "notice/notice_01_list");
		
		return "notice/notice_01_list";
	}
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws Exception 
	 */
	@RequestMapping("/notice_01_list.ajax")
	public String notice_01_list_ajax(HttpServletRequest request , HttpServletResponse response, ModelMap model ) throws Exception {
		
		
		String searchSelector = request.getParameter("searchSelector");
		String searchText = request.getParameter("searchText");
		
		Map<String, Object> hm = new HashMap<String, Object>();
		hm.put("searchSelector", searchSelector);
		hm.put("searchText", searchText);
		
		//클라이언트에서 넘어온 변수를  map 에 자동으로 할당함
//		Map<String,Object> hm = RequestUtil.requestToMap(request, false) ;
//		logger.info("hm : " +  hm.toString());

		
//		int totalcnt = noticeService.selectTotalCnt(hm); 
//		
//		//디비에서 가져온 리스트를 할당함
		List<Map<String, Object>> rstList = noticeService.listNoticeType(hm);
//
//		//클라이언트에 보낼 데이터를 모델에 담는다.
//		model.addAttribute("result", rstList);
//		model.addAttribute("totalcnt", totalcnt);
		
		model.addAttribute("result", rstList);
		
		return "jsonView";
	}
	

		@RequestMapping("/notice_write_01.do")
		public String notice_write_01(HttpServletRequest request , HttpServletResponse response, ModelMap model ) {
			//클라이언트에서 넘어온 변수를  map 에 자동으로 할당함
			//Map<String,String> hm = RequestUtil.requestToMap(request) ;
			logger.info("프로그램:" + "notice/notice_write_01");
			return "notice/notice_write_01";
		}
	
	//파일 업로드하기
	
		String ROOT_FILE_PATH = "C:" + File.separator +"workspace" + File.separator +"SAMGUN" + File.separator +"src" + File.separator +"main" + File.separator +"webapp" + File.separator + "resources" + File.separator +"upload"; 
		String FILE_PATH = "resources/upload";
		
		@RequestMapping("/notice_write_01.ajax")
		public String notice_board_write(MultipartHttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
			//클라이언트에서 넘어온 변수를  map 에 자동으로 할당함
//			Map<String,String> hm = RequestUtil.requestToMap(request) ;
			
			String m_id = request.getParameter("m_id");
			String type = request.getParameter("type");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String boardType = request.getParameter("boardType");
			String seq = request.getParameter("seq"); ;//null 일경우는 최초 글쓰기 상태, 값이 있으면 답글 상태
			
			Map<String, Object> hm = new HashMap<String, Object>();
			hm.put("type", type);
			hm.put("m_id", m_id);
			hm.put("title", title);
			hm.put("content", content);
			hm.put("boardType", boardType);
			hm.put("seq", seq);
				
			//1. 파일을 저장할 폴더가 있는지 확인하고, 없으면 만든다.
//			String filePath = ROOT_FILE_PATH  + File.separator + RequestUtil.today() ;
//			
//			File file = new File(filePath);
//	        if(file.exists() == false){
//	        	file.mkdirs();
//	        }
//	       
//	        //2. 클라이언트에서 가져온 파일 정보를 가지고 서버 폴더에 복사한다.
//           
//	       String originFileName = "";
//	       String fileSize = ""; 
//	       String fileExt = "";
//           String targetFileName = "";
//           
//           //이름 변수 초기화
//           int i = 1;
//           List<MultipartFile> fileList = request.getFiles("files");
//           
//           for (MultipartFile mf : fileList) {
//        	   
//        	   originFileName = "";
//    	       fileSize = ""; 
//    	       fileExt = "";
//               targetFileName = "";
//        	   
//               if(StringUtils.isNotEmpty(mf.getOriginalFilename()) && !"".equals(mf.getOriginalFilename()) ) {
//    	    	   
//    	    	   originFileName = mf.getOriginalFilename();
//    	    	   fileSize = String.valueOf(mf.getSize()); 
//    		       fileExt = originFileName.substring(originFileName.lastIndexOf(".")+1);
//    		       targetFileName = UUID.randomUUID().toString();
//    	           
//    	         //filePath 폴더에 targetFileName 명으로 저장하기
//    	           file = new File(filePath + File.separator + targetFileName);
//    	           
//    	           try {
//    	        	   mf.transferTo(file);
//                   } catch (IllegalStateException e) {
//                       // TODO Auto-generated catch block
//                       e.printStackTrace();
//                   } catch (IOException e) {
//                       // TODO Auto-generated catch block
//                       e.printStackTrace();
//                   }   
//                   
//    	           
//    	        }
//    	       
//    	       hm.put("originFileName"+String.valueOf(i), originFileName);
//               hm.put("fileSize"+String.valueOf(i), fileSize);
//               hm.put("fileExt"+String.valueOf(i), fileExt);
//               hm.put("targetFileName"+String.valueOf(i), targetFileName);
//                 
//               
//               i++;
//            
//           }
//           
//           
//           hm.put("filePath", filePath);
//           
//           logger.info("hm : " +  hm.toString());
//           
           int result = 0 ;
           
//           //답글쓰기 이면서 seq 가 1이상의 숫자이면 즉, 답글쓰기이면 답글에 필수적 데이터를 만들기 위해 기존에 저장된 데이터를 호춣한다. 
//           if (StringUtils.isNotEmpty(type) && "R".equals(type) && StringUtils.isNotEmpty(seq) && Integer.valueOf( seq ) > 0 ) {
//        	   
//	        	//seq의 정보
//	   			Map<String, Object> rst = noticeService.boardDetail(hm);
//
//	   			//답글로 등록하기 위한 정보 세팅
//           
//	   			hm.put("pSeq", rst.get("SEQ") ); //seq 가 부모 seq가 됨
//	   			hm.put("gSeq", rst.get("G_SEQ") ); //
//	   			hm.put("step", rst.get("M_STEP") );
//	   			hm.put("gSeqOrder", rst.get("M_G_SEQ_ORDER") );
//	   			
//	   			//들어갈  G_SEQ_ORDER 이상인 순번을 +1 씩해서 G_SEQ_ORDER 들어갈 값을 비워둔다
//	   			int updatInt = noticeService.boardUpdateGSeqOrder(hm);
//	   			
//	   			hm.put("ansCnt", rst.get("ANS_CNT") );
//	   			
//	   			result = noticeService.noticeBoardReply(hm);
//           
//           } else {
        	   result = noticeService.noticeBoardWrite(hm);
        	   
//           }
           
           model.addAttribute("result", result);
           
			return "jsonView";
		}
		
	
	@RequestMapping("/notice_01_view.do")
	public String notice_01_view(HttpServletRequest request , HttpServletResponse response, ModelMap model ) {
		//클라이언트에서 넘어온 변수를  map 에 자동으로 할당함
		//Map<String,String> hm = RequestUtil.requestToMap(request) ;
		logger.info("프로그램:" + "notice/notice_01_view");
		return "notice/notice_01_view";
	}
		
}