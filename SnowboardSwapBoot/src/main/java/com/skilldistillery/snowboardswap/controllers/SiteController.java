package com.skilldistillery.snowboardswap.controllers;

//import java.time.LocalDateTime;

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
	
//	@PostMapping("mainPage.do")
//	public String mainPage(HttpSession session) {
//		// Get loginTime and cast
//		LocalDateTime loginTime = (LocalDateTime) session.getAttribute("loginTime");
//		if (loginTime != null) {
//			session.setAttribute("timeOnSite", loginTime);
//		}
//		return "display.jsp";
//	}

	@GetMapping({ "register" })
	public ModelAndView register() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("accountRegister");
		return mv;
	}
}
