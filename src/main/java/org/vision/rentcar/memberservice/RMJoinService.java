package org.vision.rentcar.memberservice;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.vision.rentcar.common.Constant;
import org.vision.rentcar.common.IService;
import org.vision.rentcar.dao.RentMemberDAO;
import org.vision.rentcar.model.RentMember;

public class RMJoinService implements IService{
	
	private RentMemberDAO dao;
	SqlSession sqlSession = Constant.sqlSession; 
	
	

	@Override
	public void execute(Model model) {
		dao = sqlSession.getMapper(RentMemberDAO.class);
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		RentMember dto = new RentMember();
		RentMember aman = null;
		try {
			aman = dao.select("id");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(aman!=null) {
					System.out.println("이미 사용중인 ID입니다.");
					return ;
				} else {
					dto.setId(request.getParameter("id"));
					dto.setPass(request.getParameter("pass"));
					dto.setEmail(request.getParameter("email"));
					dto.setTel(request.getParameter("tel"));
					dto.setAge(request.getParameter("age"));
					dto.setHobby(request.getParameter("hobby"));
					dto.setJob(request.getParameter("job"));
					
					try {
						dao.insert(dto);
					} catch (SQLException e1) {
						e1.printStackTrace();
				}

				}

				}
			}
		


		

