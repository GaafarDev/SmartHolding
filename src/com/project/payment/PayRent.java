package com.project.payment;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.database.Room;
import com.project.database.RoomDao;

@Controller
public class PayRent {

	@RequestMapping("DisplayPayment")
	public ModelAndView getPayment(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("payment");
		
//		String roomType = request.getParameter("selectedTower");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		int roomId = Integer.parseInt(request.getParameter("roomNo")); 
		String tenantId = request.getParameter("tenantid");
		String checkin = request.getParameter("checkin");
		String checkout = request.getParameter("checkout");
		
		RoomDao rd = new RoomDao();
		List<Room> rl = rd.getRoomFromId(roomId);
		Room room = rl.get(0);
		
		mv.addObject("room", room);
//		mv.addObject("name",fname +" "+lname);
//		mv.addObject("phone", phone);
//		mv.addObject("email",email);
		mv.addObject("checkin",checkin);
		mv.addObject("checkout",checkout);
		mv.addObject("tenantId",tenantId);
		System.out.println("Checkin date "+checkin);
		System.out.println("Checkout date "+checkout);
		
		
		
		

		return mv;
	}
	
	
	


}


