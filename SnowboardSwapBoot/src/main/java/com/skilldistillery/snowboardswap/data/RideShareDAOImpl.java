package com.skilldistillery.snowboardswap.data;

import org.springframework.stereotype.Service;

import com.skilldistillery.snowboardswap.entities.Ride;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;


	@Service
	@Transactional
	public class RideShareDAOImpl implements RideShareDAO {

		
		@PersistenceContext
		private EntityManager em;

		@Override
		public Ride createRideShare(Ride ride) {
			em.persist(ride);
			return ride;
		}

		@Override
		public boolean deleteRideShare(int id) {
			Ride ride = em.find(Ride.class, id);
			if (ride != null) {
				em.remove(ride);
				return true;
			}
			return false;
		}

		@Override
		public Ride updateRideShare(Ride ride) {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public Ride joinRideShare(Ride ride) {
			// TODO Auto-generated method stub
			return null;
		}
		
		
	
	
	
	
}
