package org.vision.rentcar;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.vision.rentcar.dao.RentReserveDAO;
import org.vision.rentcar.dao.RentcarDAO;
import org.vision.rentcar.model.RentReserve;
import org.vision.rentcar.model.Rentcar;
import org.vision.service.Constant;
import org.vision.service.IBoardService;

/**
 * Servlet implementation class LedgerController
 */
@Controller
public class ReserveController{
//	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	IBoardService service;
	SqlSession sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		Constant.sqlSession = this.sqlSession;
	}
      
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReserveController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	@RequestMapping("/rlist")
	public String rlist(Model model, HttpServletRequest request,HttpServletResponse response) {
		RentReserveDAO dao = sqlSession.getMapper(RentReserveDAO.class);
		model.addAttribute("rlist",dao.rselectAll());
		return "rlist";
	}
	
	@RequestMapping("/resform")
	public String rnew(Model model, HttpServletRequest request) {
		if(request.getParameter("carno") == null) {
			return "resform";
		}
		int carno = Integer.parseInt(request.getParameter("carno"));
		RentcarDAO cars = sqlSession.getMapper(RentcarDAO.class);
		Rentcar car = cars.select(carno);
		String carname = car.getName();
		int price = car.getPrice();
		model.addAttribute("carname", carname);
		model.addAttribute("carno", carno+"");
		model.addAttribute("price", price);
		return "resform";
	}
	@RequestMapping("/reserve")
	public String rinsert(Model model, HttpServletRequest request) {
		RentReserveDAO dao = sqlSession.getMapper(RentReserveDAO.class);
		RentReserve dto = new RentReserve();
		
		dto.setNo(Integer.parseInt(request.getParameter("no")));
		dto.setQty(Integer.parseInt(request.getParameter("qty")));
		dto.setDday(Integer.parseInt(request.getParameter("dday")));
		dto.setRday(request.getParameter("rday"));
		dto.setInsurance(Integer.parseInt(request.getParameter("insurance")));
		dto.setWifi(Integer.parseInt(request.getParameter("wifi")));
		dto.setNavigation(Integer.parseInt(request.getParameter("navigation")));
		dto.setBabyseat(Integer.parseInt(request.getParameter("babyseat")));
		dto.setId(request.getParameter("id"));
		
		dao.rinsert(dto);
		
		dto.setRegno(dto.getIdx());
		model.addAttribute("voucher", dto);
		
		int no = dto.getRegno();
		model.addAttribute("regno", no);
		return "redirect:voucher";
	}
	
	@RequestMapping("/rdelete")
	public String rdelete(HttpServletRequest request) {
		RentReserveDAO dao = sqlSession.getMapper(RentReserveDAO.class);
		dao.rdelete(Integer.parseInt(request.getParameter("regno")));
		return "redirect:rlist";
	}
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request) {
		RentReserveDAO dao = sqlSession.getMapper(RentReserveDAO.class);
		dao.rdelete(Integer.parseInt(request.getParameter("regno")));
		return "redirect:myreserve";
	}
	

	@RequestMapping("/myreserve")
	public String myreserve(Model model, HttpServletRequest request,HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		if(id==null) return "/myreserve";
		if(id.equals("admin")) return "redirect:rlist";
		RentReserveDAO dao = sqlSession.getMapper(RentReserveDAO.class);
		model.addAttribute("rlist",dao.rselByid(id));
		return "myreserve";
	}	
	
	@RequestMapping("/voucher")
	public String voucher(Model model, HttpServletRequest request) {
		int regno = Integer.parseInt(request.getParameter("regno"));
		RentReserveDAO dao = sqlSession.getMapper(RentReserveDAO.class);
		RentReserve dto = dao.rselect(regno);
		model.addAttribute("voucher", dto);
		
		int no = dto.getNo();
		RentcarDAO cars = sqlSession.getMapper(RentcarDAO.class);
		Rentcar car = cars.select(no);
		model.addAttribute("carinfo", car);
		return "voucher";
	}

	
	@RequestMapping("/rmod")
	public String rmod(Model model, HttpServletRequest request) {
		RentcarDAO car = sqlSession.getMapper(RentcarDAO.class);
		model.addAttribute("car",car.selectAll());
		RentReserveDAO dao = sqlSession.getMapper(RentReserveDAO.class);
		String regno = request.getParameter("regno");
		model.addAttribute("voucher",dao.rselect(Integer.parseInt(regno)));
		return "rmod";
	}

	
	
	@RequestMapping("/rmodify")
	public String rmodi(Model model, HttpServletRequest request) {
		RentReserveDAO dao = sqlSession.getMapper(RentReserveDAO.class);
		int regno = Integer.parseInt(request.getParameter("regno"));
		RentReserve dto = dao.rselect(regno);

		dto.setNo(Integer.parseInt(request.getParameter("no")));
		dto.setQty(Integer.parseInt(request.getParameter("qty")));
		dto.setDday(Integer.parseInt(request.getParameter("dday")));
		dto.setRday(request.getParameter("rday"));
		dto.setInsurance(Integer.parseInt(request.getParameter("insurance")));
		dto.setWifi(Integer.parseInt(request.getParameter("wifi")));
		dto.setNavigation(Integer.parseInt(request.getParameter("navigation")));
		dto.setBabyseat(Integer.parseInt(request.getParameter("babyseat")));
		dto.setId(request.getParameter("id"));
		
		dao.rupdate(dto);
		
		model.addAttribute("voucher",dao.rselect(regno));
		
		int no = dto.getNo();
		RentcarDAO cars = sqlSession.getMapper(RentcarDAO.class);
		Rentcar car = cars.select(no);
		String carname = car.getName();
		model.addAttribute("carname", carname);
		model.addAttribute("regno", regno);
		
		return "redirect:myreserve";
	}
	


}
