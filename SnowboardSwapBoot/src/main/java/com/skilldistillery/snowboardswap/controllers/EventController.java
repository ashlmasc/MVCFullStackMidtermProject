package com.skilldistillery.snowboardswap.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.skilldistillery.snowboardswap.data.EventDAO;

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
	
	// TODO
//	List all events: This method will retrieve all events from the database.
//	Add an event: This method will persist a new event to the database.
//	Update an event: This method will update an existing event in the database.
//	Delete an event: This method will remove an event from the database.
//	Find an event by ID: This method will retrieve a single event by its ID.
}
