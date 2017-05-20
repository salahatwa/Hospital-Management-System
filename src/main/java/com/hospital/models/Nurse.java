package com.hospital.models;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Employee")
@DiscriminatorValue("Nurse")
public class Nurse extends Employee implements Serializable {


	@ManyToMany(fetch = FetchType.EAGER, targetEntity = Room.class, cascade = { CascadeType.ALL })
	@JoinTable(name = "nurseID_roomID", joinColumns = { @JoinColumn(name = "nurse_id") }, inverseJoinColumns = {
			@JoinColumn(name = "room_id") })
	private List<Room> rooms = new ArrayList<>();

	public Nurse() {
	}

	

	/**
	 * @return the rooms
	 */
	public List<Room> getRooms() {
		return rooms;
	}

	/**
	 * @param rooms
	 *            the rooms to set
	 */
	public void setRooms(List<Room> rooms) {
		this.rooms = rooms;
	}

}
