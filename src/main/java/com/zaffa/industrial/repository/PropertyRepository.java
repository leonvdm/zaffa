package com.zaffa.industrial.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.zaffa.industrial.entity.Property;
import com.zaffa.industrial.entity.User;

public interface PropertyRepository extends JpaRepository<Property, Integer>{

	List<Property> findByUploader(User uploader);
}
