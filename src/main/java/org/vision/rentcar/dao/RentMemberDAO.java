package org.vision.rentcar.dao;

import java.sql.SQLException;
import java.util.List;

import org.vision.rentcar.model.RentMember;

public interface RentMemberDAO {
	
	public int insert(RentMember dto) throws SQLException;
	public int delete(String key)  throws SQLException;
	public int update(RentMember dto)  throws SQLException;
	public RentMember select(String key)  throws SQLException;
	public List<RentMember> selectAll()  throws SQLException;
	public String getPassword(final String id)  throws SQLException;
	public int getAllCount()  throws SQLException;
	public int batch(List<RentMember> list)  throws SQLException;
	
	

}
