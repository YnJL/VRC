package org.vision.rentcar.dao;

import java.sql.SQLException;
import java.util.List;

import org.vision.rentcar.model.RentBoard;

public interface RentBoardDAO {
	public int insert(RentBoard dto) throws SQLException;
	public List<RentBoard> selectAll() throws SQLException;
	public RentBoard select(int num) throws SQLException;
	public int upHit(int num) throws SQLException;
	public int insert2(RentBoard dto) throws SQLException;
	public int update(RentBoard dto) throws SQLException;
	public int delete(int key) throws SQLException;
	public int getAllCount()throws SQLException;

}
