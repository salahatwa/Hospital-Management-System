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
		$('#dieseasePatientTable').DataTable();
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
	DoctorDAO doctorDAO = HospitalService.getInstance();

	Employee currentEmp = (Employee) session.getAttribute("employee");

	List<Patient> patients = doctorDAO.getListObjects(Patient.class);

	List<Disease> diseases = doctorDAO.getAllDiseaseByEmployeeID(currentEmp.getEmployeeId());
%>
<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-9 col-md-offset-1">
				<div class="card">
					<div class="card-header text-center" data-background-color="red">
						<h4 class="title">
							Write Disease Patient
							</h3>
							<p class="category">Write Disease Patient</p>
					</div>
					<div class="card-content">
						<div class="table-responsive table-upgrade">
							<div class="card card-nav-tabs">
								<div class="card-header" data-background-color="red">
									<div class="nav-tabs-navigation">
										<div class="nav-tabs-wrapper">
											<span class="nav-tabs-title">Disease Patient:</span>
											<ul class="nav nav-tabs" data-tabs="tabs">
												<li class="active"><a href="#disease" data-toggle="tab">
														<i class="material-icons">bug_report</i> Disease Patient
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
												id="dieseasePatientTable">
												<thead>
													<th>Patient</th>
													<th>Disease</th>
													<th>Patient Note</th>
													<th>When You write Disease</th>
													<th></th>
												</thead>
												<tbody>

													<%
														for (Disease disease : diseases) {
													%>

													<tr>
														<td><%=disease.getPatient().getName()%> <%=disease.getPatient().getFatherName()%>
															<%=disease.getPatient().getFamilyName()%></td>
														<td><%=disease.getDisease()%></td>
														<td><%=disease.getNote()%></td>
														<td><%=disease.getDiseaseDate()%></td>

														<td class="td-actions text-right"><a
															href="dieseasePatient.jsp?udis=<%=disease.getDiseaseId()%>"
															rel="tooltip" title="Edit disease"
															class="btn btn-primary btn-simple btn-xs"> <i
																class="material-icons">edit</i>
														</a> <a
															href="Process?action=DeleteDiesease&udis=<%=disease.getDiseaseId()%>"
															rel="tooltip" title="Remove"
															class="btn btn-danger btn-simple btn-xs"> <i
																class="material-icons">close</i>
														</a></td>
													</tr>

													<%
														}
													%>

												</tbody>
											</table>


											<c:choose>

												<c:when test="${ not empty param['udis'] }">
													<%
														int diseaseID = Integer.parseInt(request.getParameter("udis"));
																Disease selectedDisease = (Disease) doctorDAO.getObject(diseaseID, Disease.class);
													%>

													<form action="Process?action=UpdateDiesease" method="POST">
														<input type="hidden" name="diseaseID"
															value="<%=diseaseID%>" />


														<div class="col-sm-3">
															<div class="form-group">
																<label>Patient <small>(required)</small></label> <select
																	name="patientID" class="form-control" required>
																	<option>Select Patient</option>
																	<%
																		for (Patient patient : patients) {
																	%>
																	<option value="<%=patient.getPatientId()%>"
																		<%if (selectedDisease.getPatient().getPatientId() == patient.getPatientId())
							out.print("selected");%>>
																		<%=patient.getName()%>
																		<%=patient.getFatherName()%>
																		<%=patient.getFamilyName()%>
																	</option>
																	<%
																		}
																	%>
																</select>
															</div>
														</div>

														<div class="col-sm-3">
															<div class="form-group">
																<label>Disease <small>(required)</small></label> <input
																	required name="disease" type="text"
																	class="form-control" placeholder="Disease"
																	value="<%=selectedDisease.getDisease()%>">
															</div>
														</div>


														<div class="col-sm-3">
															<div class="form-group">
																<label>Note <small>(required)</small></label> <input
																	required name="note" type="text" class="form-control"
																	placeholder="Patient Note"
																	value="<%=selectedDisease.getNote()%>">
															</div>
														</div>


														<div class="col-sm-3">
															<div class="form-group">
																<input type="submit"
																	class="btn btn-round btn-fill btn-info"
																	value="Update Disease" />
															</div>
														</div>
													</form>

												</c:when>

												<c:otherwise>
													<form action="Process?action=AddDiesease" method="POST">



														<div class="col-sm-3">
															<div class="form-group">
																<label>Patient <small>(required)</small></label> <select
																	name="patientID" class="form-control" required>
																	<option>Select Patient</option>
																	<%
																		for (Patient patient : patients) {
																	%>
																	<option value="<%=patient.getPatientId()%>">
																		<%=patient.getName()%>
																		<%=patient.getFatherName()%>
																		<%=patient.getFamilyName()%>
																	</option>
																	<%
																		}
																	%>
																</select>
															</div>
														</div>


														<div class="col-sm-3">
															<div class="form-group">
																<label>Disease <small>(required)</small></label> <input
																	required name="disease" type="text"
																	class="form-control" placeholder="Disease">
															</div>
														</div>

														<div class="col-sm-3">
															<div class="form-group">
																<label>Note <small>(required)</small></label> <input
																	 name="note" type="text" class="form-control"
																	placeholder="Patient Note">
															</div>
														</div>


														<div class="col-sm-3">
															<div class="form-group">
																<input type="submit"
																	class="btn btn-round btn-fill btn-info"
																	value="Disease" />
															</div>
														</div>

													</form>


												</c:otherwise>

											</c:choose>



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

