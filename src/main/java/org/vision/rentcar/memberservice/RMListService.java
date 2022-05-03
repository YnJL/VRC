package org.vision.rentcar.memberservice;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.vision.rentcar.common.Constant;
import org.vision.rentcar.common.IService;
import org.vision.rentcar.dao.RentMemberDAO;

public class RMListService implements IService{
	
	private RentMemberDAO dao;
	SqlSession sqlSession = Constant.sqlSession;

	@Override
	public void execute(Model model) {
		try {
			dao = sqlSession.getMapper(RentMemberDAO.class);
			model.addAttribute("list" , dao.selectAll());
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
