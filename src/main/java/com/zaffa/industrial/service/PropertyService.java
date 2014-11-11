package com.zaffa.industrial.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.method.P;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;

import com.zaffa.industrial.entity.Property;
import com.zaffa.industrial.entity.User;
import com.zaffa.industrial.repository.PropertyRepository;
import com.zaffa.industrial.repository.UserRepository;

@Service
public class PropertyService {
	
	@Autowired
	private PropertyRepository propertyRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	
	public void save(Property property, String name) {
		User user = userRepository.findByName(name);
		property.setUploader(user);
		propertyRepository.save(property);
	}


	public void delete(int id) {
		propertyRepository.delete(id);
		
	}


	public Property findOne(int id) {
		return propertyRepository.findOne(id);
	}


	@PreAuthorize("#property.uploader.name == authentication.name or hasRole('ADMIN')")
	public void delete(@P("property") Property prop) {
		propertyRepository.delete(prop);
		
	}

	
}
