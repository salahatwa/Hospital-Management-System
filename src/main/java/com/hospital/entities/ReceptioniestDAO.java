package com.hospital.entities;

import java.util.List;

import com.hospital.models.Employee;
import com.hospital.models.EmployeeStatatistic;
import com.hospital.models.Room;

public interface ReceptioniestDAO extends EmployeeDAO{


	public List<Employee> getListEmployeeWithout(int employeeID);



	public List<EmployeeStatatistic> getEmployeeStatistic();

	public void deleteAllMessageForEmployee(int employeeID);

	public void deleteAllPatientMessages(int patientID);
	
	public List<Room> getAllAvailableRoom();


}
