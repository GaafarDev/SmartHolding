package com.project.payment;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SendPaymentReceipt {
	//Unused
    @RequestMapping("DisplayReceipt")
    @ResponseBody()
	public String getReceipt() {
		return "Build a page for displaying the receipt";
	}

}
