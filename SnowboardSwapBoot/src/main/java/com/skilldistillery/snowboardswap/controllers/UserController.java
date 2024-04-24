package com.skilldistillery.snowboardswap.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.snowboardswap.data.AddressDAO;
import com.skilldistillery.snowboardswap.data.UserDAO;
import com.skilldistillery.snowboardswap.entities.Address;
import com.skilldistillery.snowboardswap.entities.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

	private UserDAO userDAO;
	private AddressDAO addressDAO;

	public UserController(UserDAO userDAO, AddressDAO addressDAO) {
		this.userDAO = userDAO;
		this.addressDAO = addressDAO;
	}

	// Old one
//	@GetMapping("login.do")
//	public String showLoginForm(HttpSession session) {
//		if (session.getAttribute("loggedInUser") != null) {
//			return "redirect: profile";
//		}
//		return "profile";
//	}

	// Ash update
	@GetMapping("login.do")
	public String showLoginForm(HttpSession session) {
		if (session.getAttribute("loggedInUser") == null) {
			return "login"; // Return the login page if the user is not logged in
		}
		return "redirect:profile";
	}

	@PostMapping("login.do")
	public String login(@RequestParam("userName") String username, @RequestParam("password") String password,
	                    HttpSession session, Model model) {
	    User loggedInUser = (User) session.getAttribute("loggedInUser");

	    if (loggedInUser != null) {
	        return "redirect:profile";
	    } else {
	        User authenticatedUser = userDAO.authenticateUser(username, password);
	        if (authenticatedUser != null) {
	            session.setAttribute("loggedInUser", authenticatedUser);
	            return "redirect:profile";
	        } else {
	            model.addAttribute("errorMessage", "Invalid username or password.");
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

	@GetMapping("profile")
	public String showProfile(HttpSession session, Model model) {
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		if (loggedInUser == null) {
			return "redirect:login";
		}
		model.addAttribute("user", loggedInUser);
		return "profile";
	}

	// Method to show the update profile form
	@GetMapping("updateProfile")
	public String updateProfileForm(HttpSession session, Model model) {
	    User loggedInUser = (User) session.getAttribute("loggedInUser");
	    if (loggedInUser == null) {
	        return "redirect:login";
	    }
	    
	    // Populate the user object with existing password
	    loggedInUser.setPassword(loggedInUser.getPassword());
	    
	    model.addAttribute("user", loggedInUser);
	    return "updateProfile";
	}

	// Method to handle form submission and update the profile
	@PostMapping("updateProfile")
	public String updateProfile(@ModelAttribute("user") User updatedUser, BindingResult result, HttpSession session,
			Model model) {

		// retrieve originals user from the session
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		if (loggedInUser == null) {
			return "redirect:login";
		}

		// set updated user ID to the original user ID
		updatedUser.setId(loggedInUser.getId());

		// ensure update user user has a non-null address object
		if (updatedUser.getAddress() == null) {
			updatedUser.setAddress(new Address());
		}

		// update user profile using the updatedUser
		User updatedUserResult = userDAO.updateUserProfile(loggedInUser.getId(), updatedUser);

		if (updatedUserResult != null) {
			session.setAttribute("loggedInUser", updatedUserResult);
			model.addAttribute("successMessage", "Profile successfully updated.");
		} else {
			model.addAttribute("errorMessage", "Unable to update profile.");
		}

		// redirect to profile page after updating
		return "redirect:profile";
	}

	@PostMapping("deleteUser")
	public String deleteUser(HttpSession session) {
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		if (loggedInUser == null) {
			return "redirect:login";
		}
		int userId = loggedInUser.getId();
		boolean deleted = userDAO.deleteUser(userId);
		if (deleted) {
			session.invalidate(); // Log out user after deletion
			return "redirect:login";
		} else {
			return "redirect:profile"; // Redirect to profile if deletion fails
		}
	}

	// Exception handler for better debugging
	@ExceptionHandler(Exception.class)
	public ModelAndView handleError(Exception ex) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("exception", ex);
		mv.addObject("message", ex.getMessage());
		mv.setViewName("error");
		return mv;
	}
}
