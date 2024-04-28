package com.project.booking;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.database.*;
import java.util.List;

import javax.servlet.http.HttpSession;

@Controller
public class BookRoom {
	
    @RequestMapping("DisplayBookingForm")
	public ModelAndView getForm(HttpSession session) {
		ModelAndView mv = new ModelAndView("BookRoom");
		RoomDao rd = new RoomDao();
		List<Room> rooml = rd.getAllRoom();
		
		RentalDao rld = new RentalDao();
		
		//Check if tenant currently has a booking that ends in the future. (mean it is not past)
		//If yes, redirect to the viewHotel again with a popup instead, since they cant book
		Tenant tenant = (Tenant)session.getAttribute("tenant");
		List<Rental> ongRent = rld.getFutureTenantRental(tenant.getTenantId());
		
		if(!ongRent.isEmpty()) {
			//If empty, means no ongoing rent. Can proceed
			mv = new ModelAndView("homePage");
			mv.addObject("msg","You already have an ongoing rental! Cannot rent more units!");
			return mv;
		}
		
		
		

		
		mv.addObject("t1",0);
		mv.addObject("t2",0);
		mv.addObject("t3",0);
		mv.addObject("t4",0);
		mv.addObject("roomNo1",0);
		mv.addObject("roomNo2",0);
		mv.addObject("roomNo3",0);
		mv.addObject("roomNo4",0);
		
		
		for(int i=0;i<rooml.size();i++) {
			List<Rental> rentall = rld.getOngoingRoomRental(rooml.get(i).getRoomId());
			System.out.println("Compare room "+rooml.get(i).getRoomType());
			if(rentall.isEmpty()) {
				//if rental empty, means this room aint booked
				if(rooml.get(i).getRoomType().equals("1")) {
					mv.addObject("t1",1);
					mv.addObject("roomNo1",rooml.get(i).getRoomId());
					
				}
				if(rooml.get(i).getRoomType().equals("2")) {
					mv.addObject("t2",1);
					mv.addObject("roomNo2",rooml.get(i).getRoomId());
					
				}
				if(rooml.get(i).getRoomType().equals("3")) {
					mv.addObject("t3",1);
					mv.addObject("roomNo3",rooml.get(i).getRoomId());
					
				}
				if(rooml.get(i).getRoomType().equals("4")) {
					mv.addObject("t4",1);
					mv.addObject("roomNo4",rooml.get(i).getRoomId());
					
				}
			}
		}
		
		return mv;
	}
    
    @RequestMapping("DisplayBooking")
    public ModelAndView myBooking(HttpSession session) {
    	ModelAndView mv = new ModelAndView("MyBooking");
    	
    	Tenant tenant = (Tenant)session.getAttribute("tenant");
    	RentalDao rd = new RentalDao();
    	RoomDao rod = new RoomDao();
    	List<Rental> rl = rd.getTenantRental(tenant.getTenantId());
    	List<Room> rol = rod.getAllRoomForRental(rl);
    	
    	mv.addObject("rentalList",rl);
    	mv.addObject("roomlist",rol);
    	return mv;
    }
    

    

	//retrieve list of rooms.
	//check if each room has their corresponding rental
	//if got rooms that doenst have rental:
		//get their room type, return it
		//means this is available room
	//Else, return a null for that room type

}
