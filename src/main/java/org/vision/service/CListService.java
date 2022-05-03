package org.vision.service;

import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.vision.rentcar.dao.RentcarDAO;
import org.vision.rentcar.model.Rentcar;

// 페이징 처리 부분도 포함시키는 것이 바람직함 
public class CListService implements IBoardService{

	private SqlSession sqlSession = Constant.sqlSession;
	public static final int PostPerPage = 10;
	public CListService() {}
	@Override
	public void execute(Model model) {
		RentcarDAO dao = sqlSession.getMapper(RentcarDAO.class);
		List<Rentcar> dtos = dao.selectAll();
		model.addAttribute("list",dtos);
	}
	
	// 추가 메소드 들 
	public List<Rentcar> selectList(int a,int z) throws SQLException{
		RentcarDAO dao = sqlSession.getMapper(RentcarDAO.class);
		List<Rentcar> dtos = dao.selectAll();//모든 자료 
		return dtos.subList(a-1,z);// 페이지에 나타낼 자료
	}
	
	// 페이징 처리를 위한 객체 얻기
	public CarList getCarView(int pageNum) throws SQLException{
		int cpageNum = pageNum;
		RentcarDAO dao = sqlSession.getMapper(RentcarDAO.class);
		int TotalPost = dao.selectAll().size(); 
		List<Rentcar> carList = null;
		int pageFirstPost = 0;
		int pageLastPost = 0;
		if(TotalPost>0) { 
			pageFirstPost = (pageNum-1) * PostPerPage +1;
			pageLastPost = pageFirstPost + PostPerPage -1; //100 
			if(pageLastPost>TotalPost) {
				pageLastPost = TotalPost;
			}
			carList = selectList(pageFirstPost,pageLastPost);
			
		}else {
			cpageNum = 0;
			carList = Collections.emptyList();
			
		}
		return new CarList(
				TotalPost,cpageNum,carList,PostPerPage,pageFirstPost,pageLastPost
		);
	}

}
