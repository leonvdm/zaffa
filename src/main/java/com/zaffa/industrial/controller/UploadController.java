package com.zaffa.industrial.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UploadController {
	
	static Logger log = Logger.getLogger(UploadController.class.getName());
	
	@RequestMapping("/upload")
	public String upload() {
		return "upload";
	}
}
