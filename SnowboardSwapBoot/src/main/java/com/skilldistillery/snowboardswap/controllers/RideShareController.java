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
			@RequestParam("state1") String state1, @RequestParam("postalCode1") int postalCode1,
			@RequestParam("street2") String street2, @RequestParam("city2") String city2,
			@RequestParam("state2") String state2, @RequestParam("postalCode2") int postalCode2, Model model,
			BindingResult result, HttpSession session) {

		User loggedInUser = (User) session.getAttribute("loggedInUser");

		Ride ride = new Ride();
		ride.setUser(loggedInUser);

		Address departureAddress = new Address();

		departureAddress.setStreet(street1);
		departureAddress.setCity(city1);
		departureAddress.setState(state1);
		departureAddress.setPostalCode(postalCode1);

		Address arrivalAddress = new Address();

		arrivalAddress.setStreet(street2);
		arrivalAddress.setCity(city2);
		arrivalAddress.setState(state2);
		arrivalAddress.setPostalCode(postalCode2);

		ride.setDepartureAddress(addressDAO.addAddress(departureAddress));

		ride.setArrivalAddress(addressDAO.addAddress(arrivalAddress));

		ride.setResort(resortDAO.getResortByID(resortId));

		rideShareDAO.createRideShare(ride);

//		System.err.println(ride.getUser().getFirstName());
//		System.err.println(ride.getDepartureAddress());
//		System.err.println(ride.getArrivalAddress());
//		System.err.println(ride.getResort().getId());

		return "rideshare";
	}
}

//		@PostMapping("updateRideShare")
//		public String updateRideShare(@RequestParam("rideShareId") int id, Model m) {
//			
//		}
