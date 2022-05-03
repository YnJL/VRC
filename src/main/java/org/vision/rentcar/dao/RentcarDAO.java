package org.vision.rentcar.dao;

import java.util.List;

import org.vision.rentcar.model.Rentcar;

public interface RentcarDAO {
	public int insert(Rentcar dto);
	public int delete(int no);
	public int update(Rentcar dto);
	public Rentcar select(int no);
	public List<Rentcar> selectAll();
	public List<String> getCompany();
	public List<String> getCategory();
	public List<Rentcar> searchby(List<String> size, List<String> comp);
}

