package com.skilldistillery.snowboardswap.data;

import org.springframework.stereotype.Service;

import com.skilldistillery.snowboardswap.entities.Resort;
import com.skilldistillery.snowboardswap.entities.Trail;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class TrailDAOImpl implements TrailDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Resort findTrailByID(int id) {

		return em.find(Resort.class, id);
	}

	public Trail addTrail(Trail trail) {

		em.persist(trail);

		return trail;
	}
}
