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
import javax.persistence.Temporal;

@Entity
@Table(name = "Messages")
public class Message implements java.io.Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "messageId")
	private Integer messageId;
	
	
	private String messageBody;
	private String subject;
	private boolean messageStatus;
        @Temporal(javax.persistence.TemporalType.DATE)
	private Date messageDate;
	
	@OneToOne(fetch = FetchType.EAGER,targetEntity = Employee.class,cascade = {CascadeType.ALL,CascadeType.REMOVE})
    @JoinColumn(name = "from_employee_id")
	private Employee fromEmployee;
	
	@OneToOne(fetch = FetchType.EAGER,targetEntity = Employee.class,cascade ={CascadeType.ALL,CascadeType.REMOVE})
    @JoinColumn(name = "fto_employee_id")
	private Employee toEmployee;
	
	
	@OneToOne(fetch = FetchType.EAGER,targetEntity = Patient.class,cascade = {CascadeType.ALL,CascadeType.REMOVE})
    @JoinColumn(name = "patient_id")
	private Patient patient;

	public Message() {
	}


	public Integer getMessageId() {
		return this.messageId;
	}

	public void setMessageId(Integer messageId) {
		this.messageId = messageId;
	}


	public Patient getPatient() {
		return this.patient;
	}

	public void setPatient(Patient patient) {
		this.patient = patient;
	}

	public String getMessageBody() {
		return this.messageBody;
	}

	public void setMessageBody(String messageBody) {
		this.messageBody = messageBody;
	}

	public String getSubject() {
		return this.subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public boolean isMessageStatus() {
		return this.messageStatus;
	}

	public void setMessageStatus(boolean messageStatus) {
		this.messageStatus = messageStatus;
	}

	public Date getMessageDate() {
		return this.messageDate;
	}

	public void setMessageDate(Date messageDate) {
		this.messageDate = messageDate;
	}


	public Employee getFromEmployee() {
		return fromEmployee;
	}


	public void setFromEmployee(Employee fromEmployee) {
		this.fromEmployee = fromEmployee;
	}


	public Employee getToEmployee() {
		return toEmployee;
	}


	public void setToEmployee(Employee toEmployee) {
		this.toEmployee = toEmployee;
	}

}
