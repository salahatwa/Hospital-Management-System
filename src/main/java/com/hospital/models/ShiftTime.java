package com.hospital.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "ShiftTimes")
public class ShiftTime {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "shiftTimeID")
	private int shiftTimeID;

	private String fromTime;

	private String toTime;

	public int getShiftTimeID() {
		return shiftTimeID;
	}

	public void setShiftTimeID(int shiftTimeID) {
		this.shiftTimeID = shiftTimeID;
	}

	public String getFromTime() {
		return fromTime;
	}

	public void setFromTime(String fromTime) {
		this.fromTime = fromTime;
	}

	public String getToTime() {
		return toTime;
	}

	public void setToTime(String toTime) {
		this.toTime = toTime;
	}


}
