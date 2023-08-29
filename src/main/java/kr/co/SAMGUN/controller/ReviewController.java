package kr.co.SAMGUN.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.SAMGUN.service.NoticeService;
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
		String modid = "수정id";
		String seqno = request.getParameter("seqno");
		String title =request.getParameter("title");
		String contents = request.getParameter("contents");
//		String regntid = request.getParameter("regntid");
//		String attachfile = request.getParameter("attachfile");
//		String regntnm = request.getParameter("regntnm");
//		String modid = request.getParameter("modid");
//		String boardtype = request.getParameter("boardtype");
		
		Map<String, Object> hm = new HashMap<String, Object>();
		hm.put("modid", modid);
		hm.put("seqno",seqno);
		hm.put("title", title);
		hm.put("contents", contents);
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
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws Exception 
	 */
	@RequestMapping("/review_01_list.ajax")
	public String review_01_list(HttpServletRequest request , HttpServletResponse response, ModelMap model ) throws Exception {
		
		
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
		List<Map<String, Object>> rstList = reviewService.listReviewType(hm);
//
//		//클라이언트에 보낼 데이터를 모델에 담는다.
//		model.addAttribute("result", rstList);
//		model.addAttribute("totalcnt", totalcnt);
		
		model.addAttribute("result", rstList);
		
		return "jsonView";
	}
	
	@RequestMapping("/review_likecnt.ajax")
	public String review_likecnt(HttpServletRequest request , HttpServletResponse response, ModelMap model ) throws Exception {
			
		String seqno = request.getParameter("seqno");
		
		Map<String, Object> hm = new HashMap<String, Object>();
		hm.put("seqno", seqno);
		
		Map<String, Object> result =  new HashMap<String, Object>();
		int updateCnt = reviewService.LikeCntReview(hm);
		
		result.put("updateCnt", updateCnt);
		
		model.addAttribute("result", result);
		
		return "jsonView";
	}
	
	//삭제하기
	
	@RequestMapping("/review_delete.ajax")
	public String review_delete_ajax(HttpServletRequest request , HttpServletResponse response, ModelMap model ) throws Exception {
			
		String seqno = request.getParameter("seqno");
		
		Map<String, Object> hm = new HashMap<String, Object>();
		hm.put("seqno", seqno);
		
		
		// 자료타입            변수명        결과
		// 자료타입 == 결과의 타입은 같아야한다.
		int result = reviewService.DeleteReview(hm);
		
		model.addAttribute("result", result);

		return "jsonView";
	}
	
	@RequestMapping("/review_viewcnt.ajax")
	public String review_viewcnt(HttpServletRequest request , HttpServletResponse response, ModelMap model ) throws Exception {
			
		String seqno = request.getParameter("seqno");
		
		Map<String, Object> hm = new HashMap<String, Object>();
		hm.put("seqno", seqno);
		
		int result = reviewService.ViewCntReview(hm);
		
		model.addAttribute("result", result);
		
		return "jsonView";
	}
}