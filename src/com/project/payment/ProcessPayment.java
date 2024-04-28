package com.project.payment;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.database.RentalDao;
import com.project.database.Room;
import com.project.database.RoomDao;

@Controller
public class ProcessPayment {

	@RequestMapping("processPayment")
	public ModelAndView getPayment(Model model,HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:/SuccessPay");
		

        
        String checkin = request.getParameter("checkin");
        String checkout = request.getParameter("checkout");
        String tenantId = request.getParameter("tenantId");
        String roomId = request.getParameter("roomId");
        System.out.println("Checkin : "+ checkin);
        System.out.println("checkout : "+ checkout);
        System.out.println("tenantId : "+tenantId );
        System.out.println("roomId : "+ roomId);
        
        //Save into Database
        RentalDao rd = new RentalDao();
        rd.addRental(tenantId, roomId, checkin, checkout);
		
      
        
		
		return mv;
	}
	
	@RequestMapping("SuccessPay")
	public ModelAndView BackToHome() {
		ModelAndView mv = new ModelAndView("homePage");
		mv.addObject("Successmsg","Payment Successful");
		return mv;
	}
	


}


