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
}
