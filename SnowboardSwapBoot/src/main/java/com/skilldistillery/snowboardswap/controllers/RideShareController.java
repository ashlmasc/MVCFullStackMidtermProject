package com.skilldistillery.snowboardswap.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RideShareController {
	
	@GetMapping("rideshare")
	public ModelAndView profile() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("rideshare");
		return mv;
	}
}
