package org.vision.rentcar.memberservice;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.vision.rentcar.common.Constant;
import org.vision.rentcar.common.IService;
import org.vision.rentcar.dao.RentMemberDAO;
import org.vision.rentcar.model.RentMember;

public class RMJoinBatchService implements IService{
	
	private RentMemberDAO dao;
	SqlSession sqlSession = Constant.sqlSession;

	@Override
	public void execute(Model model) {
		dao = sqlSession.getMapper(RentMemberDAO.class);
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		String data = request.getParameter("batchData");
		System.out.println(data);
		String rows[] = data.split("\n");
		RentMember dto = null;
		List<RentMember> list = new ArrayList<>();
		for(String x:rows) {
			String meminfo[] = x.split(",");
			dto = new RentMember(meminfo[0],meminfo[1],meminfo[2],meminfo[3],
					meminfo[4],meminfo[5],meminfo[6]);
			list.add(dto);
		}
		try { 
			dao.batch(list);
		}catch (SQLException e) {
			System.err.println("배치처리 실패");
			return;
		}
		
		
		
	}

}
