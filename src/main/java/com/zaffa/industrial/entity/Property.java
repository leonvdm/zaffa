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
	
	private String streetNumber;
	
	private String streetName;
	
	private String city;
	
	private String province;
	
	private String postalCode;
	
	private String country;
	
	@Size(min=3, message = "Name must be at least 3 characters!")
	private String name;
	
	private String description;
	
	private Integer plotSize;
	
	private Integer buildingSize;
	
	private Date dateConstructed;
	
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

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
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

	public Integer getBuildingSize() {
		return buildingSize;
	}

	public void setBuildingSize(Integer buildingSize) {
		this.buildingSize = buildingSize;
	}

	public Date getDateConstructed() {
		return dateConstructed;
	}

	public void setDateConstructed(Date dateConstructed) {
		this.dateConstructed = dateConstructed;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}
	
	
}
