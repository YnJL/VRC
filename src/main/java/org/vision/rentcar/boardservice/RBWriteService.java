package org.vision.rentcar.boardservice;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.vision.rentcar.common.Constant;
import org.vision.rentcar.common.IService;
import org.vision.rentcar.dao.RentBoardDAO;
import org.vision.rentcar.model.RentBoard;

public class RBWriteService implements IService {
	//게시플 글쓰기를 위한 서비스
	
	private RentBoardDAO dao;
	private SqlSession sqlSession = Constant.sqlSession;

	@Override
	public void execute(Model model) {
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String writer = request.getParameter("writer");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		dao = sqlSession.getMapper(RentBoardDAO.class);
		RentBoard dto = new RentBoard();
		dto.setWriter(writer);
		dto.setEmail(email);
		dto.setPassword(password);
		dto.setSubject(subject);
		dto.setContent(content);

		try {
			dao.insert(dto);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
