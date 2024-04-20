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

class AddressTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Address address;

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
		address = em.find(Address.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		address = null;
		em.close();
	}

	@Test
	void test_address_entity_mapping() {
		assertNotNull(address);
		assertEquals(address.getStreet(), "509 Copper Rd");
		assertEquals("Frisco", address.getCity());
        assertEquals(80443, address.getPostalCode());
        assertEquals("866-841-2549", address.getPhoneNumber());
	}
	@Test
	void test_address_resort_12M() {
		assertNotNull(address);
		assertNotNull(address.getResorts());
		assertEquals("Copper Mountain", address.getResorts().get(0).getName());
	}
}
