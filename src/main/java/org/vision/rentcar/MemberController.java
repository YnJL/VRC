package org.vision.rentcar;

import java.sql.SQLException;
import java.util.Arrays;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.vision.rentcar.dao.RentMemberDAO;
import org.vision.rentcar.model.RentMember;

/**
 * Servlet implementation class LedgerController
 */
@Controller
public class MemberController{
//	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
//	IBoardService service;
//	SqlSession sqlSession;
//	
//	@Autowired
//	public void setSqlSession(SqlSession sqlSession) {
//		this.sqlSession = sqlSession;
//		Constant.sqlSession = this.sqlSession;
//	}
      
	@Autowired
	private SqlSession sqlSession;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	@RequestMapping("/mlist")
	public String mlist(Model model) throws SQLException {
		RentMemberDAO dao = sqlSession.getMapper(RentMemberDAO.class);
		model.addAttribute("mlist",dao.selectAll());
		return "mlist";
	}
	
    @RequestMapping("/mdelete")
	public String mdelete(HttpServletRequest request) throws SQLException {
    	RentMemberDAO dao = sqlSession.getMapper(RentMemberDAO.class);
		dao.delete(request.getParameter("id"));
		return "redirect:mlist";
	}
    
    @RequestMapping("/myinfo")
	public String myinfo(Model model, HttpServletRequest request) throws SQLException {
    	HttpSession session=request.getSession();
    	String id = (String) session.getAttribute("id");
    	RentMemberDAO dao = sqlSession.getMapper(RentMemberDAO.class);
    	RentMember dto = dao.select(id);
    	model.addAttribute("info", dto);
		return "myinfo";
	}
    
    @RequestMapping("/mmod")
	public String mmod(Model model, HttpServletRequest request) throws SQLException {
    	HttpSession session=request.getSession();
    	String id = (String) session.getAttribute("id");
    	RentMemberDAO dao = sqlSession.getMapper(RentMemberDAO.class);
    	RentMember dto = dao.select(id);
    	model.addAttribute("info", dto);
		return "mmod";
	}
    
    @RequestMapping("/member/mmodify")
	public String mmodify(Model model, HttpServletRequest request) throws SQLException {
    	HttpSession session=request.getSession();
    	String id = (String) session.getAttribute("id");
    	RentMemberDAO dao = sqlSession.getMapper(RentMemberDAO.class);
    	RentMember dto = dao.select(id);
    	model.addAttribute("info", dto);
		return "redirect:/";
	}
    
    
	@RequestMapping("/regform")
	public String regform() {
		return "regform";
	}
	@RequestMapping("/register")
	public String register(HttpServletRequest request) throws SQLException {
		HttpSession session = request.getSession();
		RentMemberDAO dao = sqlSession.getMapper(RentMemberDAO.class);
		String hobbies[] = request.getParameterValues("hobby");
		String hobby= Arrays.toString(hobbies);
		RentMember ex = null;
		String id = request.getParameter("id");
		ex=dao.select(id);
		if(ex!=null) {
			session.setAttribute("check", "failure");
			return "regcheck";
		} else {
			String email = request.getParameter("email");
			String tel = request.getParameter("tel");
			String age = request.getParameter("age");
			String job = request.getParameter("job");
			System.out.println(email);
			System.out.println(tel);
			System.out.println(job);
			System.out.println(hobby);
			if(email=="") email="미등록";
			if(tel=="") tel="미등록";
			if(age==null) age="미등록";
			if(job=="") job="미등록";
			if(hobby=="null") hobby="기타";
			RentMember dto = new RentMember(id,request.getParameter("password"),email,tel,age,hobby,job);
			dao.insert(dto);
			session.setAttribute("check", "success");
			return "regcheck";
		}
	}
	
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/";
	}

}
