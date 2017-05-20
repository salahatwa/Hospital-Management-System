package com.hospital.actions;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hospital.entities.HospitalService;
import com.hospital.entities.DoctorDAO;
import com.hospital.models.BloodGroup;
import com.hospital.models.BookBed;
import com.hospital.models.Disease;
import com.hospital.models.Employee;
import com.hospital.models.NextOfKin;
import com.hospital.models.Patient;
import com.hospital.models.Room;

public class DoctorListener {
	private static DoctorListener doctorListener = new DoctorListener();

	private static DoctorDAO doctorDAO = HospitalService.getInstance();
	
	private HttpSession httpSession;

	private DoctorListener() {
	}

	public static DoctorListener getInstance() {
		return doctorListener;
	}

	public int addDiesease(HttpServletRequest request, HttpServletResponse response) {

		int statusCode = 0;
		try {
			httpSession=request.getSession();
			
			Employee employee=(Employee) httpSession.getAttribute("employee");

			int patientID = Integer.parseInt( request.getParameter("patientID") );
			String disease = request.getParameter("disease");
			
			Disease disease2=new Disease();
			disease2.setDisease(disease);
			disease2.setDiseaseDate(new Date());
			disease2.setEmployee(employee);
			
			Patient patient = (Patient) doctorDAO.getObject(patientID, Patient.class);
			disease2.setPatient(patient);
			
			doctorDAO.saveObject(disease2);
			
			response.sendRedirect("dieseasePatient.jsp");

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return statusCode;
	}

	public void deleteDiesease(HttpServletRequest request, HttpServletResponse response) {
		try {
			int diseaseID = Integer.parseInt(request.getParameter("udis"));
			Disease disease = (Disease) doctorDAO.getObject(diseaseID, Disease.class);
			disease.setEmployee(null);
			disease.setPatient(null);

			doctorDAO.deleteObject(disease);
			
			response.sendRedirect("dieseasePatient.jsp");
		} catch (Exception ex) {
			
			ex.printStackTrace();
		}
	}

	public void updateDiesease(HttpServletRequest request, HttpServletResponse response) {

		try {
			httpSession=request.getSession();
			
			Employee employee=(Employee) httpSession.getAttribute("employee");
			
			int diseaseID = Integer.parseInt(request.getParameter("diseaseID"));
			

			int patientID = Integer.parseInt( request.getParameter("patientID") );
			String disease = request.getParameter("disease");
			
			Disease disease2=new Disease();
			disease2.setDiseaseId(diseaseID);
			disease2.setDisease(disease);
			disease2.setDiseaseDate(new Date());
			disease2.setEmployee(employee);
			
			Patient patient = (Patient) doctorDAO.getObject(patientID, Patient.class);
			disease2.setPatient(patient);
			
			doctorDAO.updateObject(disease2);
			
			response.sendRedirect("dieseasePatient.jsp");
			
			

		} catch (Exception ex) {
			
			ex.printStackTrace();
		}

	}

}
