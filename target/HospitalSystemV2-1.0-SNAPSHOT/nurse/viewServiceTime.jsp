<%@page import="com.hospital.entities.NurseDAO"%>
<%@page import="com.hospital.models.NurseServiceTime"%>
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
		$('#serviceTimeTable').DataTable();
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
	NurseDAO nurseDAO = HospitalService.getInstance();

	Employee employee3 = (Employee) session.getAttribute("employee");
	List<NurseServiceTime> nurseServiceTimes = nurseDAO.getAllServiceTime(employee3.getEmployeeId());
%>
<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<div class="card">
					<div class="card-header text-center" data-background-color="red">
						<h4 class="title">
							View Service Time
							</h3>
							<p class="category">View Service Time</p>
					</div>
					<div class="card-content">
						<div class="table-responsive table-upgrade">
							<div class="card card-nav-tabs">
								<div class="card-header" data-background-color="red">
									<div class="nav-tabs-navigation">
										<div class="nav-tabs-wrapper">
											<span class="nav-tabs-title">Service Time:</span>
											<ul class="nav nav-tabs" data-tabs="tabs">
												<li class="active"><a href="#disease" data-toggle="tab">
														<i class="material-icons">bug_report</i>Service Time
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
												id="serviceTimeTable">
												<thead>
													<th>Nurse Name</th>
													<th>Service Date</th>
													<th>Shift Time</th>
													<th>Department</th>
													
												</thead>
												<tbody>

													<%
														for (NurseServiceTime nurseServiceTime : nurseServiceTimes) {
													%>

													<tr>

														<td><%=nurseServiceTime.getNurse().getFirstName()%> <%=nurseServiceTime.getNurse().getFatherName()%>
															<%=nurseServiceTime.getNurse().getFamilyName()%></td>
														<td><%=nurseServiceTime.getServiceDate()%></td>
														<td><%=nurseServiceTime.getShiftTime().getFromTime()%>
															: <%=nurseServiceTime.getShiftTime().getToTime()%></td>
														<td><%=nurseServiceTime.getDepartment()%></td>
														
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

