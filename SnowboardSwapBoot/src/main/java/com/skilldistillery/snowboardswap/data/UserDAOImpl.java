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
		
		List<User> queryResult = em.createQuery(jpql, User.class)
				.setParameter("username", username)
				.setParameter("password", password)
				.getResultList();
		User authenticatedUser = null;
		
		if(!queryResult.isEmpty())
		{
			authenticatedUser = queryResult.get(0);
		}
		return authenticatedUser;
	}

	@Override
	public User registerUser(User user) {
		em.persist(user);
		return user;
	}

	@Override
	public User updateUserProfile(User user) {
		User updateUser = em.find(User.class, user);
		updateUser.setFirstName(user.getFirstName());
		updateUser.setLastName(user.getLastName());
		updateUser.setFirstName(user.getFirstName());
		updateUser.setFirstName(user.getFirstName());
		
		return null;
	}
	
	// Find a user by their ID
    @Override
    public User findById(int id) {
        return em.find(User.class, id);
    }
}
