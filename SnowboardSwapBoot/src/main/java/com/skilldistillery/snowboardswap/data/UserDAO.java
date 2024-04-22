package com.skilldistillery.snowboardswap.data;

import com.skilldistillery.snowboardswap.entities.User;

public interface UserDAO {

	User authenticateUser(String username, String password);
	
	User registerUser(User user);
	
	User updateUserProfile(User user);
	
	// Method to find a user by ID
    User findById(int id);
}
