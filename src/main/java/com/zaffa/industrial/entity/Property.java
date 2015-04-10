package com.zaffa.industrial.entity;

import java.sql.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.constraints.Size;

//import com.vividsolutions.jts.geom.Point;

@Entity
public class Property {

	@Id
	@GeneratedValue
	private Integer id;
	
	@Size(min=3, message = "Name must be at least 3 characters!")
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
	
//	@Column(name="Point")
//	@Type(type="org.hibernate.spatial.GeometryType")
//    private Point point;
	
	private Double longitude;
	
	private Double lattitude;
	
	@Enumerated(EnumType.STRING)
	private PropertyType type;
	
	@OneToMany(mappedBy="property", cascade=CascadeType.REMOVE)
	private List<Image> images;
	
	@ManyToOne
	@JoinColumn(name="property_id")
	private User uploader;
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
//	public Point getPoint() {
//		return point;
//	}
//
//	public void setPoint(Point point) {
//		this.point = point;
//	}

	public PropertyType getType() {
		return type;
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

	public List<Image> getImages() {
		return images;
	}

	public void setImages(List<Image> images) {
		this.images = images;
	}

	public User getUploader() {
		return uploader;
	}

	public void setUploader(User uploader) {
		this.uploader = uploader;
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
