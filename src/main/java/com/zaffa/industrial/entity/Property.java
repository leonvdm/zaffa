package com.zaffa.industrial.entity;

import java.sql.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Property {

	@Id
	@GeneratedValue
	private Integer id;
	
	private String name;
	
	private Integer sqm;
	
	private Boolean isAvailable;
	
	private Date availableDate;
	
	private Double pricePerSqm;
	
	@Enumerated(EnumType.STRING)
	private PropertyType type;
	
	@OneToMany(mappedBy="leaseProperty")
	private List<LeaseContract> leaseContracts;
	
	@OneToMany(mappedBy="property")
	private List<Photo> photos;
	
	@ManyToOne
	@JoinColumn(name="property_id")
	private User uploader;
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public PropertyType getType() {
		return type;
	}

	public void setType(PropertyType type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getSqm() {
		return sqm;
	}

	public void setSqm(Integer sqm) {
		this.sqm = sqm;
	}

	public Boolean getIsAvailable() {
		return isAvailable;
	}

	public void setIsAvailable(Boolean isAvailable) {
		this.isAvailable = isAvailable;
	}

	public Date getAvailableDate() {
		return availableDate;
	}

	public void setAvailableDate(Date availableDate) {
		this.availableDate = availableDate;
	}

	public Double getPricePerSqm() {
		return pricePerSqm;
	}

	public void setPricePerSqm(Double pricePerSqm) {
		this.pricePerSqm = pricePerSqm;
	}

	public List<LeaseContract> getLeaseContracts() {
		return leaseContracts;
	}

	public void setLeaseContracts(List<LeaseContract> leaseContracts) {
		this.leaseContracts = leaseContracts;
	}

	public List<Photo> getPhotos() {
		return photos;
	}

	public void setPhotos(List<Photo> photos) {
		this.photos = photos;
	}

	public User getUploader() {
		return uploader;
	}

	public void setUploader(User uploader) {
		this.uploader = uploader;
	}
	
}
