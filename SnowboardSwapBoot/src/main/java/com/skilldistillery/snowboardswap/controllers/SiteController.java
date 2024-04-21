package com.skilldistillery.snowboardswap.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SiteController {

	@GetMapping({ "/", "home.do" })
	public ModelAndView home() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("home");

		return mv;
	}

	@GetMapping({ "login" })
	public ModelAndView login() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("login");
		return mv;
	}

	@GetMapping({ "register" })
	public ModelAndView register() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("accountRegister");
		return mv;
	}

	@GetMapping({ "rideshare" })
	public ModelAndView profile() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("rideshare");
		return mv;
	}

//	@GetMapping({ "resorts" })
//	public ModelAndView rideShare() {
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("resorts");
//		return mv;
//	}

}
