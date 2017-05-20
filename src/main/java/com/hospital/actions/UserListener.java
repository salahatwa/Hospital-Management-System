package com.hospital.actions;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hospital.entities.HospitalService;
import com.hospital.models.Employee;
import com.hospital.models.Message;
import com.hospital.models.Patient;
import com.hospital.utils.Entity;
import com.hospital.utils.PasswordEncryption;

public class UserListener {

	private static UserListener userListener = new UserListener();

	private UserListener() {
	}

	public static UserListener getInstance() {
		return userListener;
	}

	private HttpSession httpSession;
	private HospitalService hospitalService = HospitalService.getInstance();

	public boolean changePassword(HttpServletRequest request, HttpServletResponse response) {

		boolean flag = false;
		try {
			httpSession = request.getSession();

			String currpass = request.getParameter("currpass");
			String newpass = request.getParameter("newpass");

			Employee employee = (Employee) httpSession.getAttribute("employee");

			System.out.println(employee.getPassword() + "\t" + PasswordEncryption.encrypt(currpass));
			if (employee.getPassword().equals(PasswordEncryption.encrypt(currpass))) {
				employee.setPassword(PasswordEncryption.encrypt(newpass));
				hospitalService.updateObject(employee);
				flag = true;
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return flag;
	}

	public void composeEmail(HttpServletRequest request, HttpServletResponse response) {

		try {
			httpSession = request.getSession();

			Employee fromEmployee = (Employee) httpSession.getAttribute("employee");

			String sendToID = request.getParameter("sendToID");

			String patientID = request.getParameter("patientID");
			String messageSubject = request.getParameter("messageSubject");
			String messageBody = request.getParameter("messageBody");

			Message message = new Message();
			message.setMessageBody(messageBody);
			message.setMessageDate(new Date());
			message.setMessageStatus(false);
			message.setPatient((Patient) hospitalService.getObject(Integer.parseInt(patientID), Patient.class));
			message.setFromEmployee(fromEmployee);
			message.setSubject(messageSubject);

			if (sendToID .equals(Entity.Receptioniest.name())) {
				System.out.println("##########ALL###########");
				List<Employee> employees = hospitalService.getEmployees(Entity.Receptioniest.name());
				for (Employee employee : employees) {
					message.setToEmployee(employee);
					hospitalService.composeMessage(message);
				}

			} else {

				message.setToEmployee((Employee) hospitalService.getObject(Integer.parseInt(sendToID), Employee.class));

				System.out.println("###########Single##########");
				System.out.println(
						messageBody + "\t" + fromEmployee.getEmployeeId() + "\t" + sendToID + "\t" + patientID);

				hospitalService.composeMessage(message);
			}
			
			response.sendRedirect("compose.jsp?success=true");

		} catch (Exception ex) {
			try {
				response.sendRedirect("compose.jsp?error=true");
			} catch (IOException e) {
				e.printStackTrace();
			}
			ex.printStackTrace();
		}
	}

}
