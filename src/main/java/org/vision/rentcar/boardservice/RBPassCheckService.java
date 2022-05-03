package org.vision.rentcar.boardservice;

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
import org.vision.rentcar.dao.RentBoardDAO;
import org.vision.rentcar.model.RentBoard;

public class RBPassCheckService implements IService{
	private RentBoardDAO dao;
	SqlSession sqlSession = Constant.sqlSession;
	
	@Override
	public void execute(Model model) {
		dao = sqlSession.getMapper(RentBoardDAO.class);
		Map<String,Object>map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpServletResponse response = (HttpServletResponse)map.get("response");
		int num = Integer.parseInt(request.getParameter("num"));
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		session.setAttribute("num", num);
		dao = sqlSession.getMapper(RentBoardDAO.class);
		RentBoard dto = null;
		
		try {
			dto = dao.select(num);
				if((dto.getPassword()).equals(password)) {
			}
		} catch (SQLException e) {
			e.printStackTrace();
		
		}
		
	}
}
