package com.skilldistillery.snowboardswap.data;

import java.util.List;

import org.springframework.stereotype.Service;

import com.skilldistillery.snowboardswap.entities.User;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class UserDAOImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public User authenticateUser(String username, String password) {
		String jpql = "SELECT user FROM User user WHERE user.username = :username AND user.password = :password AND user.enabled = true";

		List<User> queryResult = em.createQuery(jpql, User.class).setParameter("username", username)
				.setParameter("password", password).getResultList();

		return queryResult.isEmpty() ? null : queryResult.get(0);
	}

	@Override
	public User registerUser(User user) {
		em.persist(user);
		return user;
	}

	@Override
	public User updateUserProfile(int id, User updatedUser) {
		User existingUser = em.find(User.class, id);
		if (existingUser != null && updatedUser != null) {
			existingUser.setFirstName(updatedUser.getFirstName());
			existingUser.setLastName(updatedUser.getLastName());
			existingUser.setBio(updatedUser.getBio());
			existingUser.setImageUrl(updatedUser.getImageUrl());
			existingUser.setPassword(updatedUser.getPassword()); // not sure if its this simple to change password?

			em.flush();
		}
		return existingUser;
	}

	@Override
	public User findById(int id) {
		return em.find(User.class, id);
	}

	@Override
	public boolean deleteUser(int userId) {
		User user = em.find(User.class, userId);
		if (user != null) {
			em.remove(user);
			return true;
		}
		return false;
	}
}
