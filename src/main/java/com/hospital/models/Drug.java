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
@Table(name = "Drugs")
public class Drug implements java.io.Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "drugId")
	private Integer drugId;

	private double cost;
	private String drug_expired; // finishedDate;
	private String name;
	private int quantity;
	private String startDate;
	private String unitPerDay;

	@OneToOne(fetch = FetchType.EAGER, targetEntity = Employee.class, cascade = CascadeType.ALL)
	@JoinColumn(name = "employee_id")
	private Employee employee;

	public Drug() {
	}



	public double getCost() {
		return this.cost;
	}

	public void setCost(double cost) {
		this.cost = cost;
	}
/*
	public String getFinishedDate() {
		return this.finishedDate;
	}

	public void setFinishedDate(String finishedDate) {
		this.finishedDate = finishedDate;
	}
*/
        public String getDrug_expired() {
		return this.drug_expired;
	}

	public void setDrug_expired(String drug_expired) {
		this.drug_expired = drug_expired;
	}
        
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}



	public int getQuantity() {
		return this.quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getStartDate() {
		return this.startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getUnitPerDay() {
		return this.unitPerDay;
	}

	public void setUnitPerDay(String unitPerDay) {
		this.unitPerDay = unitPerDay;
	}

	public Integer getDrugId() {
		return drugId;
	}

	public void setDrugId(Integer drugId) {
		this.drugId = drugId;
	}



	public Employee getEmployee() {
		return employee;
	}



	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

}
