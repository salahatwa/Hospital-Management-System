package com.hospital.entities;

import java.util.List;

import com.hospital.models.Disease;


public interface DoctorDAO extends EmployeeDAO{


	public List<Disease> getAllDiseaseByEmployeeID(int employeeID);

	public void deleteAllMessageForEmployee(int employeeID);


}
