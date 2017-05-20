package com.hospital.entities;

import java.util.List;

import com.hospital.models.Employee;
import com.hospital.models.EmployeeStatatistic;
import com.hospital.models.SelledDrug;

public interface PharmatiestDAO extends EmployeeDAO{

	
	public List<Employee> getListEmployeeWithout(int employeeID);
	
	
	public List<EmployeeStatatistic> getEmployeeStatistic();
	
	public void sellDrug(SelledDrug selledDrug);
	
	public List<SelledDrug> getAllSelledDrugForPatient(int patientID);
        
        
         public int getMaxIDObject() ;
        
	
	
}
