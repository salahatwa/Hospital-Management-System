package com.hospital.actions;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hospital.entities.HospitalService;
import com.hospital.entities.PharmatiestDAO;
import com.hospital.models.Drug;
import com.hospital.models.Employee;
import com.hospital.models.Patient;
import com.hospital.models.PatientDrugInvoice;
import com.hospital.models.Pharmatiest;
import com.hospital.models.SelledDrug;
import com.hospital.utils.FormateDate;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanArrayDataSource;

public class PharmatiestListener {

	private HttpSession httpSession;

	private static PharmatiestListener pharmatiestListener = new PharmatiestListener();

	private static PharmatiestDAO pharmatiestDAO = HospitalService.getInstance();

	private PharmatiestListener() {
	}

	public static PharmatiestListener getInstance() {
		return pharmatiestListener;
	}

	public void addDrug(HttpServletRequest request, HttpServletResponse response) {

		try {
			httpSession = request.getSession();
			Employee employee = (Employee) httpSession.getAttribute("employee");

			String name = request.getParameter("name");
			String cost = request.getParameter("cost");
			String quantity = request.getParameter("quantity");
			String startDate = request.getParameter("startDate");
			String drug_expired = request.getParameter("drug_expired");

			Drug drug = new Drug();
			drug.setName(name);
			drug.setCost(Double.parseDouble(cost));
			drug.setDrug_expired(FormateDate.getFormatedDate(drug_expired));
			drug.setStartDate(FormateDate.getFormatedDate(startDate));
			drug.setQuantity(Integer.parseInt(quantity));
			drug.setEmployee(employee);

			pharmatiestDAO.saveObject(drug);

			response.sendRedirect("drugmgmt.jsp?add=true");

		} catch (Exception ex) {

			try {
				response.sendRedirect("drugmgmt.jsp?error=true");
			} catch (IOException e) {
				e.printStackTrace();
			}
			ex.printStackTrace();
		}

	}

	public void updateDrug(HttpServletRequest request, HttpServletResponse response) {
		try {
			int drugID = Integer.parseInt(request.getParameter("drugID"));

			httpSession = request.getSession();
			Employee employee = (Employee) httpSession.getAttribute("employee");

			String name = request.getParameter("name");
			String cost = request.getParameter("cost");
			String quantity = request.getParameter("quantity");
			String unitPerDay = request.getParameter("unitPerDay");
			String startDate = request.getParameter("startDate");
			String drug_expired = request.getParameter("drug_expired");

			Drug drug = (Drug) pharmatiestDAO.getObject(drugID, Drug.class);
			drug.setName(name);
			drug.setCost(Double.parseDouble(cost));
			drug.setDrug_expired(FormateDate.getFormatedDate(drug_expired));
			drug.setStartDate(FormateDate.getFormatedDate(startDate));
			drug.setQuantity(Integer.parseInt(quantity));

			drug.setEmployee(employee);

			System.out.println(drugID + "\t:::::::::::::::" + drug.getDrugId());
			pharmatiestDAO.updateObject(drug);

			response.sendRedirect("drugmgmt.jsp?update=true");

		} catch (Exception ex) {
			try {
				response.sendRedirect("drugmgmt.jsp?error=true");
			} catch (IOException e) {
				e.printStackTrace();
			}
			ex.printStackTrace();
		}

	}

	public void deleteDrug(HttpServletRequest request, HttpServletResponse response) {
		try {
			int drugID = Integer.parseInt(request.getParameter("dempid"));
			Drug drug = (Drug) pharmatiestDAO.getObject(drugID, Drug.class);
			drug.setEmployee(null);

			pharmatiestDAO.deleteObject(drug);

			response.sendRedirect("drugmgmt.jsp?delete=true");
		} catch (Exception ex) {
			try {
				response.sendRedirect("drugmgmt.jsp?error=true");
			} catch (IOException e) {
				e.printStackTrace();
			}
			ex.printStackTrace();
		}

	}

