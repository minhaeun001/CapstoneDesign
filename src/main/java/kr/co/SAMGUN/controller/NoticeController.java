package kr.co.SAMGUN.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.SAMGUN.service.NoticeService;
import kr.co.SAMGUN.util.*;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	NoticeService noticeService;
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

	
	@RequestMapping("/notice.do")
	public String notice(HttpServletRequest request , HttpServletResponse response, ModelMap model ) {
		//클라이언트에서 넘어온 변수를  map 에 자동으로 할당함
		//Map<String,String> hm = RequestUtil.requestToMap(request) ;
		logger.info("프로그램:" + "notice/notice");
		return "notice/notice";
	}
	
	@RequestMapping("/notice_view.do")
	public String notice_view(HttpServletRequest request , HttpServletResponse response, ModelMap model ) {
		//클라이언트에서 넘어온 변수를  map 에 자동으로 할당함
		//Map<String,String> hm = RequestUtil.requestToMap(request) ;
		logger.info("프로그램:" + "notice/notice_view");
		return "notice/notice_view";
	}
	
	@RequestMapping("/notice_write.do")
	public String notice_write(HttpServletRequest request , HttpServletResponse response, ModelMap model ) {
		//클라이언트에서 넘어온 변수를  map 에 자동으로 할당함
		//Map<String,String> hm = RequestUtil.requestToMap(request) ;
		logger.info("프로그램:" + "notice/notice_write");
		return "notice/notice_write";
	}
	
	@RequestMapping("/notice_modify.do")
	public String notice_modify(HttpServletRequest request , HttpServletResponse response, ModelMap model ) {
		//클라이언트에서 넘어온 변수를  map 에 자동으로 할당함
		//Map<String,String> hm = RequestUtil.requestToMap(request) ;
		logger.info("프로그램:" + "notice/notice_modify");
		return "notice/notice_modify";
	}
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws Exception 
	 */
	@RequestMapping("/notice_01_list.ajax")
	public String notice_01_list_ajax(HttpServletRequest request , HttpServletResponse response, ModelMap model ) throws Exception {
		
		
		String searchSelector = request.getParameter("searchSelector");
		String searchText = request.getParameter("searchText");
		String boardType = request.getParameter("boardType");
		String pageNo = request.getParameter("pageNo");
		String pageSize = request.getParameter("pageSize");
		
		
		Map<String, Object> hm = new HashMap<String, Object>();
		hm.put("searchSelector", searchSelector);
		hm.put("searchText", searchText);
		hm.put("boardType", boardType);
		hm.put("pageNo", pageNo);
		hm.put("pageSize",pageSize);
		
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
	
	
	@RequestMapping("/notice_view.ajax")
	public String notice_view_ajax(HttpServletRequest request , HttpServletResponse response, ModelMap model ) throws Exception {
			
		String seqno = request.getParameter("seqno");
		
		Map<String, Object> hm = new HashMap<String, Object>();
		hm.put("seqno", seqno);
		
		Map<String, Object> result = noticeService.boardDetail(hm);
		
		model.addAttribute("result", result);
		
		return "jsonView";
	}
	
	@RequestMapping("/notice_prev.ajax")
	public String notice_prev(HttpServletRequest request , HttpServletResponse response, ModelMap model ) throws Exception {
			
		String seqno = request.getParameter("seqno");
		
		Map<String, Object> hm = new HashMap<String, Object>();
		hm.put("seqno", seqno);
		
		Map<String, Object> result = noticeService.boardPrev(hm);
		
		model.addAttribute("result", result);
		
		return "jsonView";
	}
	
	@RequestMapping("/notice_next.ajax")
	public String notice_next(HttpServletRequest request , HttpServletResponse response, ModelMap model ) throws Exception {
			
		String seqno = request.getParameter("seqno");
		
		Map<String, Object> hm = new HashMap<String, Object>();
		hm.put("seqno", seqno);
		
		Map<String, Object> result = noticeService.boardNext(hm);
		
		model.addAttribute("result", result);
		
		return "jsonView";
	}
	
	@RequestMapping("/notice_delete.ajax")
	public String notice_delete_ajax(HttpServletRequest request , HttpServletResponse response, ModelMap model ) throws Exception {
			
		String seqno = request.getParameter("seqno");
		
		Map<String, Object> hm = new HashMap<String, Object>();
		hm.put("seqno", seqno);
		
		
		// 자료타입            변수명        결과
		// 자료타입 == 결과의 타입은 같아야한다.
		int result = noticeService.DeleteNotice(hm);
		
		model.addAttribute("result", result);

		return "jsonView";
	}
	
	@RequestMapping("/notice_viewcnt.ajax")
	public String notice_viewcnt(HttpServletRequest request , HttpServletResponse response, ModelMap model ) throws Exception {
			
		String seqno = request.getParameter("seqno");
		
		Map<String, Object> hm = new HashMap<String, Object>();
		hm.put("seqno", seqno);
		int result = noticeService.ViewCntNotice(hm);
		
		model.addAttribute("result", result);
		
		return "jsonView";
	}
	
	@RequestMapping("/notice_likecnt.ajax")
	public String notice_likecnt(HttpServletRequest request , HttpServletResponse response, ModelMap model ) throws Exception {
		HttpSession session = request.getSession();
		String seqno = request.getParameter("seqno");
		
		if (session.getAttribute("m_id") == null) {
			model.addAttribute("result", null);
			model.addAttribute("msg", "로그인 후 이용해주세요.");
			model.addAttribute("flag", "F");
			return "jsonView";
		}
		
		Map<String, Object> hm = new HashMap<String, Object>();
		hm.put("seqno", seqno);
		hm.put("m_id", session.getAttribute("m_id"));

		Map<String, Object> result =  new HashMap<String, Object>();
		int updateCnt = noticeService.LikeCntNotice(hm);
		
		result.put("updateCnt", updateCnt);
		
		model.addAttribute("result", result);
		model.addAttribute("flag", "T");
		
		return "jsonView";
	}
	
	//파일 업로드하기
	
	String ROOT_FILE_PATH = "C:" + File.separator +"workspace" + File.separator +"upload"; 
	String FILE_PATH = "upload";
	
	@RequestMapping("/notice_save.ajax")
	public String notice_save(MultipartHttpServletRequest request , HttpServletResponse response, ModelMap model ) throws Exception {
		HttpSession session = request.getSession();
        
		Map<String, Object> hm = new HashMap<String, Object>();
		
		//1. 파일을 저장할 폴더가 있는지 확인하고, 없으면 만든다.
		String filePath = ROOT_FILE_PATH  + File.separator + RequestUtil.today() ;
		
		File file = new File(filePath);
        if(file.exists() == false){
        	file.mkdirs();
        }
		
        //2. 클라이언트에서 가져온 파일 정보를 가지고 서버 폴더에 복사한다.
        
       String originFileName = "";
       String fileSize = "";
       String fileExt = "";
       String targetFileName = "";
       
       //이름 변수 초기화
       int i = 1;
       List<MultipartFile> fileList = request.getFiles("files");
       if(fileList.size() > 2) {
	    	Map<String, Object> result = new HashMap<String, Object>();
	   		result.put("flag","F");
	   		result.put("msg", "첨부파일은 2개 까지만 가능합니다.");
	   		model.addAttribute("result",result);
	   		return "jsonView";
       }
       for (MultipartFile mf : fileList) {
    	   
    	   originFileName = "";
	       fileSize = "";
	       fileExt = "";
           targetFileName = "";
    	   
           if(StringUtils.isNotEmpty(mf.getOriginalFilename()) && !"".equals(mf.getOriginalFilename()) ) {
	    	   
	    	   originFileName = mf.getOriginalFilename();
	    	   fileSize = String.valueOf(mf.getSize()); 
		       fileExt = originFileName.substring(originFileName.lastIndexOf(".")+1);
		       targetFileName = UUID.randomUUID().toString();
	           
	         //filePath 폴더에 targetFileName 명으로 저장하기
	           file = new File(filePath + File.separator + targetFileName);
	           
	           try {
	        	   mf.transferTo(file);
               } catch (IllegalStateException e) {
                   // TODO Auto-generated catch block
                   e.printStackTrace();
               } catch (IOException e) {
                   // TODO Auto-generated catch block
                   e.printStackTrace();
               }   
               
	           
	        }
	       
	       hm.put("originFileName"+String.valueOf(i), originFileName);
           hm.put("fileSize"+String.valueOf(i), fileSize);
           hm.put("fileExt"+String.valueOf(i), fileExt);
           hm.put("targetFileName"+String.valueOf(i), targetFileName);
             
           
           i++;
        
       }
       
       int dotIndex = filePath.lastIndexOf(File.separator);
       if (dotIndex > 0) {
    	   filePath = filePath.substring(dotIndex+1);
       }
       //
       hm.put("filePath", filePath);
       
       logger.info("hm : " +  hm.toString());
     
		
		String title =request.getParameter("title");
		title = XSSCleanUtil.defaultXSS3(title);
		String contents = request.getParameter("contents");
		contents = XSSCleanUtil.defaultXSS3(contents);
		String modid = request.getParameter("modid");
		String boardtype = request.getParameter("boardtype");
		String category = request.getParameter("category");
		
		hm.put("regntid", session.getAttribute("m_id"));
		hm.put("regntnm", session.getAttribute("m_nm"));
		hm.put("title", title);
		hm.put("contents", contents);
		hm.put("modid", modid);
		hm.put("boardtype", boardtype);
		hm.put("category", category);
		
		int saveCnt = noticeService.NoticeSave(hm); //결과적으로 리턴받는 타입 int
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("saveCnt",saveCnt);
		model.addAttribute("result",result);
		return "jsonView";
	}
	
	@RequestMapping("/notice_modify.ajax")
	public String notice_modifybtn(MultipartHttpServletRequest request , HttpServletResponse response, ModelMap model ) throws Exception {
		// 1. session id를 이용해서 관리자인지 확인함
		HttpSession session = request.getSession();
		
		String m_id = (String) session.getAttribute("m_id");
		String m_grade = (String) session.getAttribute("m_grade");
		
		if(Integer.parseInt(m_grade)<10) {
			return "jsonView";
		}
		
		Map<String, Object> hm = new HashMap<String, Object>();
		
		//1. 파일을 저장할 폴더가 있는지 확인하고, 없으면 만든다.
		String filePath = ROOT_FILE_PATH  + File.separator + RequestUtil.today() ;
		
		File file = new File(filePath);
        if(file.exists() == false){
        	file.mkdirs();
        }
		
        //2. 클라이언트에서 가져온 파일 정보를 가지고 서버 폴더에 복사한다.
        
       String originFileName = "";
       String fileSize = "";
       String fileExt = "";
       String targetFileName = "";
       
       //이름 변수 초기화
       int i = 1;
       List<MultipartFile> fileList = request.getFiles("files");
       if(fileList.size() > 2) {
	    	Map<String, Object> result = new HashMap<String, Object>();
	   		result.put("flag","F");
	   		result.put("msg", "첨부파일은 2개 까지만 가능합니다.");
	   		model.addAttribute("result",result);
	   		return "jsonView";
       }
       
       
       
       for (MultipartFile mf : fileList) {
    	   
    	   originFileName = "";
	       fileSize = ""; 
	       fileExt = "";
           targetFileName = "";
    	   
           if(StringUtils.isNotEmpty(mf.getOriginalFilename()) && !"".equals(mf.getOriginalFilename()) ) {
	    	   
	    	   originFileName = mf.getOriginalFilename();
	    	   fileSize = String.valueOf(mf.getSize()); 
		       fileExt = originFileName.substring(originFileName.lastIndexOf(".")+1);
		       targetFileName = UUID.randomUUID().toString();
	           
	         //filePath 폴더에 targetFileName 명으로 저장하기
	           file = new File(filePath + File.separator + targetFileName);
	           
	           try {
	        	   mf.transferTo(file);
               } catch (IllegalStateException e) {
                   // TODO Auto-generated catch block
                   e.printStackTrace();
               } catch (IOException e) {
                   // TODO Auto-generated catch block
                   e.printStackTrace();
               }   
               
	           
	        }
	       
	       hm.put("originFileName"+String.valueOf(i), originFileName);
           hm.put("fileSize"+String.valueOf(i), fileSize);
           hm.put("fileExt"+String.valueOf(i), fileExt);
           hm.put("targetFileName"+String.valueOf(i), targetFileName);
             
           
           i++;
        
       }
       
       int dotIndex = filePath.lastIndexOf(File.separator);
       if (dotIndex > 0) {
    	   filePath = filePath.substring(dotIndex+1);
       }
       
       hm.put("filePath", filePath);
       
       logger.info("hm : " +  hm.toString());
		
		String seqno = request.getParameter("seqno");
		String title =request.getParameter("title");
		String contents = request.getParameter("contents");
		String category = request.getParameter("category");

		
		hm.put("modid", session.getAttribute("m_id"));
		hm.put("seqno",seqno);
		hm.put("title", title);
		hm.put("contents", contents);
		hm.put("category", category);
		
		int modCnt = noticeService.NoticeMod(hm); //결과적으로 리턴받는 타입 int
		Map<String, Object> result = new HashMap<String, Object>();
		
		result.put("modCnt",modCnt);
		model.addAttribute("result",result);
		return "jsonView";
	}
	
	@RequestMapping("/notice_del_file.ajax")
	public String notice_del_file(HttpServletRequest request , HttpServletResponse response, ModelMap model ) throws Exception {
		// 1. session id를 이용해서 관리자인지 확인함
		HttpSession session = request.getSession();
		
		String m_id = (String) session.getAttribute("m_id");
		String m_grade = (String) session.getAttribute("m_grade");
		
		if(Integer.parseInt(m_grade)<10) {
			return "jsonView";
		}
		
		// 2. 관리자일 경우만 아래 BL을 진행한다.
		String seqno = request.getParameter("seqno");
		String data_id = request.getParameter("data_id");
		String data_num = request.getParameter("data_num");
		String data_filepath = request.getParameter("data_filepath");
		
		Map<String, Object> hm = new HashMap<String, Object>();
		hm.put("seqno", seqno);
		hm.put("data_id", data_id);
		hm.put("m_id", m_id);
		hm.put("data_num", data_num);
		hm.put("data_filepath", data_filepath);
		
		// 자료타입            변수명        결과
		// 자료타입 == 결과의 타입은 같아야한다.
		int rtn_i = noticeService.DeleteFile(hm);
		Map<String, Object> result = new HashMap<String, Object>();
		
		if (rtn_i> 0) {
			String filePath = ROOT_FILE_PATH  + File.separator + data_filepath + File.separator + data_id ;
			
			File file = new File(filePath);
	        if(file.exists()){
	        	file.delete();
	        }
			
	   		result.put("flag","T");
	   		result.put("msg", "성공");
		} else {
			result.put("flag","F");
	   		result.put("msg", "실패");
		}
		model.addAttribute("result", result);

		return "jsonView";
	}
}
