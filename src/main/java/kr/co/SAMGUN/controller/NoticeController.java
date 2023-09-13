package kr.co.SAMGUN.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	@RequestMapping("/notice_save.ajax")
	public String notice_save(HttpServletRequest request , HttpServletResponse response, ModelMap model ) throws Exception {
		HttpSession session = request.getSession();
		String seqno = request.getParameter("seqno");
		
		Map<String, Object> hm = new HashMap<String, Object>();
		hm.put("seqno", seqno);

		
		String title =request.getParameter("title");
		title = XSSCleanUtil.defaultXSS3(title);
		String contents = request.getParameter("contents");
		contents = XSSCleanUtil.defaultXSS3(contents);
		String attachfile = request.getParameter("attachfile");
		String modid = request.getParameter("modid");
		String boardtype = request.getParameter("boardtype");
		String category = request.getParameter("category");
		
		hm.put("regntid", session.getAttribute("m_id"));
		hm.put("regntnm", session.getAttribute("m_nm"));
		hm.put("title", title);
		hm.put("contents", contents);
		hm.put("attachfile", attachfile);
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
	public String notice_modifybtn(HttpServletRequest request , HttpServletResponse response, ModelMap model ) throws Exception {
		HttpSession session = request.getSession();
		
		Map<String, Object> hm = new HashMap<String, Object>();
		
		String seqno = request.getParameter("seqno");
		String title =request.getParameter("title");
		String contents = request.getParameter("contents");
		String category = request.getParameter("category");
//		String regntid = request.getParameter("regntid");
//		String attachfile = request.getParameter("attachfile");
//		String regntnm = request.getParameter("regntnm");
//		String modid = request.getParameter("modid");
//		String boardtype = request.getParameter("boardtype");
		
		hm.put("modid", session.getAttribute("m_id"));
		hm.put("seqno",seqno);
		hm.put("title", title);
		hm.put("contents", contents);
		hm.put("category", category);
//		hm.put("regntid", regntid);
//		hm.put("attachfile", attachfile);
//		hm.put("regntnm", regntnm);
//		hm.put("modid", modid);
//		hm.put("boardtype", boardtype);
		
		int modCnt = noticeService.NoticeMod(hm); //결과적으로 리턴받는 타입 int
		Map<String, Object> result = new HashMap<String, Object>();
		
		result.put("modCnt",modCnt);
		model.addAttribute("result",result);
		return "jsonView";
	}
}
