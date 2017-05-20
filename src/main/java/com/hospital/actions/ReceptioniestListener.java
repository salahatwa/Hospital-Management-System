package com.hospital.actions;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hospital.entities.HospitalService;
import com.hospital.entities.ReceptioniestDAO;
import com.hospital.models.BloodGroup;
import com.hospital.models.BookBed;
import com.hospital.models.Employee;
import com.hospital.models.NextOfKin;
import com.hospital.models.Patient;
import com.hospital.models.Room;
import com.hospital.utils.FormateDate;

public class ReceptioniestListener {
	private static ReceptioniestListener receptioniestListener = new ReceptioniestListener();

	private static ReceptioniestDAO receptioniestDAO = HospitalService.getInstance();

	private ReceptioniestListener() {
	}

	public static ReceptioniestListener getInstance() {
		return receptioniestListener;
	}

	public int addpatient(HttpServletRequest request, HttpServletResponse response) {

		int statusCode = 0;
		try {

			String firstname = request.getParameter("firstname");
			String fathername = request.getParameter("fathername");
			String familyname = request.getParameter("familyname");
			String address = request.getParameter("address");
			String email = request.getParameter("email");
			String dob = request.getParameter("dob");
			String phone = request.getParameter("phone");
			String gender = request.getParameter("gender");
			String age = request.getParameter("age");

			int bloodGroupID = Integer.parseInt(request.getParameter("bloodGroupID"));
			BloodGroup bloodGroup = (BloodGroup) receptioniestDAO.getObject(bloodGroupID, BloodGroup.class);

			String nfullname = request.getParameter("nfullname");
			String naddress = request.getParameter("naddress");
			String nrelationship = request.getParameter("nrelationship");
			String nphone = request.getParameter("nphone");

			NextOfKin nextOfKin = new NextOfKin();
			nextOfKin.setAddress(naddress);
			nextOfKin.setFullName(nfullname);
			nextOfKin.setPhone(nphone);
			nextOfKin.setRelationship(nrelationship);

			Patient patient = new Patient();

			patient.setName(firstname);
			patient.setFatherName(fathername);
			patient.setFamilyName(familyname);
			patient.setAddress(address);
			patient.setEmail(email);
			patient.setDob(FormateDate.getFormatedDate(dob));
			patient.setPhone(Long.parseLong(phone));
			patient.setGender(gender);
			patient.setAge(Integer.parseInt(age));
			patient.setJoiningDate(new Date());
			patient.setNextOfKin(nextOfKin);
			patient.setBloodGroup(bloodGroup);

			statusCode = receptioniestDAO.saveObject(patient);
			
			response.sendRedirect("patientmgmt.jsp?add=true");

		} catch (Exception ex) {
			try {
				response.sendRedirect("patientmgmt.jsp?error=true");
			} catch (IOException e) {
				e.printStackTrace();
			}
			ex.printStackTrace();
		}
		return statusCode;
	}

	public void deletePatient(HttpServletRequest request, HttpServletResponse response) {
		try {
			int patientID = Integer.parseInt(request.getParameter("dempid"));
			Patient patient = (Patient) receptioniestDAO.getObject(patientID, Patient.class);
			

			patient.setBloodGroup(null);
		
			receptioniestDAO.deleteAllPatientMessages(patientID);
			

			receptioniestDAO.deleteObject(patient);
			
			response.sendRedirect("patientmgmt.jsp?delete=true");
			
		} catch (Exception ex) {
			try {
				response.sendRedirect("patientmgmt.jsp?error=true");
			} catch (IOException e) {
				e.printStackTrace();
			}
			ex.printStackTrace();
		}
	}

