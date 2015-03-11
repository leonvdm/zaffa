package com.zaffa.industrial.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zaffa.industrial.entity.Property;
import com.zaffa.industrial.entity.User;

@Controller
public class UploadController {
	
//	@ModelAttribute("property")
//	public Property constructProperty() {
//		return new Property();
//	}
	
	static Logger log = Logger.getLogger(UploadController.class.getName());
	
	@RequestMapping("/upload")
	public String upload() {
		return "upload";
	}
}
