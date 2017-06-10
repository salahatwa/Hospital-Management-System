package com.hospital.models;


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
@Table(name = "Rooms")
public class Room implements java.io.Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "roomId")
	private Integer roomId;
        
        private int roomNumber;

	private int numberOfBeds;
	
	
	private int numberOfAvailableBeds;
	
	

	@OneToOne(fetch = FetchType.EAGER, orphanRemoval=false,targetEntity = RoomType.class,cascade = javax.persistence.CascadeType.REMOVE)

	@JoinColumn(name = "roomType_id", referencedColumnName = "roomTypeId")
	private RoomType roomType;

	public Room() {
	}

	public Integer getRoomId() {
		return this.roomId;
	}

	public void setRoomId(Integer roomId) {
		this.roomId = roomId;
	}

	public RoomType getRoomType() {
		return this.roomType;
	}

	public void setRoomType(RoomType roomType) {
		this.roomType = roomType;
	}

	public int getNumberOfBeds() {
		return this.numberOfBeds;
	}

	public void setNumberOfBeds(int numberOfBeds) {
		this.numberOfBeds = numberOfBeds;
	}

	public int getNumberOfAvailableBeds() {
		return this.numberOfAvailableBeds;
	}

	public void setNumberOfAvailableBeds(int numberOfAvailableBeds) {
		this.numberOfAvailableBeds = numberOfAvailableBeds;
	}

    /**
     * @return the roomNumber
     */
    public int getRoomNumber() {
        return roomNumber;
    }

    /**
     * @param roomNumber the roomNumber to set
     */
    public void setRoomNumber(int roomNumber) {
        this.roomNumber = roomNumber;
    }

}
