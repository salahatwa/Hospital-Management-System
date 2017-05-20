package com.hospital.models;
// Generated Apr 26, 2017 7:53:39 PM by Hibernate Tools 4.3.1

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
@Table(name = "BookBeds")
public class BookBed implements java.io.Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "bedId")
	private Integer bedId;
	private Date datePlaced;
	private String departement;
	private boolean status;

	@OneToOne(fetch = FetchType.EAGER, targetEntity = Patient.class, cascade = CascadeType.ALL)
	@JoinColumn(name = "patient_id")
	private Patient patient;

	@OneToOne(fetch = FetchType.EAGER, targetEntity = Room.class, cascade = CascadeType.ALL)
	@JoinColumn(name = "room_id")
	private Room room;

	public BookBed() {
	}


	public Integer getBedId() {
		return this.bedId;
	}

	public void setBedId(Integer bedId) {
		this.bedId = bedId;
	}

	public Patient getPatient() {
		return this.patient;
	}

	public void setPatient(Patient patient) {
		this.patient = patient;
	}

	public Room getRoom() {
		return this.room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

	

	public Date getDatePlaced() {
		return this.datePlaced;
	}

	public void setDatePlaced(Date datePlaced) {
		this.datePlaced = datePlaced;
	}

	public String getDepartement() {
		return this.departement;
	}

	public void setDepartement(String departement) {
		this.departement = departement;
	}


	public boolean isStatus() {
		return status;
	}


	public void setStatus(boolean status) {
		this.status = status;
	}


	

}
