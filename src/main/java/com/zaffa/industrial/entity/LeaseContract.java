package com.zaffa.industrial.entity;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

/**
 * @author leonv
 *
 */
@Entity
public class LeaseContract {

	@Id
	@GeneratedValue
	private Integer id;
	
	private Date inceptionDate;
	
	@ManyToOne
	@JoinColumn(name="property_id")
	private Property leaseProperty;
	
	@OneToOne
	@JoinColumn(name="landLord_id")
	private User landLord;
	
	@OneToOne
	@JoinColumn(name="tenant_id")
	private User tenant;
	
	@OneToOne
	@JoinColumn(name="broker_id")
	private User broker;
	
	private Boolean isValid;
	
	private Date leaseEndDate;
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getInceptionDate() {
		return inceptionDate;
	}

	public void setInceptionDate(Date inceptionDate) {
		this.inceptionDate = inceptionDate;
	}

	public Property getLeaseProperty() {
		return leaseProperty;
	}

	public void setLeaseProperty(Property leaseProperty) {
		this.leaseProperty = leaseProperty;
	}

	public User getLandLord() {
		return landLord;
	}

	public void setLandLord(User landLord) {
		this.landLord = landLord;
	}

	public User getTenant() {
		return tenant;
	}

	public void setTenant(User tenant) {
		this.tenant = tenant;
	}

	public User getBroker() {
		return broker;
	}

	public void setBroker(User broker) {
		this.broker = broker;
	}

	public Boolean getIsValid() {
		return isValid;
	}

	public void setIsValid(Boolean isValid) {
		this.isValid = isValid;
	}

	public Date getLeaseEndDate() {
		return leaseEndDate;
	}

	public void setLeaseEndDate(Date leaseEndDate) {
		this.leaseEndDate = leaseEndDate;
	}
	
	
}
