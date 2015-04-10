package com.zaffa.industrial.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;

@Controller
public class ImageController {
	
	static Logger log = LoggerFactory.getLogger(ImageController.class);
	
//	@Autowired
//	ImageService imageService;
//	
//    @RequestMapping(value = "/upload", method = RequestMethod.GET)
//    public @ResponseBody Map list() {
//        log.debug("uploadGet called");
//        
//        Map<String, Object> files = new HashMap<>();
//        
//        log.debug("Returning: {}", files);
//        return files;
//    }
//    
//    @RequestMapping(value = "/upload", method = RequestMethod.POST)
//    public @ResponseBody Map upload(MultipartHttpServletRequest request, HttpServletResponse response) {
//        log.debug("uploadPost called");
//        Iterator<String> itr = request.getFileNames();
//        MultipartFile mpf;
//        List<Image> list = new LinkedList<>();
//        
//        while (itr.hasNext()) {
//            mpf = request.getFile(itr.next());
//            log.debug("Uploading {}", mpf.getOriginalFilename());
//            
//            String contentType = mpf.getContentType();
//           
//            //mpf.transferTo(newFile);
//            
//            //BufferedImage thumbnail = Scalr.resize(ImageIO.read(newFile), 290);
//            //String thumbnailFilename = newFilenameBase + "-thumbnail.png";
//            //File thumbnailFile = new File(storageDirectory + "/" + thumbnailFilename);
//            //ImageIO.write(thumbnail, "png", thumbnailFile);
//            
//            Image image = new Image();
//            image.setName(mpf.getOriginalFilename());
//            //image.setThumbnailFilename(thumbnailFilename);
//            //image.setNewFilename(newFilename);
//            image.setContentType(contentType);
//            image.setImageSize(mpf.getSize());
//            //image.setThumbnailSize(thumbnailFile.length());
//            image.setUploadDate(new Date(System.currentTimeMillis()));
//            User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//            image.setUploader(user);
//            list.add(image);
//        }
//        
//        Map<String, Object> files = new HashMap<>();
//        files.put("files", list);
//        return files;
//    }
    
//    @RequestMapping(value = "/picture/{id}", method = RequestMethod.GET)
//    public void picture(HttpServletResponse response, @PathVariable Long id) {
//        Image image = imageDao.get(id);
//        File imageFile = new File(fileUploadDirectory+"/"+image.getNewFilename());
//        response.setContentType(image.getContentType());
//        response.setContentLength(image.getSize().intValue());
//        try {
//            InputStream is = new FileInputStream(imageFile);
//            IOUtils.copy(is, response.getOutputStream());
//        } catch(IOException e) {
//            log.error("Could not show picture "+id, e);
//        }
//    }
    
//    @RequestMapping(value = "/thumbnail/{id}", method = RequestMethod.GET)
//    public void thumbnail(HttpServletResponse response, @PathVariable Long id) {
//        Image image = imageDao.get(id);
//        File imageFile = new File(fileUploadDirectory+"/"+image.getThumbnailFilename());
//        response.setContentType(image.getContentType());
//        response.setContentLength(image.getThumbnailSize().intValue());
//        try {
//            InputStream is = new FileInputStream(imageFile);
//            IOUtils.copy(is, response.getOutputStream());
//        } catch(IOException e) {
//            log.error("Could not show thumbnail "+id, e);
//        }
//    }
//    
//    @RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE)
//    public @ResponseBody List delete(@PathVariable Long id) {
//        Image image = imageDao.get(id);
//        File imageFile = new File(fileUploadDirectory+"/"+image.getNewFilename());
//        imageFile.delete();
//        File thumbnailFile = new File(fileUploadDirectory+"/"+image.getThumbnailFilename());
//        thumbnailFile.delete();
//        imageDao.delete(image);
//        List<Map<String, Object>> results = new ArrayList<>();
//        Map<String, Object> success = new HashMap<>();
//        success.put("success", true);
//        results.add(success);
//        return results;
//    }
	

}
