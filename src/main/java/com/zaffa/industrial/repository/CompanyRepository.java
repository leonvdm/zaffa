package com.zaffa.industrial.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.zaffa.industrial.entity.Company;

public interface CompanyRepository extends JpaRepository<Company, Integer>{

}
