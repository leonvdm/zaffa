package com.zaffa.industrial.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ImageController {
	
	static Logger logger = LoggerFactory.getLogger(ImageController.class);
	
	@RequestMapping("/uploads") 
	public void upload() {
		
	}
	

}
