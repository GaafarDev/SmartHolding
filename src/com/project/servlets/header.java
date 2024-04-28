package com.project.servlets;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class header {
	
	@RequestMapping("adminHomePage")
	public ModelAndView ahp() {
		ModelAndView mv = new ModelAndView("HomePageAdmin");
		return mv;
	}
	
	@RequestMapping("tenantHomePage")
	public ModelAndView thp() {
		ModelAndView mv = new ModelAndView("homePage");
		return mv;
	}
	
	@RequestMapping("adminHeader")
	public ModelAndView ah() {
		ModelAndView mv = new ModelAndView("headerAdmin");
		return mv;
	}
	
	@RequestMapping("tenantHeader")
	public ModelAndView th() {
		ModelAndView mv = new ModelAndView("headerTenant");
		return mv;
	}
}
