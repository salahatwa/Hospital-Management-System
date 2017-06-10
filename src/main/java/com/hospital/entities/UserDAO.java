package com.hospital.entities;

import java.util.List;

import com.hospital.models.Employee;
import com.hospital.models.Message;

public interface UserDAO {
	public List<Employee> getListEmployeeWithout(int employeeID);

	public <T extends Object> List<T> getListObjects(Class<T> clazz);

	public List<Message> getAllMessagesSentByEmployee(Integer employeeID);

	public List<Message> getAllMessagesForEmployee(Integer employeeID);
	
	public List<Message> getAllUnreadMessagesForEmployee(Integer employeeID);
	
	public List<Employee> getEmployees(String type) ;
	
	public <T extends Object> Object getObject(int employeeID, Class<T> clazz);


}
