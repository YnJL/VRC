package org.vision.service;

import java.sql.SQLException;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.vision.rentcar.dao.RentReserveDAO;
import org.vision.rentcar.model.RentReserve;
import java.util.Collections;

// 페이징 처리 부분도 포함시키는 것이 바람직함 
public class RListService implements IBoardService{

	private SqlSession sqlSession = Constant.sqlSession;
	public static final int PostPerPage = 10;
	public RListService() {}
	@Override
	public void execute(Model model) {
		RentReserveDAO dao = sqlSession.getMapper(RentReserveDAO.class);
		List<RentReserve> dtos = dao.rselectAll();
		model.addAttribute("list",dtos);
	}
	
	// 추가 메소드 들 
	public List<RentReserve> selectList(int a,int z) throws SQLException{
		RentReserveDAO dao = sqlSession.getMapper(RentReserveDAO.class);
		List<RentReserve> dtos = dao.rselectAll();//모든 자료 
		return dtos.subList(a-1,z);// 페이지에 나타낼 자료
	}
	
	// 페이징 처리를 위한 객체 얻기
	public ResList getResView(int pageNum) throws SQLException{
		int cpageNum = pageNum;
		RentReserveDAO dao = sqlSession.getMapper(RentReserveDAO.class);
		int TotalPost = dao.rselectAll().size(); 
		List<RentReserve> resList = null;
		int pageFirstPost = 0;
		int pageLastPost = 0;
		if(TotalPost>0) { 
			pageFirstPost = (pageNum-1) * PostPerPage +1;
			pageLastPost = pageFirstPost + PostPerPage -1;
			if(pageLastPost>TotalPost) {
				pageLastPost = TotalPost;
			}
			resList = selectList(pageFirstPost,pageLastPost);
			
		}else {
			cpageNum = 0;
			resList = Collections.emptyList();
			
		}
		return new ResList(
				TotalPost,cpageNum,resList,PostPerPage,pageFirstPost,pageLastPost
		);
	}

}
