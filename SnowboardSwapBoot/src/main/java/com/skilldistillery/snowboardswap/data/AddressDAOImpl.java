package com.skilldistillery.snowboardswap.data;

import org.springframework.stereotype.Service;

import com.skilldistillery.snowboardswap.entities.Address;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class AddressDAOImpl implements AddressDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Address addAddress(Address address) {

		em.persist(address);

		return address;
	}

}
