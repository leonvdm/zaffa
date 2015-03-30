package com.zaffa.industrial.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	static Logger LOGGER = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping("/home")
	public String home() {
		LOGGER.info("home");
		
		return "home";
	}
	
}
