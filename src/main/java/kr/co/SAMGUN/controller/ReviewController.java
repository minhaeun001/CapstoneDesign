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

import kr.co.SAMGUN.service.ReviewService;

@Controller
@RequestMapping("/review")
public class ReviewController {

	@Autowired
	ReviewService reviewService;
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);

	
	@RequestMapping("/review.do")
	public String review(HttpServletRequest request , HttpServletResponse response, ModelMap model ) {
		//클라이언트에서 넘어온 변수를  map 에 자동으로 할당함
		//review_modifyMap<String,String> hm = RequestUtil.requestToMap(request) ;
		logger.info("프로그램:" + "review/review");
		return "review/review";
	}
	
	@RequestMapping("/review_view.do")
	public String review_view(HttpServletRequest request , HttpServletResponse response, ModelMap model ) {
		//클라이언트에서 넘어온 변수를  map 에 자동으로 할당함
		//Map<String,String> hm = RequestUtil.requestToMap(request) ;
		logger.info("프로그램:" + "review/review_view");
		return "review/review_view";
	}
	
	@RequestMapping("/review_write.do")
	public String review_write(HttpServletRequest request , HttpServletResponse response, ModelMap model ) {
		//클라이언트에서 넘어온 변수를  map 에 자동으로 할당함
		//Map<String,String> hm = RequestUtil.requestToMap(request) ;
		logger.info("프로그램:" + "review/review_write");
		return "review/review_write";
	}
	
	@RequestMapping("/review_modify.do")
	public String review_modify(HttpServletRequest request , HttpServletResponse response, ModelMap model ) {
		//클라이언트에서 넘어온 변수를  map 에 자동으로 할당함
		//Map<String,String> hm = RequestUtil.requestToMap(request) ;
		logger.info("프로그램:" + "review/review_modify");
		return "review/review_modify";
	}
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws Exception 
	 */
	@RequestMapping("/review_01_list.ajax")
	public String review_01_list(HttpServletRequest request , HttpServletResponse response, ModelMap model ) throws Exception {
		
		
		String searchSelector = request.getParameter("searchSelector");
		String searchText = request.getParameter("searchText");
		String boardType = request.getParameter("boardType");
		String boardSubType = request.getParameter("boardSubType");
		String pageNo = request.getParameter("pageNo");
		String pageSize = request.getParameter("pageSize");
		
		Map<String, Object> hm = new HashMap<String, Object>();
		hm.put("searchSelector", searchSelector);
		hm.put("searchText", searchText);
		hm.put("boardType", boardType);
		hm.put("boardSubType", boardSubType);
		hm.put("pageNo", pageNo);
		hm.put("pageSize",pageSize);
		
		//클라이언트에서 넘어온 변수를  map 에 자동으로 할당함
//		Map<String,Object> hm = RequestUtil.requestToMap(request, false) ;
//		logger.info("hm : " +  hm.toString());

		 
//		
//		//디비에서 가져온 리스트를 할당함
		List<Map<String, Object>> rstList = reviewService.listReviewType(hm);
//
//		//클라이언트에 보낼 데이터를 모델에 담는다.
//		model.addAttribute("result", rstList);
//		model.addAttribute("totalcnt", totalcnt);
		
		model.addAttribute("result", rstList);
		
		return "jsonView";
	}
	
	@RequestMapping("/review_view.ajax")
	public String reiview_view_ajax(HttpServletRequest request , HttpServletResponse response, ModelMap model ) throws Exception {
			
		String seqno = request.getParameter("seqno");
		String boardType = request.getParameter("boardType");
		String boardSubType = request.getParameter("boardSubType");
		
		Map<String, Object> hm = new HashMap<String, Object>();
		hm.put("seqno", seqno);
		hm.put("boardType", boardType);
		hm.put("boardSubType", boardSubType);
		
		Map<String, Object> result = reviewService.boardDetail(hm);
		
		model.addAttribute("result", result);
		
		return "jsonView";
	}
	
	@RequestMapping("/review_prev.ajax")
	public String review_prev(HttpServletRequest request , HttpServletResponse response, ModelMap model ) throws Exception {
			
		String seqno = request.getParameter("seqno");
		String boardType = request.getParameter("boardType");
		String boardSubType = request.getParameter("boardSubType");
		
		Map<String, Object> hm = new HashMap<String, Object>();
		hm.put("seqno", seqno);
		hm.put("boardType", boardType);
		hm.put("boardSubType", boardSubType);
		
		Map<String, Object> result = reviewService.boardPrev(hm);
		
		model.addAttribute("result", result);
		
		return "jsonView";
	}
	
	@RequestMapping("/review_next.ajax")
	public String review_next(HttpServletRequest request , HttpServletResponse response, ModelMap model ) throws Exception {
			
		String seqno = request.getParameter("seqno");
		String boardType = request.getParameter("boardType");
		String boardSubType = request.getParameter("boardSubType");
		
		Map<String, Object> hm = new HashMap<String, Object>();
		hm.put("seqno", seqno);
		hm.put("boardType", boardType);
		hm.put("boardSubType", boardSubType);
		
		Map<String, Object> result = reviewService.boardNext(hm);
		
		model.addAttribute("result", result);
		
		return "jsonView";
	}
	
	@RequestMapping("/review_delete.ajax")
	public String review_delete_ajax(HttpServletRequest request , HttpServletResponse response, ModelMap model ) throws Exception {
			
		String seqno = request.getParameter("seqno");
		String boardType = request.getParameter("boardType");
		String boardSubType = request.getParameter("boardSubType");
		
		Map<String, Object> hm = new HashMap<String, Object>();
		hm.put("seqno", seqno);
		hm.put("boardType", boardType);
		hm.put("boardSubType", boardSubType);		
		
		// 자료타입            변수명        결과
		// 자료타입 == 결과의 타입은 같아야한다.
		int result = reviewService.DeleteReview(hm);
		
		model.addAttribute("result", result);

		return "jsonView";
	}
	
	@RequestMapping("/review_viewcnt.ajax")
	public String review_viewcnt(HttpServletRequest request , HttpServletResponse response, ModelMap model ) throws Exception {
			
		String seqno = request.getParameter("seqno");
		String boardType = request.getParameter("boardType");
		String boardSubType = request.getParameter("boardSubType");
		
		Map<String, Object> hm = new HashMap<String, Object>();
		hm.put("seqno", seqno);
		hm.put("boardType", boardType);
		hm.put("boardSubType", boardSubType);
		
		int result = reviewService.ViewCntReview(hm);
		
		model.addAttribute("result", result);
		
		return "jsonView";
	}
	
	@RequestMapping("/review_likecnt.ajax")
	public String review_likecnt(HttpServletRequest request , HttpServletResponse response, ModelMap model ) throws Exception {
		HttpSession session = request.getSession();
		String seqno = request.getParameter("seqno");
		String boardType = request.getParameter("boardType");
		String boardSubType = request.getParameter("boardSubType");
		
		if (session.getAttribute("m_id") == null) {
			model.addAttribute("result", null);
			model.addAttribute("msg", "로그인 후 이용해주세요.");
			model.addAttribute("flag", "F");
			return "jsonView";
		}
		
		Map<String, Object> hm = new HashMap<String, Object>();
		hm.put("seqno", seqno);
		hm.put("boardType", boardType);
		hm.put("boardSubType", boardSubType);
		hm.put("m_id", session.getAttribute("m_id"));

		Map<String, Object> result =  new HashMap<String, Object>();
		int updateCnt = reviewService.LikeCntReview(hm);
		
		result.put("updateCnt", updateCnt);
		
		model.addAttribute("result", result);
		model.addAttribute("flag", "T");
		
		return "jsonView";
	}
	
	@RequestMapping("/review_save.ajax")
	public String review_save(HttpServletRequest request , HttpServletResponse response, ModelMap model ) throws Exception {
		
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("m_id");
		String m_nm = (String) session.getAttribute("m_nm");
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		if( null == m_id || "".equals(m_id)) {
			String msg = "로그인 후 이용해주세요.";
			
			result.put("msg", msg);
			model.addAttribute("result", result);
			return "jsonView";
		}
		
		
		String title =request.getParameter("title");
		String contents = request.getParameter("contents");
		String attachfile = request.getParameter("attachfile");
		String boardType = request.getParameter("boardType");
		String boardSubType = request.getParameter("boardSubType");
		
		
		Map<String, Object> hm = new HashMap<String, Object>();
		hm.put("title", title);
		hm.put("contents", contents);
		hm.put("regntid", m_id);
		hm.put("attachfile", attachfile);
		hm.put("regntnm", m_nm);
		hm.put("modid", m_id);
		hm.put("boardType", boardType);
		hm.put("boardSubType", boardSubType);
		
		int saveCnt = reviewService.ReviewSave(hm); //결과적으로 리턴받는 타입 int
		
		result.put("saveCnt",saveCnt);
		model.addAttribute("result",result);
		return "jsonView";
	}
	
	@RequestMapping("/review_modify.ajax")
	public String review_modifybtn(HttpServletRequest request , HttpServletResponse response, ModelMap model ) throws Exception {
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("m_id");
		
		String seqno = request.getParameter("seqno");
		String title =request.getParameter("title");
		String contents = request.getParameter("contents");
		String boardType = request.getParameter("boardType");
		String boardSubType = request.getParameter("boardSubType");
//		String regntid = request.getParameter("regntid");
//		String attachfile = request.getParameter("attachfile");
//		String regntnm = request.getParameter("regntnm");
//		String modid = request.getParameter("modid");
//		String boardtype = request.getParameter("boardtype");
		
		Map<String, Object> hm = new HashMap<String, Object>();
		hm.put("modid", m_id);
		hm.put("seqno",seqno);
		hm.put("title", title);
		hm.put("contents", contents);
		hm.put("boardType", boardType);
		hm.put("boardSubType", boardSubType);
		
		int modCnt = reviewService.ReviewMod(hm); //결과적으로 리턴받는 타입 int
		Map<String, Object> result = new HashMap<String, Object>();
		
		result.put("modCnt",modCnt);
		model.addAttribute("result",result);
		return "jsonView";
	}
	
	@RequestMapping("/review_comments_save.ajax")
	public String review_comments_save(HttpServletRequest request , HttpServletResponse response, ModelMap model ) throws Exception {
		
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("m_id");
		String m_nm = (String) session.getAttribute("m_nm");
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		if( null == m_id || "".equals(m_id)) {
			String msg = "로그인 후 이용해주세요.";
			
			result.put("msg", msg);
			model.addAttribute("result", result);
			model.addAttribute("flag", "F");
			return "jsonView";
		}
		
		
		String contents =request.getParameter("contents");
		String boardType = request.getParameter("boardType");
		String prt_seqno = request.getParameter("prt_seqno");
		String boardSubType = request.getParameter("boardSubType");
		
		Map<String, Object> hm = new HashMap<String, Object>();
		hm.put("prt_seqno",prt_seqno);
		hm.put("contents", contents);
		hm.put("m_id", m_id);
		hm.put("regntnm", m_nm);
		hm.put("modid", m_id);
		hm.put("boardType", boardType);
		hm.put("boardSubType", boardSubType);
	
		
		int saveCnt = reviewService.ReviewCommentSave(hm); //결과적으로 리턴받는 타입 int
		
		result.put("saveCnt",saveCnt);
		model.addAttribute("result",result);
		model.addAttribute("flag", "T");

		return "jsonView";
	}
	
	@RequestMapping("/comments_listType.ajax")
	public String comments_listType(HttpServletRequest request , HttpServletResponse response, ModelMap model ) throws Exception {
		
		
		String prt_seqno = request.getParameter("prt_seqno");
		String boardType = request.getParameter("boardType");
		String boardSubType = request.getParameter("boardSubType");
		
		Map<String, Object> hm = new HashMap<String, Object>();
		hm.put("prt_seqno", prt_seqno);
		hm.put("boardType", boardType);
		hm.put("boardSubType", boardSubType);
		
		 
//		
//		//디비에서 가져온 리스트를 할당함
		List<Map<String, Object>> rstList = reviewService.CommentsList(hm);
//
//		//클라이언트에 보낼 데이터를 모델에 담는다.
//		model.addAttribute("result", rstList);
//		model.addAttribute("totalcnt", totalcnt);
		
		model.addAttribute("result", rstList);
		
		return "jsonView";
	}
}