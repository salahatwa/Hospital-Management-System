<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@page import="com.hospital.entities.HospitalService"%>
<%@page import="com.hospital.entities.AdminDAO"%>
<%@page import="com.hospital.models.Employee"%>
<%@page import="com.hospital.models.EmployeeStatatistic"%>
<%@page import="java.util.List"%>

<%
	Employee employee = (Employee) session.getAttribute("employee");
	AdminDAO adminDAO = HospitalService.getInstance();
	List<EmployeeStatatistic> employeeStatatistics = adminDAO.getEmployeeStatistic();
	request.setAttribute("employeeStatatistics", employeeStatatistics);
%>


<div class="content">
	<div class="container-fluid">
		<div class="row">

			<%
				for (EmployeeStatatistic employeeStatatistic : employeeStatatistics) {
			%>
			<form action="Process?action=DownloadEmployeeReport" method="POST">
			<div class="col-lg-3 col-md-6 col-sm-6">
				<div class="card card-stats">
					<div class="card-header" data-background-color="red">
						<div class="picture-container">
							<h6><%=employeeStatatistic.getType()%></h6>
						</div>
					</div>
					<div class="card-content">
						<p class="category">Number</p>
						<h3 class="title">
							<%=employeeStatatistic.getNumber().intValue()%>
							<small>EM</small>
						</h3>
					</div>
					<div class="card-footer">
						<div class="stats">
							<i class="material-icons">access_time</i>
							<%=employeeStatatistic.getType()%>
							<%=employeeStatatistic.getNumber().intValue()%>
							Employee

						</div>
						
						<input type="hidden" name="employeeType" value="<%=employeeStatatistic.getType() %>" />
						
                                                
                                                
                                                
                                                <a href="Process?action=DownloadEmployeeReport&employeeType=<%=employeeStatatistic.getType() %>"  target="_blank"
								class='btn btn-finish btn-fill btn-warning btn-wd btn-sm'
                                                                name='finish' value='Report' >Employee Report</a>
						
					</div>
				</div>
			</div>
			</form>
			<%
				}
			%>


		</div>
	</div>