	public void updatePatient(HttpServletRequest request, HttpServletResponse response) {

		try {

			int selectedPatientID = Integer.parseInt(request.getParameter("selectedPatient"));

			String firstname = request.getParameter("firstname");
			String fathername = request.getParameter("fathername");
			String familyname = request.getParameter("familyname");
			String address = request.getParameter("address");
			String email = request.getParameter("email");
			String dob = request.getParameter("dob");
			String phone = request.getParameter("phone");
			String gender = request.getParameter("gender");
			String age = request.getParameter("age");

			int bloodGroupID = Integer.parseInt(request.getParameter("bloodGroupID"));
			BloodGroup bloodGroup = (BloodGroup) receptioniestDAO.getObject(bloodGroupID, BloodGroup.class);

			String nfullname = request.getParameter("nfullname");
			String naddress = request.getParameter("naddress");
			String nrelationship = request.getParameter("nrelationship");
			String nphone = request.getParameter("nphone");

		

			Patient patient =(Patient) receptioniestDAO.getObject(selectedPatientID, Patient.class);
			patient.setPatientId(selectedPatientID);
			patient.setName(firstname);
			patient.setFatherName(fathername);
			patient.setFamilyName(familyname);
			patient.setAddress(address);
			patient.setEmail(email);
			patient.setDob(FormateDate.getFormatedDate(dob));
			patient.setPhone(Long.parseLong(phone));
			patient.setGender(gender);
			patient.setAge(Integer.parseInt(age));
			patient.setJoiningDate(new Date());
			
			
			NextOfKin nextOfKin = patient.getNextOfKin();
			nextOfKin.setAddress(naddress);
			nextOfKin.setFullName(nfullname);
			nextOfKin.setPhone(nphone);
			nextOfKin.setRelationship(nrelationship);
			
			patient.setNextOfKin(nextOfKin);
			patient.setBloodGroup(bloodGroup);

			receptioniestDAO.updateObject(patient);
			response.sendRedirect("patientmgmt.jsp?update=true");

		} catch (Exception ex) {
			try {
				response.sendRedirect("patientmgmt.jsp?error=true");
			} catch (IOException e) {
				e.printStackTrace();
			}
			ex.printStackTrace();
		}

	}

	public void bookBed(HttpServletRequest request, HttpServletResponse response) {
		try {
			int roomID = Integer.parseInt(request.getParameter("roomTypeID"));
			int patientID = Integer.parseInt(request.getParameter("patientID"));
			String departement = request.getParameter("departement");

			BookBed bookBed = new BookBed();
			bookBed.setDatePlaced(new Date());
			bookBed.setDepartement(departement);
			bookBed.setStatus(false);
			Patient patient = (Patient) receptioniestDAO.getObject(patientID, Patient.class);
			bookBed.setPatient(patient);

			Room room = (Room) receptioniestDAO.getObject(roomID, Room.class);
			room.setNumberOfAvailableBeds(room.getNumberOfAvailableBeds() - 1);
			bookBed.setRoom(room);

			receptioniestDAO.saveObject(bookBed);
			
			

			response.sendRedirect("bookBed.jsp?add=true");

		} catch (Exception ex) {
			try {
				response.sendRedirect("bookBed.jsp?error=true");
			} catch (IOException e) {
				e.printStackTrace();
			}
			ex.printStackTrace();
		}

	}

	public void deleteBookedBed(HttpServletRequest request, HttpServletResponse response) {

		try {
			int ubbed = Integer.parseInt(request.getParameter("ubbed"));
			BookBed bookBed = (BookBed) receptioniestDAO.getObject(ubbed, BookBed.class);
			
			
//			int room=bookBed.getRoom().setNumberOfAvailableBeds(bookBed.getRoom().getNumberOfAvailableBeds()+1);
			Room room=bookBed.getRoom();
			room.setNumberOfAvailableBeds(room.getNumberOfAvailableBeds()+1);
			
			receptioniestDAO.updateObject(room);
			
			bookBed.setRoom(null);
			bookBed.setPatient(null);
			
			receptioniestDAO.deleteObject(bookBed);
			
			response.sendRedirect("bookBed.jsp?delete=true");

		} catch (Exception ex) {
			try {
				response.sendRedirect("bookBed.jsp?error=true");
			} catch (IOException e) {
				e.printStackTrace();
			}
			ex.printStackTrace();
		}

	}

	public void updateBookedBed(HttpServletRequest request, HttpServletResponse response) {
		try {

			int bookBedID = Integer.parseInt(request.getParameter("bookBedID"));

			int roomID = Integer.parseInt(request.getParameter("roomTypeID"));
			int patientID = Integer.parseInt(request.getParameter("patientID"));
			String departement = request.getParameter("departement");

			BookBed bookBed = new BookBed();
			bookBed.setBedId(bookBedID);
			bookBed.setDatePlaced(new Date());
			bookBed.setDepartement(departement);
			bookBed.setStatus(false);
			Patient patient = (Patient) receptioniestDAO.getObject(patientID, Patient.class);
			bookBed.setPatient(patient);

			Room room = (Room) receptioniestDAO.getObject(roomID, Room.class);
			bookBed.setRoom(room);

			receptioniestDAO.updateObject(bookBed);
			
			response.sendRedirect("bookBed.jsp?update=true");

		} catch (Exception ex) {
			try {
				response.sendRedirect("bookBed.jsp?error=true");
			} catch (IOException e) {
				e.printStackTrace();
			}
			ex.printStackTrace();
		}

	}

}
