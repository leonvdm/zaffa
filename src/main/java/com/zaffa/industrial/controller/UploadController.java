package com.zaffa.industrial.controller;

import java.io.IOException;
import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.zaffa.industrial.entity.Image;
import com.zaffa.industrial.entity.Property;
import com.zaffa.industrial.service.ImageService;
import com.zaffa.industrial.service.PropertyService;

@Controller
public class UploadController {

	@Autowired
	private ImageService imageService;
	
	@Autowired
	private PropertyService propertyService;

//	 @ModelAttribute("property")
//	 public Property constructProperty() {
//		 return new Property();
//	 }

	static Logger log = Logger.getLogger(UploadController.class.getName());

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public @ResponseBody String upload( MultipartHttpServletRequest request, HttpServletResponse response, Principal principal) throws IOException {
		log.info("UPLOADING - POST");

		log.info("Street number: " + request.getParameter("streetNumber"));
		log.info("Street name: " + request.getParameter("streetName"));
		log.info("City: " + request.getParameter("city"));
		log.info("Province: " + request.getParameter("province"));
		log.info("Postal Code: " + request.getParameter("postalCode"));
		log.info("Country: " + request.getParameter("country"));
		log.info("longitude: " + request.getParameter("longitude"));
		log.info("longitude: " + request.getParameter("longitude"));

		log.info("propertyName: " + request.getParameter("propertyName"));
		log.info("description: " + request.getParameter("description"));
		log.info("plotSize: " + request.getParameter("plotSize"));
		log.info("buildingSize: " + request.getParameter("buildingSize"));
		log.info("dateConstructed: " + request.getParameter("dateConstructed"));

		Property property = persistProperty(request, principal);

		// Getting uploaded files from the request object
		Map<String, MultipartFile> fileMap = request.getFileMap();

		// Maintain a list to send back the files info. to the client side
		List<Image> uploadedFiles = new ArrayList<Image>();

		// Iterate through the map
		for (MultipartFile multipartFile : fileMap.values()) {

			Image image = setImageInfo(multipartFile);
			image.setProperty(property);

			// Save the file info to database
			imageService.save(image);

			// adding the file info to the list
			uploadedFiles.add(image);

			log.info("Added image to db: " + image.getName());
			log.info("Added image to db: " + image.getImageSize());
		}
		
		property.setImages(uploadedFiles);
		return "upload";
	}

	private Property persistProperty(HttpServletRequest request, Principal principal) {
		Property prop = new Property();
		log.info("STREET NUMBER: " + request.getParameter("streetNumber"));
		log.info("DATE: " + request.getParameter("dateConstructed"));
		prop.setStreetNumber(request.getParameter("streetNumber"));
		prop.setStreetName(request.getParameter("streetName"));
		prop.setCity(request.getParameter("city"));
		prop.setProvince(request.getParameter("province"));
		prop.setPostalCode(request.getParameter("postalCode"));
		prop.setCountry(request.getParameter("country"));
		
		if (request.getParameter("lattitude") != null && request.getParameter("lattitude").length() > 0) { 
			prop.setLattitude(Double.parseDouble(request.getParameter("lattitude")));
		}
		
		if (request.getParameter("longitude") != null && request.getParameter("longitude").length() > 0) {
			prop.setLongitude(Double.parseDouble(request.getParameter("longitude")));
		}

		prop.setPropertyName(request.getParameter("propertyName"));
		prop.setDescription(request.getParameter("description"));
		
		if (request.getParameter("plotSize") != null && request.getParameter("plotSize").length() > 0) {
			prop.setPlotSize(Integer.parseInt(request.getParameter("plotSize")));
		}
		
		if (request.getParameter("buildingSize") != null && request.getParameter("buildingSize").length() > 0) {
			prop.setBuildingSize(Integer.parseInt(request.getParameter("buildingSize")));
		}

		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		java.util.Date utilDate = null;
		if (request.getParameter("dateConstructed") != null && request.getParameter("dateConstructed").length() > 0) {
			try {
				log.info("parsing date: " + request.getParameter("dateConstructed"));
				utilDate = sdf.parse(request.getParameter("dateConstructed"));
				
			} catch (ParseException e) {
				log.error("Cannot parse this string to a date" + request.getParameter("dateConstructed"));
				e.printStackTrace();
			}
			
			if (utilDate != null) {
				prop.setDateConstructed(new java.sql.Date(utilDate.getTime()));
			}
		}

		propertyService.save(prop, principal.getName());
		
		log.info("Saved property with date: " + prop.getDateConstructed());
		
		return prop;
	}

	private Image setImageInfo(MultipartFile multipartFile) throws IOException {

		Image image = new Image();
		image.setName(multipartFile.getOriginalFilename());
		image.setImageSize(multipartFile.getSize());
		image.setContentType(multipartFile.getContentType());
		image.setImage(multipartFile.getBytes());

		return image;
	}

	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public String uploadGET() {
		log.info("UPLOADING - GET");
		return "upload";
	}
	
	@RequestMapping(value = "/uploadNoImages", method = RequestMethod.POST)
	public String uploadNoImages(HttpServletRequest request, HttpServletResponse response, Principal principal) {
		log.info("UPLOADING - AJAXPOST");
		
		log.info("Street number: " + request.getParameter("streetNumber"));
		log.info("Street name: " + request.getParameter("streetName"));
		log.info("City: " + request.getParameter("city"));
		log.info("Province: " + request.getParameter("province"));
		log.info("Postal Code: " + request.getParameter("postalCode"));
		log.info("Country: " + request.getParameter("country"));
		log.info("longitude: " + request.getParameter("longitude"));
		log.info("longitude: " + request.getParameter("longitude"));

		log.info("propertyName: " + request.getParameter("propertyName"));
		log.info("description: " + request.getParameter("description"));
		log.info("plotSize: " + request.getParameter("plotSize"));
		log.info("buildingSize: " + request.getParameter("buildingSize"));
		log.info("dateConstructed: " + request.getParameter("dateConstructed"));
		
		Property property = persistProperty(request, principal);
		log.info("Street number: " + property.getStreetNumber());
		return "upload";
	}
}
