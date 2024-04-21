package com.skilldistillery.snowboardswap.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.snowboardswap.data.UserDAO;
import com.skilldistillery.snowboardswap.entities.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

	private UserDAO userDAO;

	public UserController(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	@GetMapping("login.do")
	  public String showLoginForm(HttpSession session) {
		if(session == null) {
			return "home";
		}
		return "login";
	  }

	@PostMapping("login.do")
	public ModelAndView login(User user, HttpSession session) {
		ModelAndView mv = new ModelAndView();

		User authenticatedUser = userDAO.authenticateUser("admin", "sspass");
//		User authenticatedUser = userDAO.authenticatedUser(user.getUsername(), user.getPassword());
		if (authenticatedUser != null) {
			session.setAttribute("loggedInUser", authenticatedUser);
			mv.setViewName("profile");
		} else {
			mv.addObject("loginFailed", true);
			mv.setViewName("login");
		}
		return mv;
	}

	@GetMapping("logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("loggedInUser");
		return "logout";
	}
	
	@GetMapping("register.do")
	public String showRegistrationForm() {
	    return "accountRegister"; 
	}
}
