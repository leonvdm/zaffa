package com.zaffa.industrial.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
import com.zaffa.industrial.service.ImageService;

@Controller
public class UploadController {
	
	@Autowired
	private ImageService imageService;
	
//	@ModelAttribute("property")
//	public Property constructProperty() {
//		return new Property();
//	}
	
	static Logger log = Logger.getLogger(UploadController.class.getName());
	
	@RequestMapping(value="/upload", method=RequestMethod.POST)
	public @ResponseBody String upload(MultipartHttpServletRequest request, HttpServletResponse response) throws IOException {
		log.info("UPLOADING - POST");
		//Getting uploaded files from the request object
		Map<String, MultipartFile> fileMap = request.getFileMap();
		
		// Maintain a list to send back the files info. to the client side
        List<Image> uploadedFiles = new ArrayList<Image>();

        // Iterate through the map
        for (MultipartFile multipartFile : fileMap.values()) {

               // Save the file to local disk
               //saveFileToLocalDisk(multipartFile);

               Image image = setImageInfo(multipartFile);

               // Save the file info to database
               imageService.save(image);

               // adding the file info to the list
               uploadedFiles.add(image);
               
               log.info("Added image to db: " + image.getName());
               log.info("Added image to db: " + image.getImageSize());
        }
        return "upload";
	}
		
	private Image setImageInfo(MultipartFile multipartFile) throws IOException {

     Image image = new Image();
     image.setName(multipartFile.getOriginalFilename());
     image.setImageSize(multipartFile.getSize());
     image.setContentType(multipartFile.getContentType());
     image.setImage(multipartFile.getBytes());

     return image;
}

	
	@RequestMapping(value="/upload", method=RequestMethod.GET)
	public String uploadGET() {
		log.info("UPLOADING - GET");
		return "upload";
	}
}
