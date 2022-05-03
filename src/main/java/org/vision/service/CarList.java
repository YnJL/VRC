package org.vision.service;

import java.util.List;

import org.vision.rentcar.model.Rentcar;


// 게시목록의 페이징 처리를 위해 사용할 클래스 
public class CarList {
	
	private int TotalPost; // 총자료수 
	private int cpageNum; // 현재페이지 
	private List<Rentcar> carList;// 모든자료
	private int PostPerPage; // 한 페이지에 나타낼 자료수 
	private int pageFirstPost; // 어떤 페이지에 나타낼 첫행
	private int pageLastPost; // 어떤 페이지에 나타낼 마지막 행 
	
	private int TotalPageN;// 총페이지수  모든자료를 페이지에 나타낼 자료수로 나눈값

	public CarList(int TotalPost, int cpageNum, List<Rentcar> carList, 
			int PostPerPage, int pageFirstPost, int pageLastPost) {
		super();
		this.TotalPost = TotalPost;
		this.cpageNum = cpageNum;
		this.carList = carList;
		this.PostPerPage = PostPerPage;
		this.pageFirstPost = pageFirstPost;
		this.pageLastPost = pageLastPost;
		calTotalPageN();
	}
	
	private void calTotalPageN() {
		if(TotalPost == 0) {
			TotalPageN = 0;
		}else {
			TotalPageN = TotalPost / PostPerPage;
			if(TotalPost % PostPerPage > 0 ) {
				TotalPageN++;
			}
		}
	}

	
	public int getTotalPost() {
		return TotalPost;
	}

	public int getcPageNum() {
		return cpageNum;
	}

	public List<Rentcar> getCarList() {
		return carList;
	}

	public int getPostPerPage() {
		return PostPerPage;
	}

	public int getPageFirstPost() {
		return pageFirstPost;
	}

	public int getPageLastPost() {
		return pageLastPost;
	}

	public int getTotalPageN() {
		return TotalPageN;
	}

	public boolean isEmpty() {
		return TotalPost==0;
	}

}
