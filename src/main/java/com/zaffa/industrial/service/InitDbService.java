package com.zaffa.industrial.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.zaffa.industrial.entity.Company;
import com.zaffa.industrial.entity.Photo;
import com.zaffa.industrial.entity.Property;
import com.zaffa.industrial.entity.PropertyType;
import com.zaffa.industrial.entity.Role;
import com.zaffa.industrial.entity.RoleType;
import com.zaffa.industrial.entity.User;
import com.zaffa.industrial.repository.CompanyRepository;
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
	private PhotoRepository photoRepository;

	@Autowired
	private PropertyRepository propertyRepository;

	@PostConstruct
	public void init() {
		if (roleRepository.findByName(RoleType.ADMIN) == null) {

			Role roleUser = new Role();
			roleUser.setName(RoleType.USER);
			roleRepository.save(roleUser);

			Role roleAdmin = new Role();
			roleAdmin.setName(RoleType.ADMIN);
			roleRepository.save(roleAdmin);

			Company com = new Company();
			com.setName("GROWTHPOINT");
			companyRepository.save(com);

			User userAdmin = new User();
			userAdmin.setEnabled(true);
			userAdmin.setFirstName("admin");
			userAdmin.setLastName("admin");
			userAdmin.setUserName("admin");
			userAdmin.setEmail("admin@zaffa.co");
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			userAdmin.setPassword(encoder.encode("admin"));
			List<Role> roles = new ArrayList<Role>();
			roles.add(roleUser);
			roles.add(roleAdmin);
			userAdmin.setRoles(roles);
			userAdmin.setCompany(com);
			userRepository.save(userAdmin);

			Property mercedes = new Property();
			mercedes.setType(PropertyType.FACTORY);
			mercedes.setName("Mercedes Factory");
			mercedes.setAvailableDate(java.sql.Date.valueOf("2015-01-01"));
			mercedes.setSqm(5000);
			mercedes.setIsAvailable(true);
			mercedes.setPricePerSqm(1000d);
			mercedes.setUploader(userAdmin);
			mercedes.setLattitude(-33.8904179);
			mercedes.setLongitude(18.51657320000004);
			propertyRepository.save(mercedes);

			Property absa = new Property();
			absa.setType(PropertyType.COMMERCIAL);
			absa.setName("ABSA Bank");
			absa.setAvailableDate(java.sql.Date.valueOf("2015-02-01"));
			absa.setSqm(2000);
			absa.setIsAvailable(true);
			absa.setPricePerSqm(2000d);
			absa.setUploader(userAdmin);
			absa.setLattitude(-33.8889364);
			absa.setLongitude(18.51798389999999);
			propertyRepository.save(absa);

			Photo one = new Photo();
			one.setDescription("Photo1");
			one.setUploadDate(java.sql.Date.valueOf("2015-01-01"));
			one.setProperty(mercedes);
			one.setUploader(userAdmin);
			photoRepository.save(one);

			Photo two = new Photo();
			two.setDescription("Photo2");
			two.setUploadDate(java.sql.Date.valueOf("2016-01-01"));
			two.setProperty(absa);
			two.setUploader(userAdmin);
			photoRepository.save(two);

			Photo three = new Photo();
			three.setDescription("Photo3");
			three.setUploadDate(java.sql.Date.valueOf("2014-01-01"));
			three.setProperty(absa);
			three.setUploader(userAdmin);
			photoRepository.save(three);

		}

	}

}
