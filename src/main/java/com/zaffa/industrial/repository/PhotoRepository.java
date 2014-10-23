package com.zaffa.industrial.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.zaffa.industrial.entity.Photo;
import com.zaffa.industrial.entity.Property;

public interface PhotoRepository extends JpaRepository<Photo, Integer>{

	List<Photo> findByProperty(Property property);
}
