package com.hospital.entities;

import java.util.List;

public interface EmployeeDAO {
	public <T extends Object> List<T> getListObjects(Class<T> clazz);

	public <T extends Object> Object getObject(int employeeID, Class<T> clazz);

	public <T extends Object> int saveObject(T object);

	public <T extends Object> void deleteObject(T object);

	public <T extends Object> void updateObject(T object);
}
