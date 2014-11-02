package com.zaffa.industrial.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zaffa.industrial.entity.Property;
import com.zaffa.industrial.entity.User;
import com.zaffa.industrial.repository.PropertyRepository;
import com.zaffa.industrial.repository.UserRepository;

@Service
public class PropetyService {
	
	@Autowired
	private PropertyRepository propertyRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	
	public void save(Property property, String name) {
		User user = userRepository.findByName(name);
		property.setUploader(user);
		propertyRepository.save(property);
	}

	
}
