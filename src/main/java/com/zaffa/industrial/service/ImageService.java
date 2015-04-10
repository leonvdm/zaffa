package com.zaffa.industrial.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zaffa.industrial.entity.Image;
import com.zaffa.industrial.repository.ImageRepository;

@Service
public class ImageService {
	
	@Autowired
	private ImageRepository imageRepository;

	public void save(Image image) {
		imageRepository.save(image);
	}
}
