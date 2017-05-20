package com.hospital.actions;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.io.IOUtils;

import com.hospital.entities.AdminDAO;
import com.hospital.entities.HospitalService;
import com.hospital.models.Accountant;
import com.hospital.models.Category;
import com.hospital.models.Doctor;
import com.hospital.models.Employee;
import com.hospital.models.Lab;
import com.hospital.models.Nurse;
import com.hospital.models.NurseServiceTime;
import com.hospital.models.Pharmatiest;
import com.hospital.models.Qualification;
import com.hospital.models.Receptioniest;
import com.hospital.models.Room;
import com.hospital.models.RoomType;
import com.hospital.models.ShiftTime;
import com.hospital.models.WorkExperince;
import com.hospital.models.Xray;
import com.hospital.utils.FormateDate;
import com.hospital.utils.PasswordEncryption;

public class AdminListener {

	private static AdminListener adminListener = new AdminListener();

	private static AdminDAO adminDAO = HospitalService.getInstance();

	private AdminListener() {
	}

	public static AdminListener getInstance() {
		return adminListener;
	}

	public int addEmployee(HttpServletRequest request, HttpServletResponse response) {

		int statusCode = 0;
		try {
			// obtains the upload file part in this multipart request
			Part filePart = request.getPart("picture");
			InputStream pictureStream = filePart.getInputStream();

			String firstname = request.getParameter("firstname");
			String userName = request.getParameter("userName");
			String fathername = request.getParameter("fathername");
			String familyname = request.getParameter("familyname");
			String address = request.getParameter("address");
			String email = request.getParameter("email");
			String pass = request.getParameter("pass");
			String dob = request.getParameter("dob");
			String phone = request.getParameter("phone");
			String gender = request.getParameter("gender");
			int catgoryID = Integer.parseInt(request.getParameter("catgoryID"));
			String employeeType = request.getParameter("type");

			// Qualifications
			String[] instituteNames = request.getParameterValues("instituteName[]");
			String[] qualificationNames = request.getParameterValues("qualificationName[]");
			String[] degrees = request.getParameterValues("Degree[]");
			String[] educationDates = request.getParameterValues("educationDate[]");

			List<Qualification> qualifications = new ArrayList<>();

			for (int i = 0; i < instituteNames.length; i++) {
				Qualification qualification = new Qualification();
				qualification.setInstituteName(instituteNames[i]);
				qualification.setQualificationDate(educationDates[i]);
				qualification.setQualificationName(qualificationNames[i]);
				qualification.setDegree(degrees[i]);
				qualifications.add(qualification);
			}

			// Qualifications
			String[] nameOfOrganizations = request.getParameterValues("nameOfOrganization[]");
			String[] positions = request.getParameterValues("position[]");
			String[] startDates = request.getParameterValues("startDate[]");
			String[] endDates = request.getParameterValues("endDate[]");

			List<WorkExperince> workExperinces = new ArrayList<>();

			for (int i = 0; i < nameOfOrganizations.length; i++) {
				WorkExperince workExperince = new WorkExperince();
				workExperince.setEndDate(endDates[i]);
				workExperince.setStartDate(startDates[i]);
				workExperince.setPosition(positions[i]);
				workExperince.setNameOfOrganization(nameOfOrganizations[i]);

				workExperinces.add(workExperince);
			}

			Employee employee = null;

			System.out.println("######:" + employeeType);
			if (employeeType.equals("Doctor")) {
				employee = new Doctor();
			} else if (employeeType.equals("Nurse")) {
				employee = new Nurse();
			} else if (employeeType.equals("Lab")) {
				employee = new Lab();
			} else if (employeeType.equals("Xray")) {
				employee = new Xray();
			} else if (employeeType.equals("Pharmatiest")) {
				employee = new Pharmatiest();
			} else if (employeeType.equals("Receptioniest")) {
				employee = new Receptioniest();
			} else if (employeeType.equals("Accountant")) {
				employee = new Accountant();
			} else {
				employee = new Employee();
			}

			if (filePart != null)
				employee.setPhoto("data:image/png;base64,"
						+ Base64.getEncoder().encodeToString(IOUtils.toByteArray(pictureStream)));
			employee.setFirstName(firstname);
			employee.setFatherName(fathername);
			employee.setFamilyName(familyname);
			employee.setAddress(address);
			employee.setEmail(email);
			employee.setPassword(PasswordEncryption.encrypt(pass));
			employee.setDob(FormateDate.getFormatedDate(dob));
			employee.setPhone(phone);
			employee.setGender(gender);
			employee.setQualifications(qualifications);
			employee.setWorkExperinces(workExperinces);
			employee.setJoinDate(new Date());
			employee.setUsername(userName);

			employee.setCategory((Category) adminDAO.getObject(catgoryID, Category.class));

			statusCode = adminDAO.saveObject(employee);

			System.out.println("Status Code:" + statusCode);

			if (statusCode == 0)
				response.sendRedirect("empmgmt.jsp?error=true");
			else
				response.sendRedirect("empmgmt.jsp?add=true");

		} catch (Exception ex) {
			try {
				response.sendRedirect("empmgmt.jsp?error=true");
			} catch (IOException e) {
				e.printStackTrace();
			}
			ex.printStackTrace();
		}
		return statusCode;
	}

