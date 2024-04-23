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
import com.skilldistillery.snowboardswap.data.UserDAOImpl;
import com.skilldistillery.snowboardswap.entities.Address;
import com.skilldistillery.snowboardswap.entities.Resort;
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


	public RideShareController(UserDAO userDAO, RideShareDAO rideShareDAO, AddressDAO addressDAO) {
		this.userDAO = userDAO;
		this.rideShareDAO = rideShareDAO;
		this.addressDAO = addressDAO;
	}

	@GetMapping({ "rideshare" })
	public ModelAndView rideShare() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("rideshare");

		return mv;
	}
	
	

	@PostMapping("rideshare")
	public String createRideShare(@RequestParam("sponsorid") int id, 
//            @RequestParam("userId") int userId, 
			@RequestParam("resortid") int resortId, 
			@RequestParam("street1") String street1, 
			@RequestParam("city1") String city1, 
			@RequestParam("state1") String state1, 
			@RequestParam("postalCode1") int postalCode1, 
			@RequestParam("street2") String street2, 
			@RequestParam("city2") String city2, 
			@RequestParam("state2") String state2, 
			@RequestParam("postalCode2") int postalCode2,
			Model model, BindingResult result, HttpSession session) {

		System.out.println(id + resortId);
		User loggedInUser = (User) session.getAttribute("loggedInUser");
	     
		Ride ride = new Ride();
		ride.setUser(userDAO.findById(1));
		
		Address departureAddress = new Address();
		departureAddress.setStreet(street1);
		departureAddress.setCity(city1);
		departureAddress.setState(state1);
		departureAddress.setPostalCode(postalCode1);
		departureAddress.setStreet(street2);
		departureAddress.setCity(city2);
		departureAddress.setState(state2);
		departureAddress.setPostalCode(postalCode2);
		
		Address arrivalAddress = new Address();

		arrivalAddress.setStreet(street1);
		arrivalAddress.setCity(city1);
		arrivalAddress.setState(state1);
		arrivalAddress.setPostalCode(postalCode1);
		arrivalAddress.setStreet(street2);
		arrivalAddress.setCity(city2);
		arrivalAddress.setState(state2);
		arrivalAddress.setPostalCode(postalCode2);

		
		ride.setDepartureAddress(addressDAO.addAddress(departureAddress));
	
		ride.setArrivalAddress(addressDAO.addAddress(arrivalAddress));	
		
		Resort resort = resortDAO.getResortByID(resortId);

		ride.setResort(resort);

		rideShareDAO.createRideShare(ride);
		
		
		System.out.println(loggedInUser + "******************************");
		System.out.println(departureAddress+ "******************************");
		System.out.println(arrivalAddress + "******************************");
		System.out.println(resort + "******************************");

		return "rideshare";
	}
}

//		@PostMapping("updateRideShare")
//		public String updateRideShare(@RequestParam("rideShareId") int id, Model m) {
//			
//		}