	public void sellDrug(HttpServletRequest request, HttpServletResponse response) {

		try {
			httpSession = request.getSession();
			Pharmatiest employee = (Pharmatiest) httpSession.getAttribute("employee");

			int quantity = Integer.parseInt(request.getParameter("quantity"));

			int drugID = Integer.parseInt(request.getParameter("drugID"));

			String unitPerDay = request.getParameter("unitPerDay");

			String startTake = request.getParameter("startTake");
			String endTake = request.getParameter("endTake");

			System.out.println("Drug ID:" + drugID);
			Drug drug = (Drug) pharmatiestDAO.getObject(drugID, Drug.class);

			int patientID = Integer.parseInt(request.getParameter("patientID"));
			Patient patient = (Patient) pharmatiestDAO.getObject(patientID, Patient.class);

			SelledDrug selledDrug = new SelledDrug();
			selledDrug.setSelledDrugID(pharmatiestDAO.getMaxIDObject());
			selledDrug.setPatient(patient);
			selledDrug.setPharmatiest(employee);
			selledDrug.setQuantity(quantity);
			selledDrug.setDrug(drug);
			selledDrug.setSelledDate(new Date());
			selledDrug.setUnitPerDay(unitPerDay);
			selledDrug.setEndDate(FormateDate.getFormatedDate(endTake));
			selledDrug.setStartDate(FormateDate.getFormatedDate(startTake));

			// quantity selled to patient must be less than The Total drug quantity
			if (quantity < drug.getQuantity()) {
				pharmatiestDAO.sellDrug(selledDrug);
				int quan=drug.getQuantity()-quantity;
				drug.setQuantity(quan);
				pharmatiestDAO.updateObject(drug);
				if(drug.getQuantity()<=50)
				 response.sendRedirect("selldrug.jsp?less50=true");	
				else
				 response.sendRedirect("selldrug.jsp?add=true");
			}
			else
			{
				response.sendRedirect("selldrug.jsp?more=true");
			}
		} catch (Exception ex) {
			try {
				response.sendRedirect("selldrug.jsp?error=true");
			} catch (IOException e) {
				e.printStackTrace();
			}
			ex.printStackTrace();
		}

	}

	public void updateSellDrug(HttpServletRequest request, HttpServletResponse response) {
		try {
			httpSession = request.getSession();

			int selledDrugID = Integer.parseInt(request.getParameter("selledDrugID"));

			int quantity = Integer.parseInt(request.getParameter("quantity"));

			int drugID = Integer.parseInt(request.getParameter("drugID"));
			Drug drug = (Drug) pharmatiestDAO.getObject(drugID, Drug.class);

			int patientID = Integer.parseInt(request.getParameter("patientID"));
			Patient patient = (Patient) pharmatiestDAO.getObject(patientID, Patient.class);

			String unitPerDay = request.getParameter("unitPerDay");
			String startTake = request.getParameter("startTake");
			String endTake = request.getParameter("endTake");

			SelledDrug selledDrug = new SelledDrug();
			selledDrug.setSelledDrugID(selledDrugID);
			selledDrug.setPatient(patient);
			selledDrug.setQuantity(quantity);
			selledDrug.setDrug(drug);
			selledDrug.setSelledDate(new Date());
			selledDrug.setUnitPerDay(unitPerDay);
			selledDrug.setEndDate(FormateDate.getFormatedDate(endTake));
			selledDrug.setStartDate(FormateDate.getFormatedDate(startTake));

			System.out.println("Selled Drug ID:" + selledDrugID);
			
			if (quantity < drug.getQuantity()) {
				pharmatiestDAO.updateObject(selledDrug);
				int quan=drug.getQuantity()-quantity;
				drug.setQuantity(quan);
				pharmatiestDAO.updateObject(drug);
				if(drug.getQuantity()<=50)
					 response.sendRedirect("selldrug.jsp?less50=true");	
				else
				     response.sendRedirect("selldrug.jsp?update=true");
			}
			else
			{
				response.sendRedirect("selldrug.jsp?more=true");
			}

		} catch (Exception ex) {
			try {
				response.sendRedirect("selldrug.jsp?error=true");
			} catch (IOException e) {
				e.printStackTrace();
			}
			ex.printStackTrace();
		}

	}

	public void deleteSellDrug(HttpServletRequest request, HttpServletResponse response) {
		try {
			int selledDrugID = Integer.parseInt(request.getParameter("usdrug"));
			SelledDrug selledDrug = (SelledDrug) pharmatiestDAO.getObject(selledDrugID, SelledDrug.class);
			selledDrug.setDrug(null);
			selledDrug.setPatient(null);
			selledDrug.setPharmatiest(null);
			

			pharmatiestDAO.deleteObject(selledDrug);

			response.sendRedirect("selldrug.jsp?delete=true");
		} catch (Exception ex) {
			try {
				response.sendRedirect("selldrug.jsp?error=true");
			} catch (IOException e) {
				e.printStackTrace();
			}
			ex.printStackTrace();
		}

	}

