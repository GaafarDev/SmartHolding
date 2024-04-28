package com.project.servlets;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.database.Tenant;
import com.project.database.TenantDao;

@Controller
public class TenantAccess {

    @RequestMapping("TenantSignup")
    public ModelAndView registerTenant(Model model,HttpServletRequest request, HttpServletResponse response, @ModelAttribute("tenant") Tenant tenant, HttpSession session) {
        // Retrieve input parameters from the form
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        

        model.addAttribute("firstName", firstName);
        model.addAttribute("lastName", lastName);
        model.addAttribute("email", email);
        model.addAttribute("password", password);
        model.addAttribute("phone", phone);

        //Decalre the page to go IF signup is valid 
        ModelAndView mv = new ModelAndView("redirect:/gotoHomePage");
        
        //Need to retrieve the list of current tenants from the db.
        //Then, need to compare whether this Email is in use or not, since it needs to be unique. 
        //If yes, return error.
//        Tenant curTenant = new Tenant(); //Retrieve the tenants from the database using this 
        
        TenantDao td = new TenantDao();
        List<Tenant> ls = td.getAllTenant();
//        Tenant tenant = new Tenant();
        
        //Loop with each Tenant 
        for(int i=0; i<ls.size(); i++) {
	        if(email.equals(ls.get(i).getEmail() )) {
	        	//email already in use 
	        	mv = new ModelAndView("redirect:/backtoSignup");
	        	mv.addObject("Msg", "Email is already in use! Use a different email.");
	        	System.out.println("Email Already In Use!");
	        	return mv; //Instead of break 
//	        	break;
	        }
        
        }
        

        //Save tenant
        td.addTenant(firstName, lastName, phone, email, password);
        //If no, proceed to save the new tenant into the db.
        //Tenant tenant = new Tenant();
        tenant.setFirstName(firstName);
        tenant.setLastName(lastName);
        tenant.setEmail(email);
        tenant.setPassword(password);
        tenant.setPhone(phone);
        tenant.setTenantId(td.getTenantId(email));
        
        //Add tenant to session 
        setTenantSession(session,tenant);
        
        
        System.out.println("Tenant successfully added");

        // Add parameters to the ModelAndView object
        mv.addObject("tenant", tenant);
        
        //NEw thing here 
//        redirectAttributes.addFlashAttribute("tenant", tenant);
//        return new ModelAndView("redirect:successPage");

        // Redirect to homePage, which will only occur if email is valid.
        return mv;
        
        
        //Prob rn is, if it try to refresh, it will run all the data again. Then since the email is ady saved, error will occur.
    }
    
    @RequestMapping("gotoHomePage")
    public ModelAndView homepageRdr(@ModelAttribute("tenant") Tenant tenant, HttpSession session) {
    	ModelAndView mv = new ModelAndView("homePage");
    	mv.addObject("tenant",tenant);
    	
    	return mv;
    	
    }
    
    @RequestMapping("backtoSignup")
    public ModelAndView homepageRdr() {
    	ModelAndView mv = new ModelAndView("TenantSignup");
    	
    	return mv;
    	
    }
    
    @RequestMapping("TenantLogin")
    public ModelAndView loginTenant(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("tenant") Tenant tenant, HttpSession session) {
        // Retrieve input parameters from the form
        String email = request.getParameter("email");
        String password = request.getParameter("password");
   
//        Tenant tenant = new Tenant();
        ModelAndView mv = new ModelAndView("homePage");
        
        TenantDao td = new TenantDao();
        List<Tenant> ls = td.getAllTenant();
        
        //Default

    	mv = new ModelAndView("TenantLogin");
    	mv.addObject("Msg", "Email Or Password inserted is invalid");
        
        for(int i=0; i<ls.size(); i++) {
        if(email.equals(ls.get(i).getEmail() )) {
        	if(password.equals(ls.get(i).getPassword())) {
        		tenant = ls.get(i);
        		mv = new ModelAndView("homePage");
            	mv.addObject("Msg", null);
            	mv.addObject("tenant", tenant);
        		System.out.println("Tenant Authenticated");
        		break;
        	}
        }
        else {
        	//Password or email mismatch. 
    		System.out.println("Tenant Cannot be Authenticated");
        }
        
        }
        
        
        //Here, need to retrieve tenant from db. 
        //Then, compare if the email matches any tenant. 
        	//If yes, compare if the password matches that tenant's 
        		//If yes, login and redirect 
        		//If no, return error and redirect to login page 
        	//Same here 
//        Tenant curTenant = new Tenant(); // Use this to iterate with each tenant from the db 
        
        //Loop with each tenant 
//        for() {
//        if(email.equals(curTenant.getEmail() )) {
//        	if(password.equals(curTenant.getPassword())) {
//        		tenant = curTenant;
//        		mv = new ModelAndView("homePage");
//        	}
//        }
//        else {
//        	//Password or email mismatch. 
//        	mv = new ModelAndView("TenantLogin");
//        	mv.addObject("Msg", "Email Or Password inserted is invalid");
//        }
        
//        }
        
        //Add tenant to session 
        setTenantSession(session,tenant);

        // Redirect back to TenantSignup.jsp
        return mv;
    }
    
    @RequestMapping("tenantLogout")
    public ModelAndView tenantLogout(HttpSession session) {
    	 session.invalidate();
    	 ModelAndView mv = new ModelAndView("TenantLogin");
    	 return mv;
    	
    }
    
    
    
    //Just to set Tenant Session 
    public static void setTenantSession(HttpSession session, Tenant tenant) {
        // Set the Tenant object as a session attribute
        session.setAttribute("tenant", tenant);
    }
    

    @RequestMapping("tenantLogin")
    public ModelAndView tenantLoginView() {
    	 ModelAndView mv = new ModelAndView("TenantLogin");
    	 return mv;
    	
    }

    @RequestMapping("tenantSignup")
    public ModelAndView tenantSignupView() {
    	 ModelAndView mv = new ModelAndView("TenantSignup");
    	 return mv;
    	
    }
    
  
    
    
    
    
    
    
}
