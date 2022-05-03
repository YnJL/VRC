package org.vision.rentcar.boardservice;

import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.vision.rentcar.common.Constant;
import org.vision.rentcar.common.IService;
import org.vision.rentcar.dao.RentBoardDAO;
import org.vision.rentcar.model.RentBoard;

public class RBListService implements IService {
	//게시물 리스트를 보기위한 서비스
	
	private RentBoardDAO dao;
	SqlSession sqlSession = Constant.sqlSession;	
	public static final int MESSAGE_COUNT_PER_PAGE = 10;
	public RBListService() {}

	@Override
	public void execute(Model model) {
		dao = sqlSession.getMapper(RentBoardDAO.class);
		
		try {
			model.addAttribute("list",dao.selectAll());
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
//추가 메소드들
public List<RentBoard> selectList(int a,int z)throws SQLException{
	RentBoardDAO dao = sqlSession.getMapper(RentBoardDAO.class);
	List<RentBoard> dto = dao.selectAll(); // 모든자료
	return dto.subList(a-1,z); //페이지에 나타낼자료
}
//페이징 처리를 위한 객체 얻기
public MessageListView  getMessageListView(int pageNumber)throws SQLException{
	int currentPageNumber = pageNumber;
	RentBoardDAO dao = sqlSession.getMapper(RentBoardDAO.class);
	int messageTotalCount = dao.selectAll().size();
	List<RentBoard> messageList = null;
	int firstRow = 0;
	int endRow = 0;
	if(messageTotalCount>0) {
		//10페이지 = (10-1)*MESSAGE_COUNT_PER_PAGE+1 >> 10페이지 첫행은 91번자료.
		firstRow = (pageNumber-1)*MESSAGE_COUNT_PER_PAGE +1; 
		endRow = firstRow + MESSAGE_COUNT_PER_PAGE -1;//100
		//마지막페이지의 끝번호는 마지막자료보다 튼 인덱스이면 안됨.
		if(endRow>messageTotalCount) {
			endRow = messageTotalCount;
		}
		messageList=selectList(firstRow,endRow);
	}else {
		currentPageNumber=0;
		messageList=Collections.emptyList();
	}
	return new MessageListView(messageTotalCount,currentPageNumber,messageList,MESSAGE_COUNT_PER_PAGE,firstRow,endRow);
}
}

