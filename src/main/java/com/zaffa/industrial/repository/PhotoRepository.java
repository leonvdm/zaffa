package com.zaffa.industrial.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.zaffa.industrial.entity.Image;
import com.zaffa.industrial.entity.Property;

public interface PhotoRepository extends JpaRepository<Image, Integer>{

	List<Image> findByProperty(Property property);
}
