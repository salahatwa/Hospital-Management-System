/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hospital.queries;

import java.security.NoSuchAlgorithmException;
import java.util.List;

import com.hospital.DbConfig.HibernateDriver;
import com.hospital.entities.HospitalService;
import com.hospital.models.BloodGroup;
import com.hospital.models.Category;
import com.hospital.models.Disease;
import com.hospital.models.Employee;
import com.hospital.models.EmployeeStatatistic;
import com.hospital.models.Message;
import com.hospital.models.NextOfKin;
import com.hospital.models.Nurse;
import com.hospital.models.Patient;
import com.hospital.models.RoomType;
import com.hospital.models.SelledDrug;
import com.hospital.models.ShiftTime;
import com.hospital.utils.PasswordEncryption;

/**
 *
 * @author salah
 */
public class TestDbConnection extends HibernateDriver {

	HospitalService hospitalDAO = HospitalService.getInstance();

	public void testConnection() {
		openSession();
		System.out.println("Success");
		closeSession();
		System.out.println("Finished");
	}

	public void addAdmin() throws NoSuchAlgorithmException {
		Employee employee = new Employee();
               
		employee.setFirstName("salah");
		employee.setPassword(PasswordEncryption.encrypt("123456"));
		employee.setUsername("admin");// OK
		employee.setEmail("salah323@outlook.com");
		Category category = (Category)hospitalDAO.getObject(1, Category.class);
		employee.setCategory(category);
		hospitalDAO.saveObject(employee);
	}

	public void addRoomType() {
		RoomType roomType = new RoomType();
		roomType.setTypeOfroom("2 bed");
		roomType.setRoomCost(550);
		hospitalDAO.saveObject(roomType);

		roomType.setTypeOfroom("3 bed");
		roomType.setRoomCost(5150);

		hospitalDAO.saveObject(roomType);

		roomType.setTypeOfroom("4 bed");
		roomType.setRoomCost(55550);

		hospitalDAO.saveObject(roomType);

		roomType.setTypeOfroom("5 bed");
		roomType.setRoomCost(588850);

		hospitalDAO.saveObject(roomType);
	}

	public void addCategory() {
		Category category = new Category();
		
		category.setCategoryName("General");
		hospitalDAO.saveObject(category);
		
		category.setCategoryName("Foot");
		hospitalDAO.saveObject(category);

		category.setCategoryName("Leg");
		hospitalDAO.saveObject(category);
		
		category.setCategoryName("Eye");
		hospitalDAO.saveObject(category);
		
		category.setCategoryName("BOO");
		hospitalDAO.saveObject(category);
		
		category.setCategoryName("Brain");
		hospitalDAO.saveObject(category);

	}

	public void addBloodGroup() {
		BloodGroup bloodGroup = new BloodGroup();
		bloodGroup.setBloodGroupName("A+");
		hospitalDAO.saveObject(bloodGroup);

		bloodGroup.setBloodGroupName("B+");
		hospitalDAO.saveObject(bloodGroup);

		bloodGroup.setBloodGroupName("O+");
		hospitalDAO.saveObject(bloodGroup);

		bloodGroup.setBloodGroupName("A");
		hospitalDAO.saveObject(bloodGroup);

	}
	
	public void addShiftTime()
	{
		ShiftTime shiftTime=new ShiftTime();
		shiftTime.setFromTime("6 AM");
		shiftTime.setToTime("2 PM");
		hospitalDAO.saveObject(shiftTime);

		
		shiftTime.setFromTime("2 PM");
		shiftTime.setToTime("10 PM");
		hospitalDAO.saveObject(shiftTime);
		
		shiftTime.setFromTime("10 PM");
		shiftTime.setToTime("6 AM");
		hospitalDAO.saveObject(shiftTime);
	}

	public void addPatient() {
		Patient patient = new Patient();

		BloodGroup bloodGroup = new BloodGroup();
		bloodGroup.setBloodGroupName("A+");
		bloodGroup.setBloodGroupId(1);
		patient.setBloodGroup(bloodGroup);
		patient.setName("asdasd");
		patient.setFatherName("sayed");

		NextOfKin nextOfKin = new NextOfKin();
		nextOfKin.setAddress("asdsad");
		nextOfKin.setFullName("aaaa");
		patient.setNextOfKin(nextOfKin);
		hospitalDAO.saveObject(patient);
	}

