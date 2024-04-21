package com.skilldistillery.snowboardswap.data;

import org.springframework.stereotype.Service;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class EventDAOImpl implements EventDAO {
	
	@PersistenceContext
	private EntityManager em;

}
