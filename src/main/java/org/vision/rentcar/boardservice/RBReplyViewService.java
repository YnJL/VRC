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

public class RBReplyViewService implements IService {
	// 리플게시글을 보기위한 서비스
	
	private SqlSession sqlSession = Constant.sqlSession;

	@Override
	public void execute(Model model) {
		
		try {
			Map<String,Object> map = model.asMap();
			HttpServletRequest request = (HttpServletRequest)map.get("request");
			int num = Integer.parseInt(request.getParameter("num"));
			RentBoardDAO dao = sqlSession.getMapper(RentBoardDAO.class);
			dao.upHit(num);
			RentBoard dto = dao.select(num);
			model.addAttribute("replyView",dto);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
