package com.zaffa.industrial.entity;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Image {

	@Id
	@GeneratedValue
	private Integer id;
	
	private String description;
	
	private Date uploadDate;
	
	@ManyToOne()
	@JoinColumn(name="uploader_id")
	private User uploader;
	
	@ManyToOne()
	@JoinColumn(name="property_id")
	private Property property;
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public Property getProperty() {
		return property;
	}

	public void setProperty(Property property) {
		this.property = property;
	}

	public User getUploader() {
		return uploader;
	}

	public void setUploader(User uploader) {
		this.uploader = uploader;
	}
	
	
	
}
