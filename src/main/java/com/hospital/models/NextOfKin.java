package com.hospital.models;
// Generated Apr 26, 2017 7:53:39 PM by Hibernate Tools 4.3.1

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "NextOfKin")
public class NextOfKin implements java.io.Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "nextOfKinId")
	private Integer nextOfKinId;
	
	private String address;
	private String fullName;
	private String phone;
	private String relationship;


	public NextOfKin() {
	}

	public Integer getNextOfKinId() {
		return this.nextOfKinId;
	}

	public void setNextOfKinId(Integer nextOfKinId) {
		this.nextOfKinId = nextOfKinId;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getFullName() {
		return this.fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getRelationship() {
		return this.relationship;
	}

	public void setRelationship(String relationship) {
		this.relationship = relationship;
	}

}
