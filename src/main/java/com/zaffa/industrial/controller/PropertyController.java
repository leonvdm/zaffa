package com.zaffa.industrial.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zaffa.industrial.dto.PropertyDTO;
import com.zaffa.industrial.service.PropertyService;

@Controller
@RequestMapping("/property")
public class PropertyController {
	
	static Logger LOGGER = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private PropertyService propertyService;
	
	@RequestMapping(method=RequestMethod.GET)
	@ResponseBody
	public List<PropertyDTO> getAllProperties() {
		return propertyService.findAllDTOs();
	}
}
