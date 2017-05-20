package com.hospital.models;
// Generated Apr 26, 2017 7:53:39 PM by Hibernate Tools 4.3.1

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

@Entity
@Table(name = "Employee")
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "type", discriminatorType = DiscriminatorType.STRING)
@DiscriminatorValue(value = "Admin")
public class Employee implements java.io.Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "employeeId")
	private Integer employeeId;

	@Column(name = "type", insertable = false, updatable = false)
	private String type;
	
	private String address;
	
	@Temporal(TemporalType.DATE)
	private Date dob;
	
	@Column(name="email" , unique=true)
	private String email;
	
	private String firstName;
	private String fatherName;
	private String familyName;

	private String gender;
        @Temporal(javax.persistence.TemporalType.DATE)
	private Date joinDate;

	private String password;
	private String username;

	@Lob
	private String photo;

	private String phone;

	@OneToOne(fetch = FetchType.EAGER,targetEntity = Category.class, cascade = {CascadeType.ALL})
	@JoinColumn(name = "CATEGORY_ID")
	private Category category;

	@OneToMany(fetch = FetchType.EAGER , targetEntity = WorkExperince.class, cascade = { CascadeType.ALL  })
	@JoinColumn(name = "employee_id")
	private List<WorkExperince> workExperinces=new ArrayList<>();

	@OneToMany(fetch = FetchType.EAGER, targetEntity = Qualification.class, cascade = { CascadeType.ALL })
	@JoinColumn(name = "employee_id")
	private List<Qualification> qualifications=new ArrayList<>();

	public Employee() {
	}

	public Integer getEmployeeId() {
		return this.employeeId;
	}

	public void setEmployeeId(Integer employeeId) {
		this.employeeId = employeeId;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
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

	public Date getJoinDate() {
		return this.joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}


	public String getPhoto() {
		return this.photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public List<WorkExperince> getWorkExperinces() {
		return workExperinces;
	}

	public void setWorkExperinces(List<WorkExperince> workExperinces) {
		this.workExperinces = workExperinces;
	}

	public List<Qualification> getQualifications() {
		return qualifications;
	}

	public void setQualifications(List<Qualification> qualifications) {
		this.qualifications = qualifications;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	

}
