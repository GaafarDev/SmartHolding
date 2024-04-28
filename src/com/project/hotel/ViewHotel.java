package com.project.hotel;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class ViewHotel {
	//For tenant
    @RequestMapping("DisplayHotels")
	public ModelAndView getHotels() {
		ModelAndView mv = new ModelAndView("viewHotel");
		return mv;
	}

}
