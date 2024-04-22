package com.skilldistillery.snowboardswap.data;

import java.util.List;

import org.springframework.stereotype.Service;

import com.skilldistillery.snowboardswap.entities.Resort;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class ResortDAOImpl implements ResortDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public List<Resort> getResorts() {

		String jpql = "SELECT resort FROM Resort resort";

		return em.createQuery(jpql, Resort.class).getResultList();
	}

	@Override
	public Resort getResortByID(int id) {
		Resort resort;

		String jpql = "SELECT resort FROM Resort resort JOIN FETCH resort.trails where resort.id = :resortId";

		em.find(Resort.class, id);

		resort = em.createQuery(jpql, Resort.class)

				.setParameter("resortId", id)

				.getSingleResult();

		return resort;
	}

	@Override
	public Resort addResort(Resort resort) {
		em.persist(resort);

		return resort;
	}

}
