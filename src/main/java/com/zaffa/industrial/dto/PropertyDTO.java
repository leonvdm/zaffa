package com.zaffa.industrial.dto;

import java.sql.Date;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.DateSerializer;

public class PropertyDTO {

	private Integer id;

	private String name;

	private String street_number;

	private String route;

	private String locality;

	private String province;

	private String postal_code;

	private String country;

	private Integer sqm;

	private Boolean isAvailable;

	private Date availableDate;

	private Double pricePerSqm;

	private Double longitude;

	private Double lattitude;

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

	public String getStreet_number() {
		return street_number;
	}

	public void setStreet_number(String street_number) {
		this.street_number = street_number;
	}

	public String getRoute() {
		return route;
	}

	public void setRoute(String route) {
		this.route = route;
	}

	public String getLocality() {
		return locality;
	}

	public void setLocality(String locality) {
		this.locality = locality;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getPostal_code() {
		return postal_code;
	}

	public void setPostal_code(String postal_code) {
		this.postal_code = postal_code;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

}
