package com.zaffa.industrial.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	
	static Logger log = Logger.getLogger(LoginController.class.getName());
	
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
}
