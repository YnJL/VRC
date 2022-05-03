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

public class RBModifyService implements IService {
	//게시물 상세보기 후 수정을 위한 서비스
	
	public SqlSession sqlSession = Constant.sqlSession;

	@Override
	public void execute(Model model) {
	Map<String,Object> map = model.asMap();
	HttpServletRequest request = (HttpServletRequest)map.get("request");
	RentBoardDAO dao = sqlSession.getMapper(RentBoardDAO.class);
	int num = Integer.parseInt(request.getParameter("num"));
	String password = request.getParameter("password");
	RentBoard dto = null;

	try {
		dto = dao.select(num);

		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		// 수정폼에서 읽어온 값으로 대체함.

		 dto.setSubject(subject);
		 dto.setContent(content);
		 
		 dao.update(dto);
		 
		 
	} catch (SQLException e) {
		e.printStackTrace();
	}
	}
}
