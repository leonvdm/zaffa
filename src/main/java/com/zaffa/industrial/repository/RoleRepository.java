package com.zaffa.industrial.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.zaffa.industrial.entity.Role;
import com.zaffa.industrial.entity.RoleType;

public interface RoleRepository extends JpaRepository<Role, Integer>{

	Role findByName(RoleType name);
}
