package com.java.foodmanagmentsystem.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.java.foodmanagmentsystem.dao.HotelDao;
import com.java.foodmanagmentsystem.dao.ProductDao;
import com.java.foodmanagmentsystem.entity.Hotel;
import com.java.foodmanagmentsystem.entity.Product;

@Controller
public class ProductController {

    @Autowired
    ProductDao productDao;
    
    @Autowired
    HotelDao hotelDao;

    @RequestMapping("/addproduct")
    public ModelAndView addProduct() {
        try {
            Product product = new Product();
            ModelAndView mav = new ModelAndView();
            mav.addObject("productobj", product);
            mav.setViewName("ProductForm");
            return mav;
        } catch (Exception e) {
            ModelAndView mav = new ModelAndView("error");
            mav.addObject("message", "Due to some technical isuue we can't proceed your food order ,please login again.Thank You");
            mav.setViewName("errorPage");
            return mav;
        }
    }

    @RequestMapping("/saveproduct")
    public ModelAndView saveProduct(@ModelAttribute("productobj") Product p, HttpSession session) {
        try {
            Integer hotel_id = (Integer) session.getAttribute("hotelinfo");
            Hotel hotel = hotelDao.findById(hotel_id);

            // Initialize the products list if it is null
            if (hotel.getProducts() == null) {
                hotel.setProducts(new ArrayList<>());
            }

            hotel.getProducts().add(p);
            
            productDao.saveProduct(p);
            hotelDao.updateHotel(hotel);

            ModelAndView mav = new ModelAndView();
            mav.addObject("message", "Product added successfully");
            mav.setViewName("HotelOptions");
            return mav;
        } catch (Exception e) {
            ModelAndView mav = new ModelAndView("errorPage");
            mav.addObject("message", "Due to some technical isuue we can't proceed your food order ,please login again.Thank You");
            return mav;
        }
    }

    @RequestMapping("/viewproduct")
    public ModelAndView viewProducts(HttpSession session) {
        try {
            Integer hotelId = (Integer) session.getAttribute("hotelinfo");
            Hotel hotel = hotelDao.findById(hotelId);
            if (hotelId == null) {
                return new ModelAndView("redirect://HotelLogin.jsp");
            }
            
            List<Product> products = hotel.getProducts();
            ModelAndView mav = new ModelAndView();
            mav.addObject("products", products);
            mav.setViewName("ViewProducts");
            return mav;
        } catch (Exception e) {
            ModelAndView mav = new ModelAndView("error");
            mav.addObject("message", "Due to some technical isuue we can't proceed your food order ,please login again.Thank You");
            mav.setViewName("errorPage");
            return mav;
        }
    }

    @RequestMapping("/updateproduct")
    public ModelAndView updateProduct(@RequestParam("id") int id) {
        try {
            Product product = productDao.findById(id);
            ModelAndView mav = new ModelAndView();
            mav.addObject("existingProductInfo", product);
            mav.setViewName("updateproductform");
            return mav;
        } catch (Exception e) {
            ModelAndView mav = new ModelAndView("error");
            mav.addObject("message", "Error in updateProduct handler: " + e.getMessage());
            mav.setViewName("errorPage");
            return mav;
        }
    }

    @RequestMapping("/updateproductinfo")
    public ModelAndView updateProductInformation(@ModelAttribute("existingProductInfo") Product p) {
        try {
            productDao.updateProduct(p);
            ModelAndView mav = new ModelAndView();
            mav.addObject("message", "product updated Successfully");
            mav.setViewName("redirect://viewproduct");
            return mav;
        } catch (Exception e) {
            ModelAndView mav = new ModelAndView("error");
            mav.addObject("message", "Error in updateProductInformation handler: " + e.getMessage());
            mav.setViewName("errorPage");
            return mav;
        }
    }

    @RequestMapping("/delete")
    public ModelAndView deleteProduct(@RequestParam("id") int id, HttpSession session) {
        try {
            Integer hotel_id = (Integer) session.getAttribute("hotelinfo");
            Hotel hotel = hotelDao.findById(hotel_id);
            List<Product> products = hotel.getProducts();
            List<Product> productList = products.stream().filter(product -> product.getId() != id).collect(Collectors.toList());
            hotel.setProducts(productList);
            
            hotelDao.updateHotel(hotel);
            productDao.deleteById(id);
            
            ModelAndView mav = new ModelAndView();
            mav.addObject("message", "product deleted Successfully");
            mav.setViewName("redirect://viewproduct");
            return mav;
        } catch (Exception e) {
            ModelAndView mav = new ModelAndView("error");
            mav.addObject("message", "Error in deleteProduct handler: " + e.getMessage());
            mav.setViewName("errorPage");
            return mav;
        }
    }

   

    @RequestMapping("/fetchproductsbyhotel")
    public ModelAndView fetchProductByHotelName(ServletRequest request) {
        try {
            String hotelName = request.getParameter("hotel");
            List<Product> products = productDao.fetchItemByHotel(hotelName);
            
            ModelAndView mav = new ModelAndView();
            mav.addObject("productsList", products);
            mav.setViewName("displayproducttocustomer");
            return mav;
        } catch (Exception e) {
            ModelAndView mav = new ModelAndView("error");
            mav.addObject("message", "Error in fetchProductByHotelName handler: " + e.getMessage());
            mav.setViewName("errorPage");
            return mav;
        }
    }

    @RequestMapping("/fetchallproducts")
    public ModelAndView fetchAllProducts() {
        try {
            List<Product> products = productDao.findAllProduct();
            
            ModelAndView mav = new ModelAndView();
            mav.addObject("productsList", products);
            mav.setViewName("displayproducttocustomer");
            return mav;
        } catch (Exception e) {
            ModelAndView mav = new ModelAndView("error");
            mav.addObject("message", "Error in fetchAllProducts handler: " + e.getMessage());
            mav.setViewName("errorPage");
            return mav;
        }
    }

    @RequestMapping("/fetchproductsbetweenpricerange")
    public ModelAndView fetchAllProductsByRange(ServletRequest request) {
        try {
            String minCost = request.getParameter("minprice");
            String maxCost = request.getParameter("maxprice");
            
            List<Product> products = productDao.fetchProductsBetweenPriceRange(Double.parseDouble(minCost), Double.parseDouble(maxCost));
            
            ModelAndView mav = new ModelAndView();
            mav.addObject("productsList", products);
            mav.setViewName("displayproducttocustomer");
            return mav;
        } catch (Exception e) {
            ModelAndView mav = new ModelAndView("error");
            mav.addObject("message", "Error in fetchAllProductsByRange handler: " + e.getMessage());
            mav.setViewName("errorPage");
            return mav;
        }
    }

    @RequestMapping("/fetchproductbyhotelname")
    public ModelAndView fetchHotelName() {
        try {
        	List<Hotel> hotels = hotelDao.findApproveHotel();
            
            ModelAndView mav = new ModelAndView();
            mav.addObject("allhotellist", hotels);
            mav.setViewName("/fetchitemsbyhotel");
            return mav;
        } catch (Exception e) {
            ModelAndView mav = new ModelAndView("error");
            mav.addObject("message", "Error in fetchHotelName handler: " + e.getMessage());
            mav.setViewName("errorPage");
            return mav;
        }
    }

}
