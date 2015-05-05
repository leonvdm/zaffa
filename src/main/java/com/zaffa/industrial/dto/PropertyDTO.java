package com.zaffa.industrial.dto;

import java.sql.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.DateSerializer;
import com.zaffa.industrial.entity.Image;
import com.zaffa.industrial.entity.PropertyType;
import com.zaffa.industrial.entity.User;

public class PropertyDTO {

	private Integer id;

	private String streetNumber;
	
	private String streetName;

	private String city;

	private String province;

	private String postalCode;

	private String country;
	
	private Double longitude;

	private Double lattitude;
	
	private String name;
	
	private Double pricePerSqm;
	
	private String description;

	private Integer plotSize;
	
	private Integer buildingSize;
	
	private Date dateConstructed;

	private Boolean isAvailable;

	private Date availableDate;

	private String type;
	
	private List<Image> images;
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Double getLongitude() {
		return longitude;
	}

	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}

	public Double getLattitude() {
		return lattitude;
	}

	public void setLattitude(Double lattitude) {
		this.lattitude = lattitude;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


	public Boolean getIsAvailable() {
		return isAvailable;
	}

	public void setIsAvailable(Boolean isAvailable) {
		this.isAvailable = isAvailable;
	}

	@JsonSerialize(using = DateSerializer.class)
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
	
	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}
	
	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getStreetNumber() {
		return streetNumber;
	}

	public void setStreetNumber(String streetNumber) {
		this.streetNumber = streetNumber;
	}

	public String getStreetName() {
		return streetName;
	}

	public void setStreetName(String streetName) {
		this.streetName = streetName;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public Integer getPlotSize() {
		return plotSize;
	}

	public void setPlotSize(Integer plotSize) {
		this.plotSize = plotSize;
	}

	public Date getDateConstructed() {
		return dateConstructed;
	}

	public void setDateConstructed(Date dateConstructed) {
		this.dateConstructed = dateConstructed;
	}

	public Integer getBuildingSize() {
		return buildingSize;
	}

	public void setBuildingSize(Integer buildingSize) {
		this.buildingSize = buildingSize;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public List<Image> getImages() {
		return images;
	}

	public void setImages(List<Image> images) {
		this.images = images;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

}
