package com.zaffa.industrial.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zaffa.industrial.entity.Property;
import com.zaffa.industrial.entity.PropertyType;
import com.zaffa.industrial.entity.Role;
import com.zaffa.industrial.entity.RoleType;
import com.zaffa.industrial.entity.User;
import com.zaffa.industrial.repository.CompanyRepository;
import com.zaffa.industrial.repository.LeaseContractRepository;
import com.zaffa.industrial.repository.PhotoRepository;
import com.zaffa.industrial.repository.PropertyRepository;
import com.zaffa.industrial.repository.RoleRepository;
import com.zaffa.industrial.repository.UserRepository;

@Transactional
@Service
public class InitDbService {
	
	@Autowired
	private RoleRepository roleRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private CompanyRepository companyRepository;
	
	@Autowired
	private LeaseContractRepository leaseContractRepository;
	
	@Autowired
	private PhotoRepository photoRepository;
	
	@Autowired
	private PropertyRepository propertyRepository;
	
	@PostConstruct
	public void init() {
		Role roleUser = new Role();
		roleUser.setType(RoleType.USER);
		roleRepository.save(roleUser);
		
		Role roleAdmin = new Role();
		roleAdmin.setType(RoleType.ADMIN);
		roleRepository.save(roleAdmin);
		
		User userAdmin = new User();
		userAdmin.setName("admin");
		List<Role> roles = new ArrayList<Role>();
		roles.add(roleUser);
		roles.add(roleAdmin);
		userAdmin.setRoles(roles);
		userRepository.save(userAdmin);
		
		Property mercedes = new Property();
		mercedes.setType(PropertyType.FACTORY);
		mercedes.setName("Mercedes Factory");
		mercedes.setAvailableDate(java.sql.Date.valueOf("2015-01-01"));
		mercedes.setSqm(5000);
		mercedes.setIsAvailable(true);
		mercedes.setPricePerSqm(1000d);
		propertyRepository.save(mercedes);
		
		Property absa = new Property();
		absa.setType(PropertyType.COMMERCIAL);
		absa.setName("ABSA Bank");
		absa.setAvailableDate(java.sql.Date.valueOf("2015-02-01"));
		absa.setSqm(2000);
		absa.setIsAvailable(true);
		absa.setPricePerSqm(2000d);
		propertyRepository.save(absa);
		
	}

}
