package com.hospital.models;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "Patients")
public class Patient implements java.io.Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "patientId")
	private Integer patientId;
	
	private String address;
	private int age;
	
	@Temporal(TemporalType.DATE)
	private Date dob;
	
	private String email;
	private String familyName;
	private String fatherName;
	private String gender;
	private Date joiningDate;
	private String name;
	private long phone;
	
	
	@OneToOne(fetch = FetchType.EAGER,targetEntity = BloodGroup.class,cascade = CascadeType.ALL)
    @JoinColumn(name = "bloodGroup_id")
	private BloodGroup bloodGroup;
	
	@OneToOne(fetch = FetchType.EAGER,targetEntity = NextOfKin.class,cascade = CascadeType.ALL)
    @JoinColumn(name = "nextOfKin_id")
	private NextOfKin nextOfKin;
	
	

	public Patient() {
	}

	public Patient(int age, long phone) {
		this.age = age;
		this.phone = phone;
	}



	public Integer getPatientId() {
		return this.patientId;
	}

	public void setPatientId(Integer patientId) {
		this.patientId = patientId;
	}

	public BloodGroup getBloodGroup() {
		return this.bloodGroup;
	}

	public void setBloodGroup(BloodGroup bloodGroup) {
		this.bloodGroup = bloodGroup;
	}


	public NextOfKin getNextOfKin() {
		return this.nextOfKin;
	}

	public void setNextOfKin(NextOfKin nextOfKin) {
		this.nextOfKin = nextOfKin;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getAge() {
		return this.age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public Date getDob() {
		return this.dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFamilyName() {
		return this.familyName;
	}

	public void setFamilyName(String familyName) {
		this.familyName = familyName;
	}

	public String getFatherName() {
		return this.fatherName;
	}

	public void setFatherName(String fatherName) {
		this.fatherName = fatherName;
	}

	public String getGender() {
		return this.gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getJoiningDate() {
		return this.joiningDate;
	}

	public void setJoiningDate(Date joiningDate) {
		this.joiningDate = joiningDate;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public long getPhone() {
		return this.phone;
	}

	public void setPhone(long phone) {
		this.phone = phone;
	}

	

}
