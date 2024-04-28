package com.project.servlets;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.database.*;




@Controller
//@RequestMapping("Manager")
public class ManagerLogin {
	@RequestMapping("auth")
	public ModelAndView authManager(HttpServletRequest request, HttpServletResponse response) {
        // Retrieve input parameters from the form
        String email = request.getParameter("email");
        String password = request.getParameter("password");
   
        ModelAndView mv = new ModelAndView("facility"); //Redirect to ADMIN's Home instead, but didnt find the file jn 
        
        
        //Here, need to retrieve tenant from db. 
        //Then, compare if the email matches any tenant. 
        	//If yes, compare if the password matches that tenant's 
        		//If yes, login and redirect 
        		//If no, return error and redirect to login page 
        	//Same here 
//        Manager curMgr = new Manager(); // Use this to iterate with each tenant from the db 
        ManagerDao md = new ManagerDao();
        List<Manager> ls = md.getAllManager();
        Manager manager = new Manager();
        
        //Default 
    	//Password or email mismatch. 
    	mv = new ModelAndView("ManagementLogin");
    	mv.addObject("Msg", "Email Or Password inserted is invalid");
        
        //Loop with each MANAGER 
        for(int i=0; i<ls.size(); i++) {
        if(email.equals(ls.get(i).getEmail() )) {
        	if(password.equals(ls.get(i).getPassword())) {
        		manager = ls.get(i);
        		mv = new ModelAndView("HomePageAdmin");
            	mv.addObject("Msg", null);
        		System.out.println("Manager Authenticated");
        		break;
        	}
            else {

        		System.out.println("Manager Cannot be Authenticated");
            }
        }
        else {
        	//Password or email mismatch. 
    		System.out.println("Manager Cannot be Authenticated");
        }
        
        }
        

        // Redirect back to Manager.jsp
        return mv;
    }
	
	
    @RequestMapping("managerLogout")
    public ModelAndView managerLogout(HttpSession session) {
    	 session.invalidate();
    	 ModelAndView mv = new ModelAndView("ManagementLogin");
    	 return mv;
    	
    }
    
    @RequestMapping("managerLogin")
    public ModelAndView managerLoginView(HttpSession session) {
    	 ModelAndView mv = new ModelAndView("ManagementLogin");
    	 return mv;
    	
    }
    
}
