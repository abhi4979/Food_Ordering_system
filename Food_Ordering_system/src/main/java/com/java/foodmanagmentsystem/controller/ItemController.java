package com.java.foodmanagmentsystem.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.java.foodmanagmentsystem.dao.CustomerDao;
import com.java.foodmanagmentsystem.dao.FoodOrderDao;
import com.java.foodmanagmentsystem.dao.ItemDao;
import com.java.foodmanagmentsystem.dao.ProductDao;
import com.java.foodmanagmentsystem.entity.Item;
import com.java.foodmanagmentsystem.entity.Product;

@Controller
public class ItemController {
    @Autowired
    ItemDao itemDao;

    @Autowired
    ProductDao productDao;
    
    @Autowired
    CustomerDao customerdao;
    
    @Autowired
    FoodOrderDao foodorderdao;

    @RequestMapping("/additem")
    public ModelAndView addItem(@RequestParam("id") Integer productId) {
        try {
            Product product = productDao.findById(productId);
            Item item = new Item();
            item.setName(product.getName());
            item.setType(product.getType());
            item.setCost(product.getCost());
            item.setQuantity(1); // Initialize quantity to 1

            ModelAndView mav = new ModelAndView();
            mav.addObject("itemobj", item);
            mav.setViewName("itemform");
            return mav;
        } catch (Exception e) {
            ModelAndView mav = new ModelAndView("errorPage");
            mav.addObject("message", "Error in addItem handler: " + e.getMessage());
            return mav;
        }
    }

    @RequestMapping("/saveitemorder")
    public ModelAndView saveItemOrder(@ModelAttribute("itemobj") Item item, HttpSession session) {
        try {
            List<Item> items = (List<Item>) session.getAttribute("itemlist");

            if (items == null) {
                items = new ArrayList<>();
                items.add(item);
            } else {
                boolean itemExists = false;
                for (Item sessionItem : items) {
                    if (sessionItem.getName().equals(item.getName())) {
                        sessionItem.setQuantity(sessionItem.getQuantity() + item.getQuantity());
                        sessionItem.setCost(sessionItem.getQuantity() * sessionItem.getCost());
                        itemExists = true;
                        break;
                    }
                }
                if (!itemExists) {
                    items.add(item);
                }
            }

            session.setAttribute("itemlist", items);

            ModelAndView mav = new ModelAndView();
            mav.addObject("message", "Added Successfully");
            mav.setViewName("redirect://fetchallproducts");
            return mav;
        } catch (Exception e) {
            ModelAndView mav = new ModelAndView("errorPage");
            mav.addObject("message", "Error in saveItemOrder handler: " + e.getMessage());
            return mav;
        }
    }
    
}
