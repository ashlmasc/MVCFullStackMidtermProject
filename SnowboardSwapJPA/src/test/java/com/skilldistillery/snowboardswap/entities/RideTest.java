package com.skilldistillery.snowboardswap.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

class RideTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Ride ride;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("SnowboardSwapJPA");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		ride = em.find(Ride.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		ride = null;
		em.close();
	}

	@Test
	void test_User_entity_mapping() {
		assertNotNull(ride);
<<<<<<< HEAD
		assertEquals("admin", ride.getSponsorId());
=======
		//assertEquals("admin", user.getUsername());
>>>>>>> 8c78b8253e6631105a75398afbaf2ac78edf4c19
	}
}
