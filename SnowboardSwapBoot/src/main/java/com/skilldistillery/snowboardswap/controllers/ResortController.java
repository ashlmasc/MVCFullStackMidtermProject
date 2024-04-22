package com.skilldistillery.snowboardswap.controllers;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.snowboardswap.data.AddressDAO;
import com.skilldistillery.snowboardswap.data.ResortDAO;
import com.skilldistillery.snowboardswap.entities.Address;
import com.skilldistillery.snowboardswap.entities.Resort;

@Controller
public class ResortController {

	private ResortDAO resortDAO;
	private AddressDAO addressDAO;

	public ResortController(ResortDAO resortDAO, AddressDAO addressDAO) {
		this.resortDAO = resortDAO;
		this.addressDAO = addressDAO;
	}

	@GetMapping({ "resorts" })
	public ModelAndView showResorts() {
		ModelAndView mv = new ModelAndView();

		List<Resort> resorts = resortDAO.getResorts();

		mv.addObject("resorts", resorts);

		mv.setViewName("resorts");
		return mv;
	}

	@GetMapping({ "resort" })
	public ModelAndView getResort(@RequestParam("id") int id) {
		ModelAndView mv = new ModelAndView();

		Resort resort = resortDAO.getResortByID(id);
		System.out.println(resort.getName() + "yep");
		mv.addObject("resort", resort);

		mv.setViewName("resortInfo");
		return mv;
	}

	@PostMapping("addResort")
	public ModelAndView addResort(Resort resort, Address address) {
		ModelAndView mv = new ModelAndView();

		address = addressDAO.addAddress(address);
		resort.setAddress(address);
		resort = resortDAO.addResort(resort);
		System.out.println(resort + "***");
		System.out.println("****");

		mv.setViewName("resorts");
		return mv;
	}

	@PostMapping("editResort")
	public ModelAndView editResort(Resort resort, Address address, @RequestParam("addressId") int addressId) {

		address.setId(addressId);
		System.out.println(resort + "***");
		System.out.println("*****" + resort.getAddress());
		System.out.println(address);

		return null;
	}
}
