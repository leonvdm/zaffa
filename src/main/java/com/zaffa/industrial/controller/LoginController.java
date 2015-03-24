package com.zaffa.industrial.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	
	static Logger LOGGER = LoggerFactory.getLogger(LoginController.class);

	
	@RequestMapping("/login")
	public String login() {
		LOGGER.info("Logging in");
		return "login";
	}
}