	public Employee getEmployee(String email, String pass) {
		return hospitalDAO.getEmployee(email, pass);
	}

	public <T extends Object> Object getObject(int objectID, Class<T> clazz) {
		Object object = hospitalDAO.getObject(objectID, clazz);
		return object;
	}

	public <T extends Object> void deleteObject(T object) {
		hospitalDAO.deleteObject(object);
	}

	public <T extends Object> List<T> getListObjects(Class<T> clazz) {
		return hospitalDAO.getListObjects(clazz);
	}

	public List<EmployeeStatatistic> getEmployeeStatistic() {
		return hospitalDAO.getEmployeeStatistic();
	}

	public List<Employee> getListEmployeeWithout() {
		return hospitalDAO.getListEmployeeWithout(2);
	}

	public List<Message> getAllSentMessage() {
		return hospitalDAO.getAllMessagesSentByEmployee(14);
	}

	public List<Disease> getAllDiseaseByEmployeeID() {
		return hospitalDAO.getAllDiseaseByEmployeeID(14);
	}
	
	public List<SelledDrug> allPatientDrug()
	{
		return hospitalDAO.getAllSelledDrugForPatient(2);
	}

	public List<Nurse> getNurses()
	{
		List<Nurse> nurses = hospitalDAO.getListObjects(Nurse.class);
		
		return nurses;
	}
        
        public int getmaxID()
        {
            return hospitalDAO.getMaxIDObject();
        }
	public static void main(String[] args) {
		TestDbConnection testDbConnection = new TestDbConnection();
//		testDbConnection.testConnection();
		try {
			                 System.out.println(testDbConnection.getmaxID());
			
//			List<Nurse> nurses = testDbConnection.getNurses();
//			
//			for (Nurse nurse : nurses) {
//				System.out.println(nurse.getFirstName());
//			}
////			
//			List<SelledDrug> selledDrugs=testDbConnection.allPatientDrug();
//			
//			for (SelledDrug selledDrug : selledDrugs) {
//				System.out.println(selledDrug.getPatient().getName());
//			}
//			testDbConnection.addRoomType();
//			testDbConnection.addBloodGroup();
//			testDbConnection.addCategory();
//			testDbConnection.addShiftTime();
//			testDbConnection.addAdmin();

			// testDbConnection.addPatient();

			// testDbConnection.getEmployee("salah@gmail.com", "123456");
			// Employee employee=(Employee)
			// testDbConnection.getObject(2,Employee.class);
			// System.out.println(employee.getFirstName());
			// Category category=(Category) testDbConnection.getObject(1,
			// Category.class);
			// System.out.println(category.getCategoryName());

			// testDbConnection.deleteObject(category);

			// List<Category>
			// categories=testDbConnection.getListObjects(Category.class);
			// for (Category category : categories) {
			// System.out.println(category.getCategoryName());
			// }

//			 List<EmployeeStatatistic> employeeStatatistics=testDbConnection.getEmployeeStatistic();
//			//
//			 for (EmployeeStatatistic employeeStatatistic2 :
//			 employeeStatatistics) {
//			 System.out.println(employeeStatatistic2.getType()+"\t"+employeeStatatistic2.getNumber().intValue());
//			
//			 }

			/*
			 * List<Employee> list=testDbConnection.getListEmployeeWithout();
			 * 
			 * for (Employee employee : list) {
			 * System.out.println(employee.getAddress()+"\t"+employee.getType()+
			 * "\t"+employee.getEmployeeId()); }
			 */

			// testDbConnection.testConnection();
			//
			//
			//
			// List<Disease>
			// diseases=testDbConnection.getAllDiseaseByEmployeeID();
			//
			// for (Disease disease : diseases) {
			// System.out.println(disease.getDisease());
			// }
			// List<Message> messages = testDbConnection.getAllSentMessage();
			//
			// for (Message message : messages) {
			// System.out.println(message.getMessageBody());
			// }
		} catch (Exception e) {

			e.printStackTrace();
		}
	}

}
