package com.zaffa.industrial.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FindController {
	
	static Logger log = Logger.getLogger(FindController.class.getName());
	
	@RequestMapping("/find")
	public String find() {
		return "find";
	}
}
