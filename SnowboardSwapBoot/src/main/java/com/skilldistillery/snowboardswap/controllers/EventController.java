package com.skilldistillery.snowboardswap.controllers;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.snowboardswap.data.AddressDAO;
import com.skilldistillery.snowboardswap.data.EventDAO;
import com.skilldistillery.snowboardswap.data.EventTypeDAO;
import com.skilldistillery.snowboardswap.data.UserDAO;
import com.skilldistillery.snowboardswap.entities.Address;
import com.skilldistillery.snowboardswap.entities.Event;
import com.skilldistillery.snowboardswap.entities.EventType;
import com.skilldistillery.snowboardswap.entities.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class EventController {
	
	private EventDAO eventDAO;
	private AddressDAO addressDAO;
	private EventTypeDAO eventTypeDAO;
	private UserDAO userDAO;

	public EventController(EventDAO eventDAO, AddressDAO addressDAO, EventTypeDAO eventTypeDAO, UserDAO userDAO) {
		this.eventDAO = eventDAO;
		this.addressDAO = addressDAO;
		this.eventTypeDAO = eventTypeDAO;
		this.userDAO = userDAO;
	}
	
    //Basic GetMapping to just show the webpage
//	@GetMapping("event")
//    public String showEvents() {
//        return "event";
//    }
	
//	Find an event by ID: This method will retrieve a single event by its ID.
	@GetMapping("eventDetail")
	public String getEvent(@RequestParam("eventId") int id, Model model) {
	    Event event = eventDAO.findEventById(id);
	    model.addAttribute("event", event);
	    return "eventDetail"; 
	}
	
//	List all events: This GetMapping will retrieve all events from the database.
	@GetMapping("event")
    public String listEvents(Model model) {
        List<Event> events = eventDAO.findAllEvents();
        model.addAttribute("allEvents", events);
        return "event";
    }
	
//	Add an event: This method will persist a new event to the database.
	@GetMapping("addEvent")
	public String addEventForm(Model model, HttpSession session) {
	    List<EventType> eventTypes = eventTypeDAO.findAllEventTypes();
	    model.addAttribute("eventTypes", eventTypes);

	    Integer userId = (Integer) session.getAttribute("userId");
	    if (userId != null) {
	        model.addAttribute("userId", userId);
	    }

	    return "addEvent";
	}
	
	@PostMapping("addEvent")
	public String createEvent(@ModelAttribute("event") Event event, 
	                          BindingResult result, 
	                          @RequestParam("eventTypeId") int eventTypeId, 
	                          @RequestParam("userId") int userId, 
	                          @ModelAttribute("address") Address address, 
	                          Model model) {
		// Log the received userId
	    System.out.println("Received userId: " + userId);
	    if (result.hasErrors()) {
	        return "addEvent"; // Return with errors
	    }

	    EventType eventType = eventTypeDAO.findEventTypeById(eventTypeId);
	    event.setEventType(eventType);

	    User user = userDAO.findById(userId);
	    event.setSponsor(user);

	    Address savedAddress = addressDAO.addAddress(address); //  method that saves and returns the address with an id
	    event.setAddress(savedAddress);

	    eventDAO.createEvent(event); // Save the event
	    return "redirect:/eventDetail"; // redirect event details page
	}
	
//	Update an event: This method will update an existing event in the database.
//	Delete an event: This method will remove an event from the database.
//	Find an event by ID: This method will retrieve a single event by its ID.
}
