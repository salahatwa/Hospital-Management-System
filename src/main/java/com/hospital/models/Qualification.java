package com.hospital.models;
// Generated Apr 26, 2017 7:53:39 PM by Hibernate Tools 4.3.1

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Qualifications")
public class Qualification implements java.io.Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "qualId")
	private Integer qualId;

	private String instituteName;
	private String qualificationDate;
	private String qualificationName;
	private String degree;

	public Qualification() {
	}

	public Integer getQualId() {
		return this.qualId;
	}

	public void setQualId(Integer qualId) {
		this.qualId = qualId;
	}

	public String getInstituteName() {
		return this.instituteName;
	}

	public void setInstituteName(String instituteName) {
		this.instituteName = instituteName;
	}

	public String getQualificationDate() {
		return this.qualificationDate;
	}

	public void setQualificationDate(String qualificationDate) {
		this.qualificationDate = qualificationDate;
	}

	public String getQualificationName() {
		return this.qualificationName;
	}

	public void setQualificationName(String qualificationName) {
		this.qualificationName = qualificationName;
	}

	public String getDegree() {
		return degree;
	}

	public void setDegree(String degree) {
		this.degree = degree;
	}

	

}
