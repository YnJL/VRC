package org.vision.rentcar.boardservice;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.vision.rentcar.common.Constant;
import org.vision.rentcar.common.IService;
import org.vision.rentcar.dao.RentBoardDAO;

public class RBDeleteService implements IService{
	//게시물 삭제를 위한 서비스

	
	SqlSession sqlSession = Constant.sqlSession;

	@Override
		public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int num = Integer.parseInt(request.getParameter("num"));
		RentBoardDAO dao = sqlSession.getMapper(RentBoardDAO.class);
		try {
			dao.delete(num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
