package com.skilldistillery.snowboardswap.controllers;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.snowboardswap.data.RideShareDAO;
import com.skilldistillery.snowboardswap.entities.Address;
import com.skilldistillery.snowboardswap.entities.Resort;
import com.skilldistillery.snowboardswap.entities.Ride;

import ch.qos.logback.core.model.Model;

@Controller
public class RideShareController {
	
	
	@Autowired
    private RideShareDAO rideShareDAO;

    public RideShareController(RideShareDAO rideShareDAO) {
        this.rideShareDAO = rideShareDAO;
    }
    
    @GetMapping({"rideshare.do"})
	public ModelAndView rideShare() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("rideshare");

		return mv;
	}

    @PostMapping("rideshare.do")
    public String createRideShare(@RequestParam("departureAddress") Address departureAddress,
                                  @RequestParam("arrivalAddress") Address arrivalAddress,
                                  @RequestParam("resortId") int resortId,
                                  @RequestParam("detail") String detail,
                                  @RequestParam("departure") LocalDateTime departure,
                                  @RequestParam("vehicleCapacity") int vehicleCapacity,
                                  @RequestParam("vehicleMake") String vehicleMake,
                                  @RequestParam("vehicleModel") String vehicleModel,
                                  @RequestParam("active") int active,
                                  Model model, BindingResult result) {

        if (result.hasErrors()) {
            return "rideshare";
        }

        Resort resort = new Resort();
        resort.setId(resortId);
        
        Ride ride = new Ride();

        ride.setDepartureAddress(departureAddress);
        ride.setArrivalAddress(arrivalAddress);
        ride.setResort(resort);
        ride.setDetail(detail);
        ride.setDeparture(departure);
        ride.setVehicleCapacity(vehicleCapacity);
        ride.setVehicleMake(vehicleMake);
        ride.setVehicleModel(vehicleModel);
        ride.setActive(active);
        // Assuming createdAt and updatedAt are managed by the database, so not setting them here

        rideShareDAO.createRideShare(ride);

        return "rideshare";
    }
}
	
	
//		@PostMapping("updateRideShare")
//		public String updateRideShare(@RequestParam("rideShareId") int id, Model m) {
//			
//		}
		
	
	
	

