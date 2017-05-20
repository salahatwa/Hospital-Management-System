package com.hospital.actions;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hospital.entities.AdminDAO;
import com.hospital.entities.HospitalService;
import com.hospital.entities.UserDAO;
import com.hospital.models.Employee;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanArrayDataSource;

public class ReportListener {

	private static ReportListener reportListener = new ReportListener();

	private UserDAO userDAO = HospitalService.getInstance();

	private ReportListener() {
	}

	public static ReportListener getInstance() {
		return reportListener;
	}

	private JRDataSource createReportDataSource(String employeeType) {
		JRBeanArrayDataSource dataSource;
		Object[] reportRows = initializeBeanArray(employeeType);
		dataSource = new JRBeanArrayDataSource(reportRows);
		return dataSource;
	}

	private Object[] initializeBeanArray(String employeeType) {
		List<Employee> employees =userDAO.getEmployees(employeeType);
		Object[] ems = employees.toArray();
		return ems;
	}

	public void downloadEmployeeReport(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String employeeType=request.getParameter("employeeType");
		
		ServletOutputStream servletOutputStream = response.getOutputStream();

		String imagePath = request.getServletContext().getRealPath("/reports/invoice_logo.png");

		InputStream reportStream = request.getServletContext().getResourceAsStream("/reports/employeeReport.jrxml");
		try {
			JRDataSource dataSource = createReportDataSource(employeeType);
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

}
