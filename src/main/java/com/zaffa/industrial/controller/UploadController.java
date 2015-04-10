package com.zaffa.industrial.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UploadController {
	
//	@ModelAttribute("property")
//	public Property constructProperty() {
//		return new Property();
//	}
	
	static Logger log = Logger.getLogger(UploadController.class.getName());
	
	@RequestMapping(value="/upload", method=RequestMethod.POST)
	public String upload() {
		log.info("UPLOADING - POST");
		return "upload";
	}
	
	@RequestMapping(value="/upload", method=RequestMethod.GET)
	public String uploadGET() {
		log.info("UPLOADING - GET");
		return "upload";
	}
}