	public void updateEmployee(HttpServletRequest request, HttpServletResponse response) {

		try {
			// obtains the upload file part in this multipart request

			int employeeID = Integer.parseInt(request.getParameter("employeeID"));

			Employee employee = (Employee) adminDAO.getObject(employeeID, Employee.class);

			String userName = request.getParameter("userName");
			String firstname = request.getParameter("firstname");
			String fathername = request.getParameter("fathername");
			String familyname = request.getParameter("familyname");
			String address = request.getParameter("address");
			String email = request.getParameter("email");
			String pass = request.getParameter("pass");
			String dob = request.getParameter("dob");
			String phone = request.getParameter("phone");
			String gender = request.getParameter("gender");
			int catgoryID = Integer.parseInt(request.getParameter("catgoryID"));
			String employeeType = request.getParameter("type");

			// Qualifications
			String[] instituteNames = request.getParameterValues("instituteName[]");
			String[] qualificationNames = request.getParameterValues("qualificationName[]");
			String[] degrees = request.getParameterValues("Degree[]");
			String[] educationDates = request.getParameterValues("educationDate[]");

			List<Qualification> qualifications = new ArrayList<>(employee.getQualifications());

			// Employee employee = null;
			// System.out.println("######:" + employeeType);
			// if (employeeType.equals("Doctor")) {
			// employee = new Doctor();
			// } else if (employeeType.equals("Nurse")) {
			// employee = new Nurse();
			// } else if (employeeType.equals("Lab")) {
			// employee = new Lab();
			// } else if (employeeType.equals("Xray")) {
			// employee = new Xray();
			// } else if (employeeType.equals("Pharmatiest")) {
			// employee = new Pharmatiest();
			// } else if (employeeType.equals("Receptioniest")) {
			// employee = new Receptioniest();
			//
			// } else if (employeeType.equals("Accountant")) {
			// employee = new Accountant();
			// } else {
			// employee = new Employee();
			// }

			employee.setType(employeeType);

			if (instituteNames != null) {
				for (int i = 0; i < instituteNames.length; i++) {
					Qualification qualification = new Qualification();
					qualification.setInstituteName(instituteNames[i]);
					qualification.setQualificationDate(educationDates[i]);
					qualification.setQualificationName(qualificationNames[i]);
					qualification.setDegree(degrees[i]);
					qualifications.add(qualification);
				}
				employee.setQualifications(qualifications);

				// WorkExperiences
				String[] nameOfOrganizations = request.getParameterValues("nameOfOrganization[]");
				String[] positions = request.getParameterValues("position[]");
				String[] startDates = request.getParameterValues("startDate[]");
				String[] endDates = request.getParameterValues("endDate[]");

				List<WorkExperince> workExperinces = new ArrayList<>(employee.getWorkExperinces());

				for (int i = 0; i < nameOfOrganizations.length; i++) {
					WorkExperince workExperince = new WorkExperince();
					workExperince.setEndDate(endDates[i]);
					workExperince.setStartDate(startDates[i]);
					workExperince.setPosition(positions[i]);
					workExperince.setNameOfOrganization(nameOfOrganizations[i]);

					workExperinces.add(workExperince);
				}

				employee.setWorkExperinces(workExperinces);
			}

			try {
				Part filePart = request.getPart("picture");
				InputStream pictureStream = filePart.getInputStream();

				if (pictureStream.available() > 0) {
					System.out.println("Part IS Not NUll" + pictureStream.available());
					employee.setPhoto("data:image/png;base64,"
							+ Base64.getEncoder().encodeToString(IOUtils.toByteArray(pictureStream)));
				} else {
					System.out.println("::" + pictureStream.available());
				}

			} catch (Exception e) {

			}

			employee.setUsername(userName);
			employee.setFirstName(firstname);
			employee.setFatherName(fathername);
			employee.setFamilyName(familyname);
			employee.setAddress(address);
			employee.setEmail(email);
			employee.setPassword(PasswordEncryption.encrypt(pass));
			employee.setDob(FormateDate.getFormatedDate(dob));
			employee.setPhone(phone);
			employee.setGender(gender);

			employee.setCategory((Category) adminDAO.getObject(catgoryID, Category.class));

			adminDAO.updateObject(employee);

			response.sendRedirect("empmgmt.jsp?update=true");

		} catch (Exception ex) {
			try {
				response.sendRedirect("empmgmt.jsp?error=true");
			} catch (IOException e) {
			}
			ex.printStackTrace();
		}

	}

