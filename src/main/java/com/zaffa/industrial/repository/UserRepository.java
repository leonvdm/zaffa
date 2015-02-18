package com.zaffa.industrial.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.zaffa.industrial.entity.User;

public interface UserRepository extends JpaRepository<User, Integer>{

	User findByUserName(String userName);
	
}
