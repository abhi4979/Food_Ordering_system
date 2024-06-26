package com.java.foodmanagmentsystem.controller;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.java.foodmanagmentsystem.dao.CustomerDao;
import com.java.foodmanagmentsystem.entity.Admin;
import com.java.foodmanagmentsystem.entity.Customer;

@Controller
public class customerController {
	@Autowired
	CustomerDao dao;
	
	
	@RequestMapping("/addcustomer")
	// save 
	public ModelAndView addCustomer() {
	
		Customer customer=new Customer();
		customer.setMobileNumber("");
		ModelAndView mav=new ModelAndView();
		mav.addObject("customerobj",customer);
		mav.setViewName("CustomerForm");
		return mav;
	}
	
	@RequestMapping("/savecustomer")
	//Handler used to save details into the database
	public ModelAndView saveAdmin(@ModelAttribute("customerobj") Customer customer,ServletRequest request) {
		String pass1=request.getParameter("pass1");
		String pass2=request.getParameter("pass2");
		if (pass1 != null && pass2 != null && pass1.equals(pass2)){
		dao.saveCustomer(customer);
		ModelAndView mav=new ModelAndView();
		mav.addObject("message", "account Created Successfully");
		mav.setViewName("CustomerLogin");
		return mav;
		}
		else {
			ModelAndView mav=new ModelAndView();
			mav.addObject("message", "Password and Confirm password should be correct");
			mav.setViewName("CustomerForm");
			return mav;
		}
	}
	@RequestMapping("/customerloginvalidate")
	//HAndler used to perform Login validation for Customer
	public ModelAndView loginValidate(ServletRequest request,HttpSession session) {
		
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		//Admin admin=dao.login(email, password);
		Customer customer=dao.login(email, password);
		ModelAndView mav=new ModelAndView();
		
		if(customer!=null) {
			mav.setViewName("CustomerOptions");
			session.setAttribute("customerinfo", customer.getId());
			return mav;
		}
		else {
			mav.addObject("message","invalid credentials");
			mav.setViewName("CustomerLogin");
			return mav;
		}
	}
	
	

}
