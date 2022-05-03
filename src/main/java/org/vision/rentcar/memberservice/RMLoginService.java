package org.vision.rentcar.memberservice;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.vision.rentcar.common.Constant;
import org.vision.rentcar.common.IService;
import org.vision.rentcar.dao.RentMemberDAO;
import org.vision.rentcar.model.RentMember;

public class RMLoginService implements IService{
	private RentMemberDAO dao;
	SqlSession sqlSession = Constant.sqlSession;
	
	@Override
	public void execute(Model model) {
		dao = sqlSession.getMapper(RentMemberDAO.class);
		Map<String,Object>map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpServletResponse response = (HttpServletResponse)map.get("response");
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		HttpSession session = request.getSession();
		session.setAttribute("id", id);
		session.setMaxInactiveInterval(60*5); //5분
		dao = sqlSession.getMapper(RentMemberDAO.class);
		RentMember dto = null;
		
		try {
			dto = dao.select(id);
			if(dto.getId()==null) {
				System.out.println("등록된 아이디가 없습니다.");
			}else {
				if((dto.getPass()).equals(pass)) {
					if(request.getParameter("coocieSave")!= null) {
						Cookie cookie = new Cookie("id", id);
						cookie.setMaxAge(60*60*40); // 하루
						response.addCookie(cookie);
					}
					
					}else {
					
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		
		}
		
	}
}
