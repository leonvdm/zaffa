package com.zaffa.industrial.controller;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zaffa.industrial.entity.Property;
import com.zaffa.industrial.service.PropetyService;

@Controller
public class HomeController {
	
	@Autowired
	private PropetyService propertyService;
	
	static Logger LOGGER = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping("/home")
	public String home(Model model) {
		LOGGER.info("home");
		
		List<Property> properties = propertyService.findAll();
		
		model.addAttribute("properties", properties);
		for (Property property : properties) {
			LOGGER.info(property.getLattitude() + "");
			LOGGER.info(property.getLongitude() + "");
		}
		
		return "home";
	}
	
}
