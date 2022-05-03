package org.vision.rentcar;


import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.vision.rentcar.boardservice.RBContentService;
import org.vision.rentcar.boardservice.RBDeleteService;
import org.vision.rentcar.boardservice.RBListService;
import org.vision.rentcar.boardservice.RBModifyService;
import org.vision.rentcar.boardservice.RBModifyViewService;
import org.vision.rentcar.boardservice.RBReplyService;
import org.vision.rentcar.boardservice.RBReplyViewService;
import org.vision.rentcar.boardservice.RBWriteService;
import org.vision.rentcar.common.Constant;
import org.vision.rentcar.common.IService;

@Controller
@RequestMapping("/board/*")
public class RentBoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(RentBoardController.class);
	IService service;
	SqlSession sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		Constant.sqlSession = this.sqlSession;
	}
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale,Model model) {
		logger.info("렌트카 게시판입니다. The client local is {}.", locale);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate);
		model.addAttribute("message","렌트카 게시판입니다.");
		return "home";
	}
	

	@RequestMapping("/replyView")
	public String replyView(Model model,HttpServletRequest request) {
		System.out.println("replyView()실행");
		model.addAttribute("request", request);
		service = new RBReplyViewService();
		service.execute(model);
		return "/board/replyView";
	}
	
	
	@RequestMapping("/reply")
	public String reply(Model model,HttpServletRequest request) {
		System.out.println("reply()실행");
		model.addAttribute("request", request);
		service = new RBReplyService();
		service.execute(model);
		return "redirect:list";
	}

	@RequestMapping("/modifyView")
	public String modifyView(Model model,HttpServletRequest request) {
		System.out.println("modifyView()실행");
		model.addAttribute("request", request);
		service = new RBModifyViewService();
		service.execute(model);
		return "/board/modifyView";
	}
	
	
	
	@RequestMapping("/modify")
	public String modify(Model model,HttpServletRequest request) {
		System.out.println("modify()실행");
		model.addAttribute("request", request);
		service = new RBModifyService();
		service.execute(model);
		return"redirect:modifyOK";
	}
	
	@RequestMapping("/modifyOK")
	public String modifyOK(Model model) {
		System.out.println("modifyOK");
		return"/board/modifyOK";
	}
	
	@RequestMapping("/contentView")
	public String ContentView(Model model,HttpServletRequest request) {
		System.out.println("contentView()실행");
		model.addAttribute("request", request);
		service = new RBContentService();
		service.execute(model);
		return"/board/contentView";
	}
	
	
	@RequestMapping("/writeView")
	public String writeView(Model model) {
		System.out.println("writeView");
		return"/board/writeView";
	}
	

	
	@RequestMapping("/boardwrite")
	public String writer(Model model, HttpServletRequest request) {
		System.out.println("boardwrite()실행");
		model.addAttribute("request", request);
		service = new RBWriteService();
		service.execute(model);
		return"redirect:list";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(Model model, HttpServletRequest request) { // Model에 필요한 정보를 담에서 JSP로 전달함.
		System.out.println("delete() 실행");
		model.addAttribute("request", request);
		service = new RBDeleteService();
		service.execute(model);
		
		return "redirect:list"; // list페이지로 전환시키기.
		
	}

	
	@RequestMapping("/list")
	public String list(Model model) {
		model.addAttribute("message", "렌트카 게시판입니다.");
		service = new RBListService();
		service.execute(model);
		return"/board/list";
	}
	
}