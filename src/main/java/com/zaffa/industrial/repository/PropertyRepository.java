package com.zaffa.industrial.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.zaffa.industrial.entity.Property;

public interface PropertyRepository extends JpaRepository<Property, Integer>{

}
