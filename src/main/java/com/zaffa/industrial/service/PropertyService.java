package com.zaffa.industrial.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.method.P;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;

import com.zaffa.industrial.dto.PropertyDTO;
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
		User user = userRepository.findByUserName(name);
		property.setUploader(user);
		propertyRepository.save(property);
	}


	public void delete(int id) {
		propertyRepository.delete(id);
		
	}


	public Property findOne(int id) {
		return propertyRepository.findOne(id);
	}
	
	public List<Property> findAll() {
		return propertyRepository.findAll();
	}


	@PreAuthorize("#property.uploader.userName == authentication.name or hasRole('ADMIN')")
	public void delete(@P("property") Property prop) {
		propertyRepository.delete(prop);
		
	}

	public List<PropertyDTO> findAllDTOs() {
		List<Property> props = findAll();
		List<PropertyDTO> dtos = new ArrayList<PropertyDTO>();
		PropertyDTOMapper mapper = new PropertyDTOMapper();
		
		for (Property property : props) {
			dtos.add(mapper.mapPropertyToDTO(property));
		}
		
		return dtos;		
	}
	
	class PropertyDTOMapper {
		private PropertyDTO mapPropertyToDTO(Property property) {
			PropertyDTO dto = new PropertyDTO();
			dto.setId(property.getId());
			dto.setStreetNumber(property.getStreetNumber());
			dto.setStreetName(property.getStreetName());
			dto.setCity(property.getCity());
			dto.setProvince(property.getProvince());
			dto.setPostalCode(property.getPostalCode());
			dto.setCountry(property.getCountry());
			dto.setLongitude(property.getLongitude());
			dto.setLattitude(property.getLattitude());
			
			dto.setPropertyName(property.getPropertyName());
			dto.setPlotSize(property.getPlotSize());
			dto.setBuildingSize(property.getBuildingSize());
			dto.setIsAvailable(property.getIsAvailable());
			dto.setAvailableDate(property.getAvailableDate());
			dto.setPricePerSqm(property.getPricePerSqm());
			dto.setDateConstructed(property.getDateConstructed());
			
			return dto;
		}
	}

	
}
