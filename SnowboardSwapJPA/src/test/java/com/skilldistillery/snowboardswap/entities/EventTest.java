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

class EventTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Event event;

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
		event = em.find(Event.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		event = null;
		em.close();
	}

	@Test
	void test_Event_entity_mapping() {
		assertNotNull(event);
		assertEquals("Lets enjou the slopes together.", event.getDescription());
		assertEquals("Lets enjou the slopes together.", event.getDescription());
		assertEquals(2024, event.getEventStart().getYear());
		assertEquals(5, event.getEventStart().getMonthValue());
		assertEquals(14, event.getEventStart().getDayOfMonth());
		assertEquals("https://cdn.ski/seq5OnNnD6LfpXu0.jpg", event.getImageUrl());
	}
	@Test
	void test_Event_eventType_M21() {
		assertNotNull(event);
		assertNotNull(event.getEventType());
		assertEquals("Meetup", event.getEventType().getType());
	}
}