	public void deleteEmployee(HttpServletRequest request, HttpServletResponse response) {
		try {
			int employeeID = Integer.parseInt(request.getParameter("dempid"));
			Employee employee = (Employee) adminDAO.getObject(employeeID, Employee.class);
			employee.setCategory(null);
                        
			adminDAO.deleteAllMessageForEmployee(employeeID);
			adminDAO.deleteObject(employee);

			response.sendRedirect("empmgmt.jsp?delete=true");
		} catch (Exception ex) {
			try {
				response.sendRedirect("empmgmt.jsp?error=true");
			} catch (IOException e) {
				e.printStackTrace();
			}
			ex.printStackTrace();
		}
	}

	public void addRoom(HttpServletRequest request, HttpServletResponse response) {

		try {
			int roomTypeID = Integer.parseInt(request.getParameter("roomTypeID"));
			int bedNumbers = Integer.parseInt(request.getParameter("bedNumbers"));

			Room room = new Room();
			room.setNumberOfBeds(bedNumbers);
			room.setNumberOfAvailableBeds(bedNumbers);
			room.setRoomType((RoomType) adminDAO.getObject(roomTypeID, RoomType.class));

			int statusCode = adminDAO.saveObject(room);

			if (statusCode == 0)
				response.sendRedirect("mgmtroom.jsp?error=true");
			else
				response.sendRedirect("mgmtroom.jsp?add=true");

		} catch (Exception ex) {
			try {
				response.sendRedirect("mgmtroom.jsp?error=true");
			} catch (IOException e) {
				e.printStackTrace();
			}
			ex.printStackTrace();
		}

	}

	public void deleteRoom(HttpServletRequest request, HttpServletResponse response) {
		try {
			int roomID = Integer.parseInt(request.getParameter("roomID"));
			Room room = (Room) adminDAO.getObject(roomID, Room.class);
			room.setRoomType(null);
			adminDAO.deleteAllRoomBooked(roomID);
			adminDAO.deleteObject(room);

			response.sendRedirect("mgmtroom.jsp?delete=true");
		} catch (Exception ex) {
			try {
				response.sendRedirect("mgmtroom.jsp?error=true");
			} catch (IOException e) {
				e.printStackTrace();
			}
			ex.printStackTrace();
		}

	}

