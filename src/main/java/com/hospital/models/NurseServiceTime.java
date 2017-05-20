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

@Entity
@Table(name = "NursesServiceTimes")
public class NurseServiceTime {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "nurseServiceTimeID")
	private int nurseServiceTimeID;
	
	private Date serviceDate;
	
	@OneToOne(fetch = FetchType.EAGER,targetEntity = ShiftTime.class, cascade = {CascadeType.ALL})
	@JoinColumn(name = "shiftTime_id")
	private ShiftTime shiftTime;
	
	@OneToOne(fetch = FetchType.EAGER,targetEntity = Nurse.class, cascade = {CascadeType.ALL})
	@JoinColumn(name = "nurse_id")
	private Nurse nurse;
	
	
	private String department;

	public int getNurseServiceTimeID() {
		return nurseServiceTimeID;
	}

	public void setNurseServiceTimeID(int nurseServiceTimeID) {
		this.nurseServiceTimeID = nurseServiceTimeID;
	}

	public Date getServiceDate() {
		return serviceDate;
	}

	public void setServiceDate(Date serviceDate) {
		this.serviceDate = serviceDate;
	}

	public ShiftTime getShiftTime() {
		return shiftTime;
	}

	public void setShiftTime(ShiftTime shiftTime) {
		this.shiftTime = shiftTime;
	}

	public Nurse getNurse() {
		return nurse;
	}

	public void setNurse(Nurse nurse) {
		this.nurse = nurse;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

}
