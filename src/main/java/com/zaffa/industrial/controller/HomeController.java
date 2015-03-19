package com.zaffa.industrial.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	static Logger log = Logger.getLogger(HomeController.class.getName());
	
	@RequestMapping("/home")
	public String home() {
		return "home";
	}
}
