package com.project.hotel;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.database.*;

@Controller
public class ViewRoomAvailability {
	//Not sure for tenant or management
    @RequestMapping("mgmViewRoom")
	public ModelAndView getAvalability() {
		ModelAndView mv = new ModelAndView("viewRoomAvailability");
		
		//Need to retreiev list of Rooms from db, arranged in ascending order of Room No
		//Also retrieve list of rentals (ALL)
		//Send both to viewRoomAvailabilty
		
		RoomDao rd = new RoomDao();
		RentalDao rnd = new RentalDao();
		
		List<Room> rooml = rd.getAllRoomAsc();
		List<Rental> rentall = rnd.getFutureRental();
		
		
		mv.addObject("roomlist",rooml);
		mv.addObject("rentallist",rentall);
		
		
		
		
		return mv;
	}
    
    @RequestMapping("viewRoomInfo")
    public ModelAndView viewRoomInfo(@RequestParam Map<String, String> request) {
    	ModelAndView mv = new ModelAndView("viewRoomTenant");
    	int roomId = Integer.parseInt(request.get("roomId"));
    	RentalDao rd = new RentalDao();
    	TenantDao td = new TenantDao();
    	
    	//First, retrieve rental for this room id.
    	List<Rental> rentallist = rd.getOngoingRoomRental(roomId);
    	
    	
    	//if list is empty, means no ongoing rental. But this needs to be checked at client page.
    	mv.addObject("rentallist", rentallist);
    	
    	//In case the rental isnt empty, need to display tenant info osos. So retrieve it here
    	RoomDao roomd = new RoomDao();
    	List<Room> roomlist = roomd.getRoomFromId(roomId);
    	Room room = roomlist.get(0);

		mv.addObject("room",room);
 
    	if(!rentallist.isEmpty()) {
    		List<Tenant> tenantlist = td.getTenantFromId(rentallist.get(0).getTenantId());
    		Tenant tenant = tenantlist.get(0);
    		mv.addObject("tenant",tenant);
    	}
    	
    	
    	
    	return mv;
    }

}
