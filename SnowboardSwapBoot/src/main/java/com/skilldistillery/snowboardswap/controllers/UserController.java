package com.skilldistillery.snowboardswap.controllers;

import org.springframework.stereotype.Controller;

import com.skilldistillery.snowboardswap.data.UserDAO;

@Controller
public class UserController {

	private UserDAO userDAO;
	
	public UserController(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
}
