package org.vision.rentcar.dao;

import java.util.List;

import org.vision.rentcar.model.RentReserve;

public interface RentReserveDAO {
	public int rinsert(RentReserve dto);
	public int rdelete(int regno);
	public int rupdate(RentReserve dto);
	public RentReserve rselect(int regno);
	public List<RentReserve> rselectAll();
	public List<RentReserve> rselByid(String id);
	public List<RentReserve> rselByMon(String yr, String mn);
	
}
