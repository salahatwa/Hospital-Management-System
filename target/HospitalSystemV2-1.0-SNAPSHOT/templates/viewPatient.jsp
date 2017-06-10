<%@page import="com.hospital.entities.DoctorDAO"%>
<%@page import="com.hospital.models.Disease"%>
<%@page import="com.hospital.models.BookBed"%>
<%@page import="com.hospital.models.Patient"%>
<%@page import="com.hospital.entities.ReceptioniestDAO"%>
<%@page import="com.hospital.models.Room"%>
<%@page import="com.hospital.entities.AdminDAO"%>
<%@page import="com.hospital.models.RoomType"%>
<%@page import="com.hospital.models.Employee"%>
<%@page import="com.hospital.models.Message"%>
<%@page import="java.util.List"%>
<%@page import="com.hospital.entities.HospitalService"%>
<%@page import="com.hospital.entities.UserDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="assets/js/jquery.min.js"></script>

<script>
	$(document).ready(function() {
		$('#viewPatientTable').DataTable();
	});
</script>
<!--  Made With Get Shit Done Kit  -->
<a href="#" class="made-with-mk">
	<div class="brand">Eng</div>
	<div class="made-with">
		Made with <strong>Mustafa</strong>
	</div>
</a>
<%
	UserDAO userDAO6 = HospitalService.getInstance();


	List<Disease> diseases = userDAO6.getListObjects(Disease.class);
%>
<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-10 col-md-offset-1">
				<div class="card">
					<div class="card-header text-center" data-background-color="red">
						<h4 class="title">
							View Patient Disease
							</h3>
							<p class="category">View Patient Disease</p>
					</div>
					<div class="card-content">
						<div class="table-responsive table-upgrade">
							<div class="card card-nav-tabs">
								<div class="card-header" data-background-color="red">
									<div class="nav-tabs-navigation">
										<div class="nav-tabs-wrapper">
											<span class="nav-tabs-title">Patient Disease:</span>
											<ul class="nav nav-tabs" data-tabs="tabs">
												<li class="active"><a href="#disease" data-toggle="tab">
														<i class="material-icons">bug_report</i>Patient Disease
														<div class="ripple-container"></div>
												</a></li>

											</ul>
										</div>
									</div>
								</div>

								<div class="card-content">
									<div class="tab-content">
										<div class="tab-pane active" id="disease">
											<table
												class="table table-striped table-bordered table-hover dt-responsive "
												id="viewPatientTable">
												<thead>
													<th>Patient</th>
													<th>Patient Blood_Group</th>
													<th>Disease</th>
													<th>Time Doctor Write Disease</th>
													<th>Doctor Notes</th>
													
													<th>Doctor</th>
												</thead>
												<tbody>

													<%
														for (Disease disease : diseases) {
													%>

													<tr>
														<td><%=disease.getPatient().getName()%> <%=disease.getPatient().getFatherName()%>
															<%=disease.getPatient().getFamilyName()%></td>
															
														<td><%=disease.getPatient().getBloodGroup().getBloodGroupName()%></td>
														<td><%=disease.getDisease()%></td>
														
														<td><%=disease.getDiseaseDate()%></td>
														<td><%=disease.getNote()%></td>
														
														<td><%=disease.getEmployee().getFirstName()%> <%=disease.getEmployee().getFatherName()%> <%=disease.getEmployee().getFamilyName()%></td>

													
													</tr>

													<%
														}
													%>

												</tbody>
											</table>

										</div>
									</div>
								</div>
							</div>


						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

