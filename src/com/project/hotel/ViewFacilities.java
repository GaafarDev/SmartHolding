package com.project.hotel;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ViewFacilities {
	//For tenant
    @RequestMapping("DisplayFacilities")
	public ModelAndView getFacilities() {
		ModelAndView mv = new ModelAndView("facility");
		return mv;
	}
}
