package com.zaffa.industrial.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zaffa.industrial.entity.Photo;
import com.zaffa.industrial.entity.Property;
import com.zaffa.industrial.entity.User;
import com.zaffa.industrial.repository.PhotoRepository;
import com.zaffa.industrial.repository.PropertyRepository;
import com.zaffa.industrial.repository.UserRepository;

@Service
@Transactional
public class UserService {

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private PropertyRepository propertyRepository;
	
	@Autowired
	private PhotoRepository photoRepository;
	
	
	public List<User> findAll() {
		return userRepository.findAll();
	}

	public User findOne(int id) {
		return userRepository.findOne(id);
	}
	
	public void save(User user) {
		userRepository.save(user);
	}

	@Transactional
	public User findOneWithPhotos(int id) {
		User user = findOne(id);
		
		List<Property> properties = propertyRepository.findByUploader(user);
		
		for (Property property : properties) {
			List<Photo> photos = photoRepository.findByProperty(property);
			property.setPhotos(photos);
		}
		user.setProperties(properties);
		
		return user;
	}
}
