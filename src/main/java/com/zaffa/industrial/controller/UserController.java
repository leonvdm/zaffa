package com.zaffa.industrial.controller;

import java.security.Principal;

import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.zaffa.industrial.entity.Property;
import com.zaffa.industrial.entity.User;
import com.zaffa.industrial.service.PropetyService;
import com.zaffa.industrial.service.UserService;



@Controller
public class UserController {

	static Logger log = Logger.getLogger(UserController.class.getName());
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private PropetyService propertyService;
	
	
	@ModelAttribute("property")
	public Property constructProperty() {
		return new Property();
	}
	
	@RequestMapping("/account")
	public String account(Model model, Principal principal) {
		String name = principal.getName(); 
		model.addAttribute("user", userService.findOneWithProperties(name));
		return "account";
	}
	
	@RequestMapping(value="/account", method=RequestMethod.POST)
	public String doAddProperty(Model model, @Valid @ModelAttribute("property") Property property, BindingResult result, Principal principal) {
		if (result.hasErrors()) {
			return account(model, principal);
		}
		String name = principal.getName();
		propertyService.save(property, name);
		return "redirect:/account.html";
	}
	
	@RequestMapping("/property/remove/{id}") 
	public String removeProperty(@PathVariable int id) {
		Property prop = propertyService.findOne(id);
		propertyService.delete(prop);
		return "redirect:/account.html";
	}
	
}