	public void updateRoom(HttpServletRequest request, HttpServletResponse response) {
		try {
			int roomID = Integer.parseInt(request.getParameter("roomID"));
			int roomTypeID = Integer.parseInt(request.getParameter("roomTypeID"));
			int bedNumbers = Integer.parseInt(request.getParameter("bedNumbers"));

			Room room = new Room();
			room.setRoomId(roomID);
			room.setNumberOfBeds(bedNumbers);
			room.setNumberOfAvailableBeds(bedNumbers);
			room.setRoomType((RoomType) adminDAO.getObject(roomTypeID, RoomType.class));

			adminDAO.updateObject(room);
			response.sendRedirect("mgmtroom.jsp?update=true");

		} catch (Exception ex) {
			try {
				response.sendRedirect("mgmtroom.jsp?error=true");
			} catch (IOException e) {
				e.printStackTrace();
			}
			ex.printStackTrace();
		}

	}

	public void addServiceTime(HttpServletRequest request, HttpServletResponse response) {
		try {

			String nurseID = request.getParameter("nurseID");
			String shiftTimeID = request.getParameter("shiftTimeID");
			String serviceDate = request.getParameter("serviceDate");
			String department = request.getParameter("department");
			
			NurseServiceTime nurseServiceTime=new NurseServiceTime();
			nurseServiceTime.setDepartment(department);
			nurseServiceTime.setServiceDate(FormateDate.getFormatedDate(serviceDate));
			
			ShiftTime shiftTime =(ShiftTime)  adminDAO.getObject(Integer.parseInt(shiftTimeID),ShiftTime.class);
			nurseServiceTime.setShiftTime(shiftTime);
			
			Nurse nurse=(Nurse) adminDAO.getObject(Integer.parseInt(nurseID),Nurse.class);
			nurseServiceTime.setNurse(nurse);
			
			adminDAO.saveObject(nurseServiceTime);
			
			response.sendRedirect("servicetime.jsp?add=true");
			
		} catch (Exception ex) {
			try {
				response.sendRedirect("servicetime.jsp?error=true");
			} catch (IOException e) {
				e.printStackTrace();
			}
			ex.printStackTrace();
		}
	}

	public void updateServiceTime(HttpServletRequest request, HttpServletResponse response) {
		try {
			
			String nurseServiceTimeID = request.getParameter("nurseServiceTimeID");
			
			String nurseID = request.getParameter("nurseID");
			String shiftTimeID = request.getParameter("shiftTimeID");
			String serviceDate = request.getParameter("serviceDate");
			String department = request.getParameter("department");
			
			NurseServiceTime nurseServiceTime=new NurseServiceTime();
			nurseServiceTime.setNurseServiceTimeID(Integer.parseInt(nurseServiceTimeID));
			nurseServiceTime.setDepartment(department);
			nurseServiceTime.setServiceDate(FormateDate.getFormatedDate(serviceDate));
			
			ShiftTime shiftTime =(ShiftTime)  adminDAO.getObject(Integer.parseInt(shiftTimeID),ShiftTime.class);
			nurseServiceTime.setShiftTime(shiftTime);
			
			Nurse nurse=(Nurse) adminDAO.getObject(Integer.parseInt(nurseID),Nurse.class);
			nurseServiceTime.setNurse(nurse);
			
			adminDAO.updateObject(nurseServiceTime);
			
			response.sendRedirect("servicetime.jsp?update=true");
		} catch (Exception ex) {
			try {
				response.sendRedirect("servicetime.jsp?error=true");
			} catch (IOException e) {
				e.printStackTrace();
			}
			ex.printStackTrace();
		}
	}

	public void deleteServiceTime(HttpServletRequest request, HttpServletResponse response) {
		try {
			int nurseServiceTimeID = Integer.parseInt(request.getParameter("nurseServiceTimeID"));
			
			NurseServiceTime nurseServiceTime=(NurseServiceTime) adminDAO.getObject(nurseServiceTimeID, NurseServiceTime.class);
			nurseServiceTime.setShiftTime(null);
			nurseServiceTime.setNurse(null);
			adminDAO.deleteObject(nurseServiceTime);
			
			
			response.sendRedirect("servicetime.jsp?delete=true");

		} catch (Exception ex) {
			try {
				response.sendRedirect("servicetime.jsp?error=true");
			} catch (IOException e) {
				e.printStackTrace();
			}
			ex.printStackTrace();
		}
	}

}
