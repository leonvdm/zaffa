package com.zaffa.industrial.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;

import com.zaffa.industrial.annotation.UniqueUsername;

@Entity
@Table(name="users")
public class User {

	@Id
	@GeneratedValue
	private Integer id;
	
	@Size(min=3, message = "Name must be at least 3 characters!")
	@Column(unique = true)
	@UniqueUsername(message="Username already exits!")
	private String name;

	@Size(min=1, message = "Invalid email address!")
	@Email(message = "Name must be at least 3 characters!")
	private String email;
	
	@Size(min=3, message = "Name must be at least 5 characters!")
	private String password;
	
	
	private String mobile;
	
	private boolean enabled;
	
	@OneToMany(mappedBy="uploader", cascade=CascadeType.REMOVE)
	private List<Property> properties;
	
	@ManyToMany
	@JoinTable
	private List<Role> roles;
	
	@Enumerated(EnumType.STRING)
	private UserType type;
	
	@ManyToOne
	@JoinColumn(name = "company_id")
	private Company company;
	
	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public UserType getType() {
		return type;
	}

	public void setType(UserType type) {
		this.type = type;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public List<Property> getProperties() {
		return properties;
	}

	public void setProperties(List<Property> properties) {
		this.properties = properties;
	}

	
	
	
	
}
