package com.project.tenant;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.database.Rental;
import com.project.database.RentalDao;
import com.project.database.Room;
import com.project.database.RoomDao;
import com.project.database.Tenant;
import com.project.database.TenantDao;

@Controller
public class ViewProfile {
	
    @RequestMapping("tenantProfile")
	public ModelAndView getTenantInfo(HttpSession session) {
		ModelAndView mv = new ModelAndView("profile");
		
		Tenant tenant = (Tenant)session.getAttribute("tenant");
		int tenantId = tenant.getTenantId();
		
		//Retrieving tenant's room 
		 RentalDao td = new RentalDao();
	        List<Rental> ls = td.getTenantRental(tenantId);
	        
	        if(!ls.isEmpty()) {
	        	Rental rental = ls.get(0);
//	        	mv.addObject("rental", rental);
	        	
	        	RoomDao rd = new RoomDao();
	        	List<Room> rs = rd.getRoomFromId(rental.getRoomId());
	        	
	        	mv.addObject("room",rs.get(0));
	        	
	        }
	       
	    
	       
	     
	        
		return mv;
	}
    


}
