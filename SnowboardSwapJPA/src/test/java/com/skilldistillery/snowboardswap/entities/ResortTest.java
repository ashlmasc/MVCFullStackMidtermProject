package com.skilldistillery.snowboardswap.entities;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

class ResortTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Resort resort;

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
		resort = em.find(Resort.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		resort = null;
		em.close();
	}

	@Test
	void test_User_entity_mapping() {
		assertNotNull(resort);
		
	
}

}