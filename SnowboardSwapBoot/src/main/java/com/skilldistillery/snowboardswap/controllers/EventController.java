package com.skilldistillery.snowboardswap.controllers;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.snowboardswap.data.EventDAO;
import com.skilldistillery.snowboardswap.entities.Event;

@Controller
public class EventController {
	
	private EventDAO eventDAO;

    public EventController(EventDAO eventDAO) {
        this.eventDAO = eventDAO;
    }
	
    //Basic GetMapping to just show the webpage
	@GetMapping("event")
    public String showEvents() {
        return "event";
    }
	
//	Find an event by ID: This method will retrieve a single event by its ID.
	@GetMapping("event.do")
	public String getEvent(@RequestParam("eventId") int id, Model model) {
	    Event event = eventDAO.findEventById(id);
	    model.addAttribute("event", event);
	    return "event"; 
	}
	
//	List all events: This GetMapping will retrieve all events from the database.
	@GetMapping("event.do")
    public String listEvents(Model model) {
        List<Event> events = eventDAO.findAllEvents();
        model.addAttribute("allEvents", events);
        return "event";
    }
	
//	Add an event: This method will persist a new event to the database.
//	Update an event: This method will update an existing event in the database.
//	Delete an event: This method will remove an event from the database.
//	Find an event by ID: This method will retrieve a single event by its ID.
}
