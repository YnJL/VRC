package org.vision.rentcar;

import java.sql.SQLException;
import java.text.DateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.vision.rentcar.common.Constant;
import org.vision.rentcar.common.IService;
import org.vision.rentcar.dao.RentMemberDAO;
import org.vision.rentcar.memberservice.RMJoinBatchService;
import org.vision.rentcar.memberservice.RMJoinService;
import org.vision.rentcar.memberservice.RMListService;
import org.vision.rentcar.model.RentMember;

@Controller
@RequestMapping("/member/*")
public class RentMemberController {
	
	public static final Logger logger = LoggerFactory.getLogger(RentMemberController.class);
	
	IService service;
	SqlSession sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		Constant.sqlSession = this.sqlSession;
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("회원등록 페이지입니다. The client locale is {}.", locale);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("message", "회원등록 페이지입니다." );
		return "home";
	}
	
	@RequestMapping("/joinForm")
	public String writeForm() {
		return "/member/joinForm";
	}
	
	
	@RequestMapping("/join")
	public String join(Model model, HttpServletRequest request) {
		service = new RMJoinService();
		System.out.println("join()실행");
		model.addAttribute("request",request);
		service.execute(model);
		return "redirect:/";
	}
	
	@RequestMapping("/batchForm")
	public String batchForm() {
		return"/member/batchForm";
	}
	@RequestMapping("/batch_OK")
	public String batch_OK() {
		return"/member/batch_OK";
	}
	
	@RequestMapping("/joinBatch")
	public String joinBatch(Model model,HttpServletRequest request) {
		service = new RMJoinBatchService();
		System.out.println("joinBatch()실행");
		model.addAttribute("request", request);
		service.execute(model);
		return "redirect:/member/batch_OK";
	}
	
	@RequestMapping("loginForm")
	public String loginForm(Model model) {
		return"member/loginForm";
	}
	
	@RequestMapping("login")
	public String loginProc(Model model,HttpServletRequest request,HttpServletResponse response) {
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String referer = request.getHeader("Referer");
		HttpSession session = request.getSession();
		model.addAttribute("request", request);
		try {
			RentMemberDAO dao = sqlSession.getMapper(RentMemberDAO.class);
			RentMember vo = dao.select(id);
			if(vo.getPass().equals(pass)) {
//				if(request.getParameter("cookieSave")!= null) {
//					Cookie cookie = new Cookie("id",id);
//					cookie.setMaxAge(60*60*24);//하루 
//					response.addCookie(cookie);
					session.setAttribute("id",id);
					session.setMaxInactiveInterval(60*30);//30분
					session.setAttribute("check", "success");
//				}
			}else {
				session.setAttribute("check", "failure");
			}
		} catch (SQLException e) {
			session.setAttribute("check", "except");
			e.printStackTrace();
		} finally {
			session.setAttribute("ref", referer);
			return "logincheck";
		}
		
	} 

//	@RequestMapping("/login")
//	public String login(Model model,HttpServletRequest request,HttpServletResponse response) {
//		String id = request.getParameter("id");
//		String pass = request.getParameter("pass");
//		RentMemberDAO dao = sqlSession.getMapper(RentMemberDAO.class);
//		HttpSession session = request.getSession();
//		String referer = request.getHeader("Referer");
//		try {
//			RentMember dto = dao.select(id);
//			String pw = dto.getPass();
//			if (pass.equals(pw)) {
//				session.setAttribute("id", id);
//				session.setMaxInactiveInterval(60*30);//30분
//				session.setAttribute("check", "success");
//			} else {
//				session.setAttribute("check", "failure");
//			}
//		} catch (Exception e) {
//				session.setAttribute("check", "except");
//				e.printStackTrace();
//		}
//		session.setAttribute("ref", referer);
//		return "logincheck";
//	} 

	
	@RequestMapping("loginNG")
	public String loginNG(Model model) {
		return"member/loginNG";
	}

	@RequestMapping("mypage")
	public String myinfo(Model model, HttpServletRequest request) {
    	HttpSession session=request.getSession();
    	String id = (String) session.getAttribute("id");
    	RentMemberDAO dao = sqlSession.getMapper(RentMemberDAO.class);
    	RentMember dto = null;
		try {
			dto = dao.select(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	model.addAttribute("info", dto);
		return "member/mypage";
	}	
	//회원정보 수정
	@RequestMapping("/update")
	public String mmod(Model model, HttpServletRequest request) {
    	HttpSession session=request.getSession();
    	String id = (String) session.getAttribute("id");
    	RentMemberDAO dao = sqlSession.getMapper(RentMemberDAO.class);
    	RentMember dto = null;
		try {
			dto = dao.select(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	model.addAttribute("info", dto);
		return "member/update";
	}
	@RequestMapping("/update_ok")
	public String mmod1(Model model, HttpServletRequest request) {
    	HttpSession session=request.getSession();
    	String id = (String) session.getAttribute("id");
    	RentMemberDAO dao = sqlSession.getMapper(RentMemberDAO.class);
    	RentMember dto = null;
		try {
			dto = dao.select(id);
			String hobbies[] = request.getParameterValues("hobby");
			String hobby= Arrays.toString(hobbies);
			dto.setPass(request.getParameter("pass"));
			dto.setEmail(request.getParameter("email"));
			dto.setTel(request.getParameter("tel"));
			dto.setAge(request.getParameter("age"));
			dto.setHobby(hobby);
			dto.setJob(request.getParameter("job"));

			dao.update(dto);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	model.addAttribute("info", dto);
		return "member/update_ok";
	}

	@RequestMapping("/list")
	public String list(Model model) {
		service = new RMListService();
		service.execute(model);
		return "/member/list";
	}
	
    @RequestMapping("/mdelete")
	public String mdelete(HttpServletRequest request) throws SQLException {
    	RentMemberDAO dao = sqlSession.getMapper(RentMemberDAO.class);
		dao.delete(request.getParameter("id"));
		return "redirect:./logout";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/";
		
	}
}


