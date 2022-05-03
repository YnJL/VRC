package org.vision.rentcar;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.vision.rentcar.dao.RentcarDAO;
import org.vision.rentcar.model.Rentcar;
import org.vision.service.CarList;
import org.vision.service.Constant;
import org.vision.service.FCGridService;
import org.vision.service.IBoardService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class CarController {
	
	IBoardService service;
	SqlSession sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		Constant.sqlSession = this.sqlSession;
	}

	/**
	 * Simply selects the home view to render by returning its name.
	 */

	@RequestMapping("/carList")
	public String clist(Model model) {
		RentcarDAO dao = sqlSession.getMapper(RentcarDAO.class);
		model.addAttribute("clist",dao.selectAll());
		List<String> company;
		company=dao.getCompany();
		model.addAttribute("comp",company);
		return "carList";
	}
	@RequestMapping("/carGrid")
	public String cglist(Model model) {
		RentcarDAO dao = sqlSession.getMapper(RentcarDAO.class);
		model.addAttribute("clist",dao.selectAll());
		List<String> company;
		company=dao.getCompany();
		model.addAttribute("comp",company);
		return "carGrid";
	}
	
	@RequestMapping("/carinfo")
	public String voucher(Model model, HttpServletRequest request) {
		int no = Integer.parseInt(request.getParameter("no"));
		RentcarDAO dao = sqlSession.getMapper(RentcarDAO.class);
		Rentcar dto = dao.select(no);
		model.addAttribute("carinfo", dto);
		return "carinfo";
	}
	
	@RequestMapping("/carlistfilter")
	public String carlistfilter(Model model, HttpServletRequest request) {
		RentcarDAO dao = sqlSession.getMapper(RentcarDAO.class);
		List<String> company;
		company=dao.getCompany();
		List<String> category;
		category=dao.getCategory();
		List<String> size = new ArrayList<String>();
		List<String> comp = new ArrayList<String>();
		try {
			for(String w: request.getParameterValues("size")) {
				size.add(w);
			}
		} catch (Exception e) {
			for(String x: category) {
				size.add(x);
			}
		}
		
		try {
			for(String y: request.getParameterValues("comp")) {
				comp.add(y);
			}
		} catch (Exception e) {	
			for(String z: company) {
				comp.add(z);
			}
		}
		model.addAttribute("comp",company);
		model.addAttribute("scom", comp);
		model.addAttribute("scat", size);
		model.addAttribute("fclist", dao.searchby(size, comp));
		return "fclist";
	}
	
	@RequestMapping("/cargridfilter")
	public String cargridfilter(Model model, HttpServletRequest request) throws Throwable {
		String pageNo = request.getParameter("pageN");
		if(pageNo == null) pageNo = "1";
		
		RentcarDAO dao = sqlSession.getMapper(RentcarDAO.class);
		List<String> company;
		company=dao.getCompany();
		List<String> category;
		category=dao.getCategory();
		List<String> size = new ArrayList<String>();
		List<String> comp = new ArrayList<String>();
		try {
			for(String w: request.getParameterValues("size")) {
				size.add(w);
			}
		} catch (Exception e) {
			for(String x: category) {
				size.add(x);
			}
		}
		
		try {
			for(String y: request.getParameterValues("comp")) {
				comp.add(y);
			}
		} catch (Exception e) {	
			for(String z: company) {
				comp.add(z);
			}
		}

		HttpSession session=request.getSession();
		session.setAttribute("acomp", company);
		session.setAttribute("fcomp", comp);
		session.setAttribute("fsize", size);
		session.setAttribute("flist", dao.searchby(size, comp));

		model.addAttribute("comp",company);
		model.addAttribute("scom", comp);
		model.addAttribute("scat", size);
		model.addAttribute("fcgrid", dao.searchby(size, comp));
		
		FCGridService service = new FCGridService();
		service.execute(model);
		int pageNum=0;
		pageNum = Integer.parseInt(pageNo);
		CarList carlist = service.getCarView(pageNum);
		int totalPage = carlist.getTotalPageN();
		List<Rentcar> subList = carlist.getCarList();
		
		model.addAttribute("subList", subList);
		model.addAttribute("pages", totalPage);
		
		return "fcgrid";
	}
	@RequestMapping("/fcgrid")
	public String fcgrid(Model model, HttpServletRequest request) throws Throwable {
		String pageNo = request.getParameter("pageN");
		if(pageNo == null) pageNo = "1";
		
		HttpSession session=request.getSession();
		
		model.addAttribute("comp", session.getAttribute("acomp"));
		model.addAttribute("scom", session.getAttribute("fcomp"));
		model.addAttribute("scat", session.getAttribute("fsize"));
		model.addAttribute("fcgrid", session.getAttribute("flist"));
		
		FCGridService service = new FCGridService();
		service.execute(model);
		int pageNum=0;
		pageNum = Integer.parseInt(pageNo);
		CarList carlist = service.getCarView(pageNum);
		int totalPage = carlist.getTotalPageN();
		List<Rentcar> subList = carlist.getCarList();
		
		model.addAttribute("subList", subList);
		model.addAttribute("pages", totalPage);
		
		return "fcgrid";
	}
	
	@RequestMapping("/cadd")
	public String cadd() {
		return "cadd";
	}
	
	@RequestMapping("/caradd")
	public String caradd(Model model, MultipartHttpServletRequest request) {
		HttpSession session = request.getSession();
		MultipartFile imgFile = null;
		int no = Integer.parseInt(request.getParameter("no"));
		model.addAttribute("no", no);
		try {
			imgFile = request.getFile("img");
			String imgName = imgFile.getOriginalFilename();
			String rootPath = request.getSession().getServletContext().getRealPath("/");
			String carImgPath = "resources/cars/";
			String imgPath=rootPath+carImgPath+imgName;
			File copyFile = new File(imgPath);
			imgFile.transferTo(copyFile);
			RentcarDAO dao = sqlSession.getMapper(RentcarDAO.class);
			Rentcar dto = new Rentcar(
				no,
				request.getParameter("name"),
				Integer.parseInt((String)request.getParameter("category")),
				Integer.parseInt((String)request.getParameter("price")),
				Integer.parseInt((String)request.getParameter("usepeople")),
				request.getParameter("company"),
				imgName,
				request.getParameter("info")
			);
		dao.insert(dto);

		session.setAttribute("check", "success");
		return "carcheck";
		} catch(Exception e) {
			e.printStackTrace();
			session.setAttribute("check", "failure");
			return "carcheck";
		}
	}
	
	
	@RequestMapping("/cmod")
	public String cmod(Model model, HttpServletRequest request) {
		int no = Integer.parseInt(request.getParameter("no"));
		RentcarDAO dao = sqlSession.getMapper(RentcarDAO.class);
		Rentcar dto = dao.select(no);
		model.addAttribute("carinfo", dto);
		return "cmod";
	}
	@RequestMapping("/carmod")
	public String carmod(Model model, MultipartHttpServletRequest request) {
		int no = Integer.parseInt(request.getParameter("no"));
		HttpSession session = request.getSession();
		String referer = request.getHeader("Referer");
		MultipartFile imgFile = null;
		
		RentcarDAO dao = sqlSession.getMapper(RentcarDAO.class);
		try {
		Rentcar dto = dao.select(no);
		dto.setName(request.getParameter("name"));
		dto.setCategory(Integer.parseInt(request.getParameter("category")));
		dto.setPrice(Integer.parseInt(request.getParameter("price")));
		dto.setUsepeople(Integer.parseInt(request.getParameter("usepeople")));
		dto.setCompany(request.getParameter("company"));
		
			imgFile = request.getFile("img");
			if(!imgFile.isEmpty()) {
				
			String imgName = imgFile.getOriginalFilename();
			String rootPath = request.getSession().getServletContext().getRealPath("/");
			String carImgPath = "resources/cars/";
			String imgPath=rootPath+carImgPath+imgName;
			File copyFile = new File(imgPath);
			imgFile.transferTo(copyFile);
		dto.setImg(imgName);
			} 
		dto.setInfo(request.getParameter("info"));
		dao.update(dto);
		session.setAttribute("check", "success");
		} catch(Exception e) {
			e.printStackTrace();
			session.setAttribute("check", "failure");
			return "carcheck";
		}
		model.addAttribute("no", no);
		session.setAttribute("ref", referer);
		return "carcheck";
	}
	
    @RequestMapping("/cdel")
	public String cdelete(HttpServletRequest request) {
    	RentcarDAO dao = sqlSession.getMapper(RentcarDAO.class);
		dao.delete(Integer.parseInt(request.getParameter("no")));
		return "redirect:carList";
	}
}
