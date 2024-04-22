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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Event> findAllEvents() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Event createEvent(Event event) {
		// TODO Auto-generated method stub
		return null;
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
	
	// TODO
//	List all events: This method will retrieve all events from the database.
//	Add an event: This method will persist a new event to the database.
//	Update an event: This method will update an existing event in the database.
//	Delete an event: This method will remove an event from the database.
//	Find an event by ID: This method will retrieve a single event by its ID.
	
	

}
