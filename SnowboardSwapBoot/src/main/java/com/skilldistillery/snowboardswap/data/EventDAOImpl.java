package com.skilldistillery.snowboardswap.data;

import java.util.List;

import org.springframework.stereotype.Service;

import com.skilldistillery.snowboardswap.entities.Event;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class EventDAOImpl implements EventDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public Event findEventById(int eventId) {
		Event event = em.find(Event.class, eventId);
		return event;
	}

	@Override
	public List<Event> findAllEvents() {
		return em.createQuery("SELECT event FROM Event event", Event.class).getResultList();
	}

	@Override
	public Event createEvent(Event event) {
		em.persist(event); // Persist the part entity to the database
	    return event; // The persisted part will now have a generated ID
	}

	@Override
	public Event updateEvent(int eventId, Event event) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteEvent(int eventId) {
		// TODO Auto-generated method stub
		return false;
	}
}
