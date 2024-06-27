package com.java.foodmanagmentsystem.controller;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.java.foodmanagmentsystem.dao.CustomerDao;
import com.java.foodmanagmentsystem.entity.Customer;

@Controller
public class customerController {
    
    @Autowired
    CustomerDao dao;
    
    @RequestMapping("/addcustomer")
    public ModelAndView addCustomer() {
        ModelAndView mav = new ModelAndView();
        try {
            Customer customer = new Customer();
            //customer.setMobileNumber("");
            mav.addObject("customerobj", customer);
            mav.setViewName("CustomerForm");
        } catch (Exception e) {
            mav.addObject("message", "An error occurred: " + e.getMessage());
            mav.setViewName("errorPage");
        }
        return mav;
    }
    
    @RequestMapping("/savecustomer")
    public ModelAndView saveCustomer(@ModelAttribute("customerobj") Customer customer) {
        ModelAndView mav = new ModelAndView();
        try {
            dao.saveCustomer(customer);
            mav.addObject("message", "Account created successfully");
            mav.setViewName("CustomerLogin");
        } catch (Exception e) {
            mav.addObject("message", "An error occurred: " + e.getMessage());
            mav.setViewName("errorPage");
        }
        return mav;
    }
    
    @RequestMapping("/customerloginvalidate")
    public ModelAndView loginValidate(ServletRequest request, HttpSession session) {
        ModelAndView mav = new ModelAndView();
        try {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            
            Customer customer = dao.login(email, password);
            
            if (customer != null) {
                mav.setViewName("CustomerOptions");
                session.setAttribute("customerinfo", customer.getId());
            } else {
                mav.addObject("message", "Invalid credentials");
                mav.setViewName("CustomerLogin");
            }
        } catch (Exception e) {
            mav.addObject("message", "An error occurred: " + e.getMessage());
            mav.setViewName("errorPage");
        }
        return mav;
    }
    
    @RequestMapping("/customerlogout")
    public ModelAndView logout(HttpSession session) {
        ModelAndView mav = new ModelAndView();
        try {
            session.invalidate();
            mav.addObject("message", "Logged out successfully");
            mav.setViewName("CustomerHomePage");
        } catch (Exception e) {
            mav.addObject("message", "An error occurred: " + e.getMessage());
            mav.setViewName("errorPage");
        }
        return mav;
    }
}
