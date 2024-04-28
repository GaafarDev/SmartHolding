package com.project.tenant;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.database.*;

@Controller
public class EditTenantInfo {
	//Can be for managemnet, but cannot change email or pw. Just phone no etc
    @RequestMapping("mgmViewEditTenantPage")
    public ModelAndView EditThisTenant(@RequestParam Map<String,String> req) {
    	int TenantId = Integer.parseInt(req.get("tenantId"));
    	int RoomId = Integer.parseInt(req.get("roomId"));
    	int RentalId = Integer.parseInt(req.get("rentalId"));
    	
    	ModelAndView mv = new ModelAndView("editRoomTenant");
    	
    	TenantDao td = new TenantDao();
    	List<Tenant> tl = td.getTenantFromId(TenantId);
    	
    	Tenant tenant = tl.get(0);
    	
    	mv.addObject("tenant", tenant);
    	mv.addObject("roomId",RoomId);
    	mv.addObject("rentalId",RentalId);
    	
    	return mv;
    }
    
    @RequestMapping("mgmSubmitTenantEdit")
    public ModelAndView UpdateThisTenant(@RequestParam Map<String, String> req) {
    	ModelAndView mv = new ModelAndView("viewRoomTenant");
    	
    	int id = Integer.parseInt(req.get("tenantId"));
    	int roomId = Integer.parseInt(req.get("roomId"));
    	int rentalId = Integer.parseInt(req.get("rentalId"));
    	
    	String fname = req.get("firstName");
    	String lname = req.get("lastName");
    	String phone = req.get("phone");
    	String email = req.get("email");
    	System.out.println(fname);
    	System.out.println(lname);
    	System.out.println(phone);
    	System.out.println(email);
    	
    	Tenant tenant = new Tenant();
    	tenant.setTenantId(id);
    	tenant.setEmail(email);
    	tenant.setFirstName(fname);
    	tenant.setLastName(lname);
    	tenant.setPhone(phone);
    	
    	
    	TenantDao td = new TenantDao();    	
    	td.updateTenantInfo(tenant);
    	
    	List<Tenant> tl = td.getTenantFromId(id);
    	tenant = tl.get(0);
    	
    	RentalDao rd = new RentalDao();
    	RoomDao rod = new RoomDao();
    	List<Rental> rl = rd.getOngoingRentalFromRentalId(rentalId);
    	List<Room> rol = rod.getRoomFromId(roomId);
    	
    	mv.addObject("tenant",tenant);
    	mv.addObject("rentallist",rl);
    	mv.addObject("room",rol.get(0));
    	
    	return mv;
    	
    
    }
    
    
    @RequestMapping("mgmDeleteTenantRental")
    public ModelAndView DeleteThisRental(@RequestParam Map<String,String> req) {
    	int TenantId = Integer.parseInt(req.get("tenantId"));
    	int RoomId = Integer.parseInt(req.get("roomId"));
    	int RentalId = Integer.parseInt(req.get("rentalId"));
    	
    	ModelAndView mv = new ModelAndView("redirect:/mgmViewTenant");
    	
    	RentalDao rd = new RentalDao();
    	rd.deleteThisRental(RentalId);
    	
    	
    	return mv;
    }

}
