package com.skilldistillery.snowboardswap.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.snowboardswap.data.UserDAO;
import com.skilldistillery.snowboardswap.entities.Address;
import com.skilldistillery.snowboardswap.entities.User;

import ch.qos.logback.core.model.Model;
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
		//User authenticatedUser = userDAO.authenticateUser(user.getUsername(), user.getPassword());
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
		//session.removeAttribute("loginTime");
		//session.removeAttribute("timeOnSite");
		return "logout";
	}
	

	
	
	@PostMapping({"register.do"})
	public String showRegistrationForm(@RequestParam("firstName") String firstName, @RequestParam("lastName") String lastName, @RequestParam("username") String username, @RequestParam("password") String password, @RequestParam("city") String city, @RequestParam("state") String state, Address address,  Model model) {
		User user = new User();
		user.setFirstName(firstName);
		user.setLastName(lastName);
		user.setUsername(username);
		user.setPassword(password);
		user.getAddress().setCity(city);
		user.getAddress().setState(state);
		
		System.out.println("*******************************************************");
		userDAO.registerUser(user);
		return "accountRegister";
		
		
	}
}
