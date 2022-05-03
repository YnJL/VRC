package org.vision.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;
import org.vision.rentcar.model.Rentcar;

import java.util.Collections;

// 페이징 처리 부분도 포함시키는 것이 바람직함 
public class FCGridService implements IBoardService{

	public static final int PostPerPage = 3;
	@SuppressWarnings("unused")
	private Model model;
	Map<String,Object> map;
	List<Rentcar> dtos;
	
	public FCGridService() {}
	
	@SuppressWarnings("unchecked")
	@Override
	public void execute(Model model) {
		this.model = model;
		map = model.asMap();
		dtos = (List<Rentcar>) map.get("fcgrid");	//필터된 자료
	}
	
	// 추가 메소드 들 
	public List<Rentcar> selectList(int a,int z) throws SQLException{
		return dtos.subList(a-1,z);						// 페이지에 나타낼 자료
	}
	
	// 페이징 처리를 위한 객체 얻기
	public CarList getCarView(int pageNum) throws SQLException{
		int cpageNum = pageNum;
		int TotalPost = dtos.size(); 
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
