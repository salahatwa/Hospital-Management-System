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

@Entity
@Table(name = "SelledDrugs")
public class SelledDrug {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "selledDrugID")
	private int selledDrugID;
        
        
        @Temporal(javax.persistence.TemporalType.DATE)
        private Date startDate;
	
        @Temporal(javax.persistence.TemporalType.DATE)
        private Date endDate;
        
	@OneToOne(fetch = FetchType.EAGER,targetEntity = Drug.class, cascade = {CascadeType.ALL})
	@JoinColumn(name = "Drug_ID")
	private Drug drug;
	
	@OneToOne(fetch = FetchType.EAGER,targetEntity = Pharmatiest.class, cascade = {CascadeType.ALL})
	@JoinColumn(name = "pharmatiest_ID")
	private Pharmatiest pharmatiest;
	
	@OneToOne(fetch = FetchType.EAGER,targetEntity = Patient.class, cascade = {CascadeType.ALL})
	@JoinColumn(name = "patient_ID")
	private Patient patient;
	
	private int quantity;
	
        @Temporal(javax.persistence.TemporalType.DATE)
	private Date selledDate;

	
	

	public Patient getPatient() {
		return patient;
	}

	public void setPatient(Patient patient) {
		this.patient = patient;
	}

	public Pharmatiest getPharmatiest() {
		return pharmatiest;
	}

	public void setPharmatiest(Pharmatiest pharmatiest) {
		this.pharmatiest = pharmatiest;
	}

	public Drug getDrug() {
		return drug;
	}

	public void setDrug(Drug drug) {
		this.drug = drug;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getSelledDrugID() {
		return selledDrugID;
	}

	public void setSelledDrugID(int selledDrugID) {
		this.selledDrugID = selledDrugID;
	}

	public Date getSelledDate() {
		return selledDate;
	}

	public void setSelledDate(Date selledDate) {
		this.selledDate = selledDate;
	}

    /**
     * @return the startDate
     */
    public Date getStartDate() {
        return startDate;
    }

    /**
     * @param startDate the startDate to set
     */
    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    /**
     * @return the endDate
     */
    public Date getEndDate() {
        return endDate;
    }

    /**
     * @param endDate the endDate to set
     */
    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

}
