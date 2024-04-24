package com.skilldistillery.snowboardswap.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.snowboardswap.data.AddressDAO;
import com.skilldistillery.snowboardswap.data.ResortDAO;
import com.skilldistillery.snowboardswap.data.RideShareDAO;
import com.skilldistillery.snowboardswap.data.UserDAO;
import com.skilldistillery.snowboardswap.entities.Address;
import com.skilldistillery.snowboardswap.entities.Ride;
import com.skilldistillery.snowboardswap.entities.User;

import ch.qos.logback.core.model.Model;
import jakarta.servlet.http.HttpSession;

@Controller
public class RideShareController {
	
	private RideShareDAO rideShareDAO;
	private AddressDAO addressDAO;
	private ResortDAO resortDAO;
	private UserDAO userDAO;

	public RideShareController(UserDAO userDAO, RideShareDAO rideShareDAO, AddressDAO addressDAO, ResortDAO resortDAO) {
		this.userDAO = userDAO;
		this.rideShareDAO = rideShareDAO;
		this.addressDAO = addressDAO;
		this.resortDAO = resortDAO;
	}

	@GetMapping({ "rideshare" })
	public ModelAndView rideShare() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("rideshare");

		return mv;
	}

	@PostMapping("rideshare")
	public String createRideShare(@RequestParam("sponsorid") int id, @RequestParam("resortid") int resortId,
			@RequestParam("street1") String street1, @RequestParam("city1") String city1,
			@RequestParam("state1") String state1, 
			@RequestParam("street2") String street2, @RequestParam("city2") String city2,
			@RequestParam("state2") String state2, Model model,
			BindingResult result, HttpSession session) {

		User loggedInUser = (User) session.getAttribute("loggedInUser");

		Ride ride = new Ride();
		ride.setUser(loggedInUser);
		
		Address departureAddress = addressDAO.createAddress(street1, city1, state1);
		Address arrivalAddress = addressDAO.createAddress(street2, city2, state2);
		
		ride.setDepartureAddress(departureAddress);
		ride.setArrivalAddress(arrivalAddress);


		ride.setResort(resortDAO.getResortByID(resortId));

		rideShareDAO.createRideShare(ride);


		return "rideshare";
	}
}

//		@PostMapping("updateRideShare")
//		public String updateRideShare(@RequestParam("rideShareId") int id, Model m) {
//			
//		}
