package com.skilldistillery.snowboardswap.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.snowboardswap.data.AddressDAO;
import com.skilldistillery.snowboardswap.data.UserDAO;
import com.skilldistillery.snowboardswap.entities.Address;
import com.skilldistillery.snowboardswap.entities.User;

import ch.qos.logback.core.model.Model;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDAO;

	@Autowired
	private AddressDAO addressDAO;

	public UserController(UserDAO userDAO, AddressDAO addressDAO) {
		this.userDAO = userDAO;
		this.addressDAO = addressDAO;
	}

	@GetMapping("login.do")
	public String showLoginForm(HttpSession session) {
		if (session.getAttribute("loggedInUser") != null) {
			return "redirect: profile";
		}
		return "profile";
	}

	@PostMapping("login.do")
	public String login(@RequestParam("userName") String username, @RequestParam("password") String password,
			HttpSession session, Model model) {
		User loggedInUser = (User) session.getAttribute("loggedInUser");

		if (loggedInUser != null) {
			return "login";
		} else {
			User authenticatedUser = userDAO.authenticateUser(username, password);
			if (authenticatedUser != null) {
				session.setAttribute("loggedInUser", authenticatedUser);
				return "profile";
			} else {
				return "login";
			}
		}

	}

	@GetMapping("logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("loggedInUser");
		// session.removeAttribute("loginTime");
		// session.removeAttribute("timeOnSite");

		session.invalidate();
		return "redirect:/login";
	}

	@PostMapping({ "register.do" })
	public String showRegistrationForm(@RequestParam("firstName") String firstName,
			@RequestParam("lastName") String lastName, @RequestParam("username") String username,
			@RequestParam("password") String password, Address address, Model model) {
		User user = new User();
		address = addressDAO.addAddress(address);
		user.setFirstName(firstName);
		user.setLastName(lastName);
		user.setUsername(username);
		user.setPassword(password);
		user.setAddress(address);
		userDAO.registerUser(user);
		return "redirect:/profile";

	}
}