	public void getDrugInvoice(HttpServletRequest request, HttpServletResponse response) throws IOException {

		int drugID = Integer.parseInt(request.getParameter("usdrug"));
		SelledDrug selledDrug = (SelledDrug) pharmatiestDAO.getObject(drugID, SelledDrug.class);

		ServletOutputStream servletOutputStream = response.getOutputStream();

		String imagePath = request.getServletContext().getRealPath("/reports/invoice_logo.png");

		InputStream reportStream = request.getServletContext().getResourceAsStream("/reports/Invoice.jrxml");
		try {
			JRDataSource dataSource = createReportDataSource(selledDrug);
			JasperReport jasperReport = JasperCompileManager.compileReport(reportStream);

			HashMap map = new HashMap<>();
			map.put("IMAGE_PATH", imagePath);

			JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, map, dataSource);
			JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());

			response.setContentType("application/pdf");

			servletOutputStream.flush();
			servletOutputStream.close();

		} catch (Exception e) {
			// display stack trace in the browser
			StringWriter stringWriter = new StringWriter();
			PrintWriter printWriter = new PrintWriter(stringWriter);
			e.printStackTrace();

			response.setContentType("text/plain");
			response.getOutputStream().print(stringWriter.toString());
		}
	}

	private JRDataSource createReportDataSource(SelledDrug selledDrug) {
		JRBeanArrayDataSource dataSource;
		Object[] reportRows = initializeBeanArray(selledDrug);
		dataSource = new JRBeanArrayDataSource(reportRows);
		return dataSource;
	}

	private Object[] initializeBeanArray(SelledDrug selledDrug) {
		List<SelledDrug> allSelledDrugForEmployee = pharmatiestDAO
				.getAllSelledDrugForPatient(selledDrug.getPatient().getPatientId());

		PatientDrugInvoice[] patientDrugInvoices = new PatientDrugInvoice[allSelledDrugForEmployee.size()];

		double sum = 0;

		for (int i = 0; i < allSelledDrugForEmployee.size(); i++) {
			PatientDrugInvoice p = new PatientDrugInvoice();

			p.setAddress(allSelledDrugForEmployee.get(i).getPatient().getAddress());
			p.setBloodGroupName(allSelledDrugForEmployee.get(i).getPatient().getBloodGroup().getBloodGroupName());
			p.setEmail(allSelledDrugForEmployee.get(i).getPatient().getEmail());
			p.setFamilyName(allSelledDrugForEmployee.get(i).getPatient().getFamilyName());
			p.setFatherName(allSelledDrugForEmployee.get(i).getPatient().getFatherName());
			p.setGender(allSelledDrugForEmployee.get(i).getPatient().getGender());
			p.setJoiningDate(allSelledDrugForEmployee.get(i).getPatient().getJoiningDate());
			p.setPhone(allSelledDrugForEmployee.get(i).getPatient().getPhone());
			p.setDob(allSelledDrugForEmployee.get(i).getPatient().getDob());
			p.setName(allSelledDrugForEmployee.get(i).getPatient().getName());
			p.setPatientID(allSelledDrugForEmployee.get(i).getPatient().getPatientId());

			p.setCost(allSelledDrugForEmployee.get(i).getDrug().getCost());
			p.setDrugId(allSelledDrugForEmployee.get(i).getDrug().getDrugId());
			p.setDrugName(allSelledDrugForEmployee.get(i).getDrug().getName());

			p.setDrug_expired(allSelledDrugForEmployee.get(i).getEndDate());
			p.setStartDate(allSelledDrugForEmployee.get(i).getStartDate());
			p.setQuantity(allSelledDrugForEmployee.get(i).getQuantity());
			p.setUnitPerDay(allSelledDrugForEmployee.get(i).getUnitPerDay());
			sum += allSelledDrugForEmployee.get(i).getDrug().getCost() * allSelledDrugForEmployee.get(i).getQuantity();

			p.setTotalCost(sum);

			patientDrugInvoices[i] = p;
		}

		for (int i = 0; i < patientDrugInvoices.length; i++) {
			PatientDrugInvoice p = new PatientDrugInvoice();
			p = patientDrugInvoices[i];
			p.setTotalCost(sum);
			patientDrugInvoices[i] = p;
		}

		for (int i = 0; i < allSelledDrugForEmployee.size(); i++) {
			allSelledDrugForEmployee.get(i).setDrug(null);
			allSelledDrugForEmployee.get(i).setPatient(null);
			allSelledDrugForEmployee.get(i).setPharmatiest(null);

			pharmatiestDAO.deleteObject(allSelledDrugForEmployee.get(i));
		}
		return patientDrugInvoices;
	}
}
