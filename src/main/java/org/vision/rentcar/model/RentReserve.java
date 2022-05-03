package org.vision.rentcar.model;

public class RentReserve {
	private int regno;//예약번호
	private int no;//렌트차량등록번호
	private int qty;//대여수량
	private int dday;//대여일자수(기간)
	private String rday;//대여할 날짜
	private int insurance;//보험적용 여부 1.적용 2.비적용
	private int wifi;//와이파이 적용여부 1.적용2.비적용
	private int navigation; //네비게이션적용여부 1.적용2.비적용
	private int babyseat; // 어린아이시트대여여부1.적용2.비적용
	private String id; //예약자(고객)아이디
	private int idx;
	

	public RentReserve() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RentReserve(int regno, int no, int qty, int dday, String rday, int insurance, int wifi, int navigation,
			int babyseat, String id) {
		super();
		this.regno = regno;
		this.no = no;
		this.qty = qty;
		this.dday = dday;
		this.rday = rday;
		this.insurance = insurance;
		this.wifi = wifi;
		this.navigation = navigation;
		this.babyseat = babyseat;
		this.id = id;
	}

	public int getRegno() {
		return regno;
	}

	public void setRegno(int regno) {
		this.regno = regno;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public int getDday() {
		return dday;
	}

	public void setDday(int dday) {
		this.dday = dday;
	}

	public String getRday() {
		return rday;
	}

	public void setRday(String rday) {
		this.rday = rday;
	}

	public int getInsurance() {
		return insurance;
	}

	public void setInsurance(int insurance) {
		this.insurance = insurance;
	}

	public int getWifi() {
		return wifi;
	}

	public void setWifi(int wifi) {
		this.wifi = wifi;
	}

	public int getNavigation() {
		return navigation;
	}

	public void setNavigation(int navigation) {
		this.navigation = navigation;
	}

	public int getBabyseat() {
		return babyseat;
	}

	public void setBabyseat(int babyseat) {
		this.babyseat = babyseat;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	public int getIdx() {
		return idx;
	}
	
	public void setIdx(int idx) {
		this.idx = idx;
	}

	@Override
	public String toString() {
		return "RentReserve [regno=" + regno + ", no=" + no + ", qty=" + qty + ", dday=" + dday + ", rday=" + rday
				+ ", insurance=" + insurance + ", wifi=" + wifi + ", navigation=" + navigation + ", babyseat="
				+ babyseat + ", id=" + id + "]";
	}

	
	
	
	
}