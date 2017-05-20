package com.hospital.models;

import java.math.BigDecimal;


public class EmployeeStatatistic {
	
	private String type;
	private BigDecimal number;
	
	public EmployeeStatatistic() {
		
	}
	
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public BigDecimal getNumber() {
		return number;
	}
	public void setNumber(BigDecimal number) {
		this.number = number;
	}

}
