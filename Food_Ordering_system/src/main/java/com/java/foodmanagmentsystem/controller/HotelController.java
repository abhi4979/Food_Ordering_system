package com.java.foodmanagmentsystem.controller;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.java.foodmanagmentsystem.dao.HotelDao;
import com.java.foodmanagmentsystem.entity.Hotel;

@Controller
public class HotelController {
    @Autowired
    HotelDao dao;

    @RequestMapping("/addHotel")
    public ModelAndView addHotel() {
        try {
            Hotel hotel = new Hotel();
            ModelAndView mav = new ModelAndView();
            mav.addObject("hotelobj", hotel);
            mav.setViewName("HotelForm");
            return mav;
        } catch (Exception e) {
            ModelAndView mav = new ModelAndView("errorPage");
            mav.addObject("message", "Error in addHotel handler: " + e.getMessage());
            return mav;
        }
    }

    @RequestMapping("/savehotel")
	// handler used to save Hotel information in database.
	public ModelAndView saveHotel(@ModelAttribute("hotelobj") Hotel hotel) {
    	ModelAndView mav=new ModelAndView();
    	try {
		hotel.setStatus("Not Approved");
		dao.saveHotel(hotel);
		
		
		mav.addObject("message", "Your Account is in review,Plese wait for Review");
		mav.setViewName("HotelLogin");
    	}catch(Exception e) {
    		mav.addObject("message", "there is some issue with your registration.please try again later");
    		mav.setViewName("errorPage");
    	}
		return mav;
	}

    @RequestMapping("/hotelloginvalidate")
    public ModelAndView loginValidate(ServletRequest request, HttpSession session) {
        try {
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            Hotel hotel = dao.login(email, password);

            if (hotel != null) {
                if (hotel.getStatus().equals("Not Approved")) {
                    ModelAndView mav = new ModelAndView();
                    mav.addObject("message", "Your account is in review, please wait for some time.");
                    mav.setViewName("displaymessage");
                    return mav;
                } else if (hotel.getStatus().equals("Blocked")) {
                    ModelAndView mav = new ModelAndView();
                    mav.addObject("message", "Your account is blocked.");
                    mav.setViewName("displaymessage");
                    return mav;
                } else {
                    session.setAttribute("hotelinfo", hotel.getId());
                    ModelAndView mav = new ModelAndView();
                    mav.addObject("message", "Logged in successfully");
                    mav.setViewName("HotelOptions");
                    return mav;
                }
            } else {
                ModelAndView mav = new ModelAndView();
                mav.addObject("message", "Invalid credentials");
                mav.setViewName("HotelLogin");
                return mav;
            }
        } catch (Exception e) {
            ModelAndView mav = new ModelAndView("errorPage");
            mav.addObject("message", "Error in loginValidate handler: " + e.getMessage());
            return mav;
        }
    }

    @RequestMapping("/fetchunapprovedhotels")
    public ModelAndView fetchUnapprovedHotels() {
        try {
            List<Hotel> hotels = dao.findUnapprovedHotels();

            ModelAndView mav = new ModelAndView();
            mav.addObject("unapprovedhotels", hotels);
            mav.setViewName("displayunapprovedhotels");
            return mav;
        } catch (Exception e) {
            ModelAndView mav = new ModelAndView("errorPage");
            mav.addObject("message", "Error in fetchUnapprovedHotels handler: " + e.getMessage());
            return mav;
        }
    }

    @RequestMapping("/approvehotel")
    public ModelAndView approveHotel(@RequestParam("id") int id) {
        try {
            Hotel h = dao.findById(id);
            h.setStatus("approved");
            dao.updateHotel(h);

            ModelAndView mav = new ModelAndView();
            mav.setViewName("redirect://fetchunapprovedhotels");
            return mav;
        } catch (Exception e) {
            ModelAndView mav = new ModelAndView("errorPage");
            mav.addObject("message", "Error in approveHotel handler: " + e.getMessage());
            return mav;
        }
    }

    @RequestMapping("/viewUnblock")
    public ModelAndView viewUnblockedHotels() {
        try {
            List<Hotel> hotels = dao.findAllUnblockedHotels();

            ModelAndView mav = new ModelAndView();
            mav.addObject("unblockhotels", hotels);
            mav.setViewName("viewallunblockhotels");
            return mav;
        } catch (Exception e) {
            ModelAndView mav = new ModelAndView("errorPage");
            mav.addObject("message", "Error in viewUnblockedHotels handler: " + e.getMessage());
            return mav;
        }
    }

    @RequestMapping("/blockhotel")
    public ModelAndView blockHotel(@RequestParam("id") int id) {
        try {
            Hotel h = dao.findById(id);
            h.setStatus("Blocked");
            dao.updateHotel(h);
            ModelAndView mav = new ModelAndView();
            mav.setViewName("redirect://viewUnblock");
            return mav;
        } catch (Exception e) {
            ModelAndView mav = new ModelAndView("errorPage");
            mav.addObject("message", "Error in blockHotel handler: " + e.getMessage());
            return mav;
        }
    }

    @RequestMapping("/viewBlock")
    public ModelAndView viewBlockHotels() {
        try {
            List<Hotel> hotels = dao.findAllBlockedHotels();

            ModelAndView mav = new ModelAndView();
            mav.addObject("blockhotels", hotels);
            mav.setViewName("viewallblockhotels");
            return mav;
        } catch (Exception e) {
            ModelAndView mav = new ModelAndView("errorPage");
            mav.addObject("message", "Error in viewBlockHotels handler: " + e.getMessage());
            return mav;
        }
    }

    @RequestMapping("/unblockblockhotel")
    public ModelAndView unblockHotel(@RequestParam("id") int id) {
        try {
            Hotel h = dao.findById(id);
            h.setStatus("approved");
            dao.updateHotel(h);
            ModelAndView mav = new ModelAndView();
            mav.setViewName("redirect://viewBlock");
            return mav;
        } catch (Exception e) {
            ModelAndView mav = new ModelAndView("errorPage");
            mav.addObject("message", "Error in unblockHotel handler: " + e.getMessage());
            return mav;
        }
    }
    @RequestMapping("/hotellogout")
    public ModelAndView logout(HttpSession session) {
        ModelAndView mav = new ModelAndView();
        try {
            session.invalidate();
            mav.addObject("message", "Logged out successfully");
            mav.setViewName("HotelHomepage");
        } catch (Exception e) {
            mav.addObject("message", "An error occurred: " + e.getMessage());
            mav.setViewName("errorPage");
        }
        return mav;
    }

}
