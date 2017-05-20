package com.hospital.entities;

import java.util.List;

import com.hospital.models.Employee;
import com.hospital.models.EmployeeStatatistic;

public interface AdminDAO extends EmployeeDAO{
	
	public <T extends Object> List<T> getListObjects(Class<T> clazz);
	
	public List<Employee> getListEmployeeWithout(int employeeID);
	
	
	
	public List<EmployeeStatatistic> getEmployeeStatistic();
	
	public void deleteAllMessageForEmployee(int employeeID);
	
	public void deleteAllRoomBooked(int roomID);
	

}
