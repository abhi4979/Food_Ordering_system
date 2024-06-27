package com.java.foodmanagmentsystem.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.java.foodmanagmentsystem.dao.CustomerDao;
import com.java.foodmanagmentsystem.dao.FoodOrderDao;
import com.java.foodmanagmentsystem.entity.Customer;
import com.java.foodmanagmentsystem.entity.FoodOrder;
import com.java.foodmanagmentsystem.entity.Item;

@Controller
public class foodOrderController {

    @Autowired
    FoodOrderDao foodOrderDao;

    @Autowired
    CustomerDao customerDao;

    @RequestMapping("/addfoodorder")
    public ModelAndView addFoodOrder(HttpSession session) {
        ModelAndView mav = new ModelAndView();
        try {
            FoodOrder foodOrder = new FoodOrder();
            mav.addObject("foodorderobj", foodOrder);
            mav.setViewName("foodorderform");
        } catch (Exception e) {
            mav.addObject("message", "Due to some technical isuue we can't proceed your food order ,please login again.Thank You");
            mav.setViewName("errorPage");
        }
        return mav;
    }

    @RequestMapping("/savefoodorder")
	public ModelAndView saveFoodOrders(@ModelAttribute("foodorderobj") FoodOrder foodOrder,HttpSession session) {
    	ModelAndView mav=new ModelAndView();
    	try {
		Integer customerId=(Integer) session.getAttribute("customerinfo");
		List<Item> items=(List) session.getAttribute("itemlist");
		foodOrder.setItems(items);

		double totalprice= items.stream().map(i->i.getCost()).mapToDouble(Double::new).sum();
		foodOrder.setTotalPrice(totalprice);
		Customer customer=customerDao.findById(customerId);
		
		List<FoodOrder> foodOrders=customer.getOrders();
		if(foodOrders.size() > 0) {
			foodOrders.add(foodOrder);
		}
		else {
			List<FoodOrder> foodOrderslist=new ArrayList<>();
			foodOrderslist.add(foodOrder);
			customer.setOrders(foodOrderslist);
		}
		foodOrderDao.saveFoodOrder(foodOrder);
		customerDao.updateCustomer(customer);
		//session.removeAttribute("itemlist");
		
		mav.addObject("message","Order Successfully");
		mav.addObject("foodOrderInfo", foodOrder);
		mav.setViewName("displaybilltocustomer");
    	}catch(Exception e) {
    		mav.addObject("message","Due to some technical isuue we can't proceed your food order ,please login again and order your favourite food.Thank You");
    		mav.setViewName("errorPage");
    }
		return mav;
    	
		
	}
   @RequestMapping("/removeitem")
   public ModelAndView removeItem(@RequestParam("id")int id,HttpSession session) {
	   ModelAndView mav=new ModelAndView();
	   try {
	   List<Item> items=(List<Item>) session.getAttribute("itemlist");
	   items.remove(id+1);
	   
	   session.setAttribute("itemlist", items);
	   
	   mav.addObject("message", "item removed successfully");
	   mav.setViewName("viewaddeditemstocustomer");
	   
	   }catch(Exception e) {
		   mav.addObject("message", "Due to some technical isuue we can't proceed your food order ,please login again.Thank You");
		   mav.setViewName("errorPage");
	   }
	   return mav;
   }
}
