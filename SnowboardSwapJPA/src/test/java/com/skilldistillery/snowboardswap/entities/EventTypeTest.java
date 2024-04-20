package com.skilldistillery.snowboardswap.entities;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

class EventTypeTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private EventType eventType;

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
		eventType = em.find(EventType.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		eventType = null;
		em.close();
	}

	@Test
	void test_EventType_entity_mapping() {
		assertNotNull(eventType);
		//assertEquals(address.getStreet(), "509 Copper Rd");
//        assertEquals("Frisco", address.getCity());
//        assertEquals("80443", address.getPostalCode());
//        assertEquals("866-841-2549", address.getPhoneNumber());
	}

}
