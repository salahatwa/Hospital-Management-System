//package com.hospital.reports;
//
//import java.io.ByteArrayOutputStream;
//import java.io.File;
//import java.io.FileOutputStream;
//import java.io.InputStream;
//import java.io.OutputStream;
//
//import org.apache.commons.collections.map.HashedMap;
//
//import net.sf.jasperreports.engine.JREmptyDataSource;
//import net.sf.jasperreports.engine.JRException;
//import net.sf.jasperreports.engine.JasperCompileManager;
//import net.sf.jasperreports.engine.JasperFillManager;
//import net.sf.jasperreports.engine.JasperPrint;
//import net.sf.jasperreports.engine.JasperReport;
//import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
//import net.sf.jasperreports.engine.design.JasperDesign;
//import net.sf.jasperreports.engine.export.JRXlsExporter;
//import net.sf.jasperreports.engine.export.JRXlsExporterParameter;
//import net.sf.jasperreports.engine.xml.JRXmlLoader;
//
//public class TestReports {
//	 public static JasperDesign jasperDesign;
//	    public static JasperPrint jasperPrint;
//	    public static JasperReport jasperReport;
//	    public static String reportTemplateUrl = "person-template.jrxml";
//	public static void main(String[] args) {
////		//String pdfFileName = "D:/JasperReports/StatisticsrReport.pdf";
////		response.setContentType("application/x-download");
////		response.addHeader("Content-disposition", "attachment; filename=StatisticsrReport1.pdf");
////		OutputStream out = response.getOutputStream();
////		JasperExportManager.exportReportToPdfStream(jasperPrint,out);//export PDF directly
////		//return null ActionForward, no extra data is appended to output stream
//		
////		String reportFileName = JasperCompileManager.compileReportToFile(request.getRealPath("/reports") + "/" + jrept);
//	
//		//=============
//		
////		JasperDesign jasperDesign= JasperManager.loadXmlDesign(getServletContext().getRealPath("/")+"reports/BirthdayPie.jrxml");
////		JasperReport jasperReport = JasperManager.compileReport(jasperDesign);
////		Map parameters = new HashMap();
////		parameters.put("ReportTitle", "Birth Day Pie Report");
////		parameters.put("sub",getServletContext().getRealPath("/"));
////		Class.forName("org.postgresql.Driver");
////		Connection con1 = DriverManager.getConnection("jdbc:postgresql://localhost:5432/peopleWARE","postgres","postgres"); 
////		byte[] bytes = JasperRunManager.runReportToPdf(	jasperReport, parameters, con1);
////		response.setContentType("application/pdf");
////		response.setContentLength(bytes.length);
////		ServletOutputStream ouputStream = response.getOutputStream();
////		ouputStream.write(bytes, 0, bytes.length);
////		ouputStream.flush();
////		ouputStream.close();
//		try
//	        {
//	            InputStream resourceAsStream = Thread.currentThread().getContextClassLoader()
//	                    .getResourceAsStream(reportTemplateUrl);
//	            //get report file and then load into jasperDesign
//	            Object jasperDesign = JRXmlLoader.load(resourceAsStream);
//	            //compile the jasperDesign
////	            jasperReport = JasperCompileManager.com
//	            
//	            ByteArrayOutputStream output = new ByteArrayOutputStream();
//	            OutputStream outputfile = new FileOutputStream(new File("c:/temp/person.xls"));
//	            
//	            //fill the ready report with data and parameter
//	            jasperPrint = JasperFillManager.fillReport(jasperReport, new HashedMap(),new JREmptyDataSource() );
//	            
//	            //coding for Excel
//	            JRXlsExporter exporterXls = new JRXlsExporter();
//	            exporterXls.setParameter(JRXlsExporterParameter.JASPER_PRINT, jasperPrint);
//	            exporterXls.setParameter(JRXlsExporterParameter.OUTPUT_STREAM, output);
//	            exporterXls.setParameter(JRXlsExporterParameter.IS_ONE_PAGE_PER_SHEET, Boolean.TRUE);
//	            exporterXls.setParameter(JRXlsExporterParameter.IS_DETECT_CELL_TYPE, Boolean.TRUE);
//	            exporterXls.exportReport();
//	            outputfile.write(output.toByteArray());
//	            
//	        }
//	        catch (JRException e)
//	        {
//	            e.printStackTrace();
//	        }
//	
//	}
//
//}
