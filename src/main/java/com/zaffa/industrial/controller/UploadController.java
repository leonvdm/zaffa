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

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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

	// @ModelAttribute("property")
	// public Property constructProperty() {
	// return new Property();
	// }

	static Logger log = Logger.getLogger(UploadController.class.getName());

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public @ResponseBody String upload(MultipartHttpServletRequest request, HttpServletResponse response, Principal principal) throws IOException {
		log.info("UPLOADING - POST");
		log.info("Street number: " + request.getParameter("street_number"));
		log.info("Street name: " + request.getParameter("street_name"));
		log.info("City: " + request.getParameter("city"));
		log.info("Province: " + request.getParameter("province"));
		log.info("Postal Code: " + request.getParameter("postal_code"));
		log.info("Country: " + request.getParameter("country"));
		log.info("Lat: " + request.getParameter("lat"));
		log.info("Lng: " + request.getParameter("lng"));

		log.info("property_name: " + request.getParameter("property_name"));
		log.info("property_description: "
				+ request.getParameter("property_description"));
		log.info("plot_size: " + request.getParameter("plot_size"));
		log.info("building_size: " + request.getParameter("building_size"));
		log.info("building_date: " + request.getParameter("building_date"));

		Property property = persistProperty(request, principal);


		// Getting uploaded files from the request object
		Map<String, MultipartFile> fileMap = request.getFileMap();

		// Maintain a list to send back the files info. to the client side
		List<Image> uploadedFiles = new ArrayList<Image>();

		// Iterate through the map
		for (MultipartFile multipartFile : fileMap.values()) {

			// Save the file to local disk
			// saveFileToLocalDisk(multipartFile);

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

	private Property persistProperty(MultipartHttpServletRequest request, Principal principal) {
		Property prop = new Property();
		prop.setStreetNumber(request.getParameter("street_number"));
		prop.setStreetName(request.getParameter("street_name"));
		prop.setCity(request.getParameter("city"));
		prop.setProvince(request.getParameter("province"));
		prop.setPostalCode(request.getParameter("postal_code"));
		prop.setCountry(request.getParameter("country"));
		
		if (request.getParameter("lat") != null && request.getParameter("lat").length() > 0) { 
			prop.setLattitude(Double.parseDouble(request.getParameter("lat")));
		}
		
		if (request.getParameter("lng") != null && request.getParameter("lng").length() > 0) {
			prop.setLongitude(Double.parseDouble(request.getParameter("lng")));
		}

		prop.setName(request.getParameter("property_name"));
		prop.setDescription(request.getParameter("property_description"));
		
		if (request.getParameter("plot_size") != null && request.getParameter("plot_size").length() > 0) {
			prop.setPlotSize(Integer.parseInt(request.getParameter("plot_size")));
		}
		
		if (request.getParameter("building_size") != null && request.getParameter("building_size").length() > 0) {
			prop.setBuildingSize(Integer.parseInt(request.getParameter("building_size")));
		}

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date utilDate = null;
		if (request.getParameter("building_date") != null && request.getParameter("building_date").length() > 0) {
			try {
				utilDate = sdf.parse(request.getParameter("building_date"));
			} catch (ParseException e) {
				log.error("Cannot parse this string to a date"
						+ request.getParameter("building_date"));
				e.printStackTrace();
			}
			
			if (utilDate != null) {
				prop.setDateConstructed(new java.sql.Date(utilDate.getTime()));
			}
		}

		propertyService.save(prop, principal.getName());
		
		log.info("Saved property");
		
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
	
	@RequestMapping(value = "/uploadME", method = RequestMethod.POST)
	public String uploadMe(HttpServletRequest request, HttpServletResponse response) {
		log.info("UPLOADING - AJAXPOST");
		log.info("Street number: " + request.getParameter("street_number"));
		return "contact";
	}
}
