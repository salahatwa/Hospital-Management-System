package com.hospital.authentication;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hospital.actions.AccountancyListener;
import com.hospital.actions.AdminListener;
import com.hospital.actions.DoctorListener;
import com.hospital.actions.PharmatiestListener;
import com.hospital.actions.ReceptioniestListener;
import com.hospital.actions.ReportListener;
import com.hospital.actions.UserListener;
import com.hospital.utils.ActionType;

@WebServlet("/Process")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50) // 50MB
public class Process extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private AdminListener adminListener = AdminListener.getInstance();
	private UserListener userListener = UserListener.getInstance();
	private ReceptioniestListener receptioniestListener = ReceptioniestListener.getInstance();
	private DoctorListener doctorListener = DoctorListener.getInstance();
	private PharmatiestListener pharmatiestListener = PharmatiestListener.getInstance();
	private AccountancyListener accountancyListener = AccountancyListener.getInstance();
	private ReportListener reportListener = ReportListener.getInstance();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");

		System.out.println("IN servlet");

		if (action.equals(ActionType.AddEmployee.name())) {
			adminListener.addEmployee(request, response);
		} else if (action.equals(ActionType.UpdateEmployee.name())) {

			adminListener.updateEmployee(request, response);

		} else if (action.equals(ActionType.deleteEmployee.name())) {
			adminListener.deleteEmployee(request, response);

		} else if (action.equals(ActionType.AddRoom.name())) {
			adminListener.addRoom(request, response);

		} else if (action.equals(ActionType.DeleteRoom.name())) {
			adminListener.deleteRoom(request, response);

		} else if (action.equals(ActionType.UpdateRoom.name())) {
			adminListener.updateRoom(request, response);

		} else if (action.equals(ActionType.AddServiceTime.name())) {
			adminListener.addServiceTime(request, response);

		}

		else if (action.equals(ActionType.UpdateServiceTime.name())) {
			adminListener.updateServiceTime(request, response);

		}

		else if (action.equals(ActionType.DeleteServiceTime.name())) {
			adminListener.deleteServiceTime(request, response);

		}

		else if (action.equals(ActionType.AddPatient.name())) {
			receptioniestListener.addpatient(request, response);

		}

		else if (action.equals(ActionType.DeletePatient.name())) {
			receptioniestListener.deletePatient(request, response);

		} else if (action.equals(ActionType.UpdatePatient.name())) {
			receptioniestListener.updatePatient(request, response);

		} else if (action.equals(ActionType.BookBed.name())) {
			receptioniestListener.bookBed(request, response);

		} else if (action.equals(ActionType.DeleteBookBed.name())) {
			receptioniestListener.deleteBookedBed(request, response);

		} else if (action.equals(ActionType.UpdateBookBed.name())) {
			receptioniestListener.updateBookedBed(request, response);

		} else if (action.equals(ActionType.AddDiesease.name())) {
			doctorListener.addDiesease(request, response);

		} else if (action.equals(ActionType.DeleteDiesease.name())) {
			doctorListener.deleteDiesease(request, response);

		} else if (action.equals(ActionType.UpdateDiesease.name())) {
			doctorListener.updateDiesease(request, response);
		}

		else if (action.equals(ActionType.AddDrug.name())) {
			pharmatiestListener.addDrug(request, response);

		}

		else if (action.equals(ActionType.DeleteDrug.name())) {
			pharmatiestListener.deleteDrug(request, response);

		}

		else if (action.equals(ActionType.UpdateDrug.name())) {
			pharmatiestListener.updateDrug(request, response);
		}

		else if (action.equals(ActionType.SellDrug.name())) {
			pharmatiestListener.sellDrug(request, response);

		}

		else if (action.equals(ActionType.ReverseSellDrug.name())) {
			pharmatiestListener.deleteSellDrug(request, response);

		}

		else if (action.equals(ActionType.UpdateSellDrug.name())) {
			pharmatiestListener.updateSellDrug(request, response);

		} else if (action.equals(ActionType.InvoiceDrug.name())) {
			pharmatiestListener.getDrugInvoice(request, response);

		}

		else if (action.equals(ActionType.CheckedPatientFees.name())) {
			accountancyListener.checkedPatientFees(request, response);

		}

		else if (action.equals(ActionType.DownloadEmployeeReport.name())) {
			reportListener.downloadEmployeeReport(request, response);
		}

		else if (action.equals(ActionType.ChangePassword.name())) {
			boolean flag = userListener.changePassword(request, response);
			if (flag)
				response.sendRedirect("changePassword.jsp");
			else
				response.sendRedirect("changePassword.jsp?Error=true");
		} else if (action.equals(ActionType.ComposeEmail.name())) {
			userListener.composeEmail(request, response);

		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
