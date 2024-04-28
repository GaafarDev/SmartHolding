package com.project.tenant;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.database.*;

@Controller
public class CheckTenantInfo {
	//Management
    @RequestMapping("mgmViewTenant")
	public ModelAndView getTenantInfo() {
		ModelAndView mv = new ModelAndView("checkTenantInfo");
		
		//Retrieve list of all tenants 
		//Then for each tennat, display the list of rentals in their name in this same page. 
		
		RentalDao rd = new RentalDao();
		TenantDao td = new TenantDao();
		RoomDao rod = new RoomDao();
		
		List<Tenant> tl = td.getAllTenant();
		List<Rental> rl = rd.getAllRental();
		List<Room> rol = rod.getAllRoom();
		
		mv.addObject("rentallist",rl);
		mv.addObject("tenantlist",tl);
		mv.addObject("roomlist",rol);
		
		return mv;
	}

}
