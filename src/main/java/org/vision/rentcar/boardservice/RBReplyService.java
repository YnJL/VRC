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

public class RBReplyService implements IService {
	//댓글을 쓰기위한 서비스
	
	private SqlSession sqlSession = Constant.sqlSession;

	@Override
	public void execute(Model model) {
		Map <String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		//댓글 작성을 위한 본글 등록번호 불러오기
		int num = Integer.parseInt(request.getParameter("num"));
		String writer = request.getParameter("writer");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		//댓글 작성을 위한 필요 추가정보
		int ref =  Integer.parseInt(request.getParameter("ref"));
		int re_step = Integer.parseInt(request.getParameter("re_step"));
		int re_level = Integer.parseInt(request.getParameter("re_level"));
		
		RentBoardDAO dao = sqlSession.getMapper(RentBoardDAO.class);
		RentBoard dto = new RentBoard();
		dto.setWriter(writer);
		dto.setPassword(password);
		dto.setEmail(email);
		dto.setSubject(subject);
		dto.setContent(content);
		dto.setRef(ref);
		//아래 2개 값은 질의에서 1씩 추가시킴
		dto.setRe_step(re_step);
		dto.setRe_level(re_level);
		
		try {
			dao.insert2(dto);
		} catch (SQLException e) {
			e.printStackTrace();
		}
				
	}

}
