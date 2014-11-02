package com.zaffa.industrial.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.zaffa.industrial.entity.Photo;
import com.zaffa.industrial.entity.Property;
import com.zaffa.industrial.entity.Role;
import com.zaffa.industrial.entity.RoleType;
import com.zaffa.industrial.entity.User;
import com.zaffa.industrial.repository.PhotoRepository;
import com.zaffa.industrial.repository.PropertyRepository;
import com.zaffa.industrial.repository.RoleRepository;
import com.zaffa.industrial.repository.UserRepository;

@Service
@Transactional
public class UserService {

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private PropertyRepository propertyRepository;
	
	@Autowired
	private RoleRepository roleRepository;
	
	@Autowired
	private PhotoRepository photoRepository;
	
	
	public List<User> findAll() {
		return userRepository.findAll();
	}

	public User findOne(int id) {
		return userRepository.findOne(id);
	}
	
	public void save(User user) {
		user.setEnabled(true);
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		user.setPassword(encoder.encode(user.getPassword()));
		
		List<Role> roles = new ArrayList<Role>();
		roles.add(roleRepository.findByName(RoleType.USER));
		user.setRoles(roles);
		
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
