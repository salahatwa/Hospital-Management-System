<%@page import="com.hospital.utils.FormateDate"%>
<%@page import="com.hospital.models.BloodGroup"%>
<%@page import="com.hospital.entities.ReceptioniestDAO"%>
<%@page import="com.hospital.models.Patient"%>
<%@page import="com.hospital.models.Category"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.hospital.models.Employee"%>
<%@page import="java.util.List"%>
<%@page import="com.hospital.entities.HospitalService"%>
<%@page import="com.hospital.entities.AdminDAO"%>

<script src="assets/js/jquery.min.js"></script>

<script>
	$(document).ready(function() {
		$('#allPatients').DataTable();
	});
</script>

<%
	ReceptioniestDAO receptioniestDAO = HospitalService.getInstance();

	Employee currentEmp = (Employee) session.getAttribute("employee");
	List<Patient> patients = receptioniestDAO.getListObjects(Patient.class);
	List<BloodGroup> bloodGroups = receptioniestDAO.getListObjects(BloodGroup.class);

	request.setAttribute("patients", patients);
	request.setAttribute("bloodGroups", bloodGroups);

	int selectedPatientID = Integer.parseInt(request.getParameter("uempid"));
	Patient selectedPatient = (Patient) receptioniestDAO.getObject(selectedPatientID, Patient.class);
%>


<!--  Made With Get Shit Done Kit  -->
<a href="#" class="made-with-mk">
	<div class="brand">Eng</div>
	<div class="made-with">
		Made with <strong>Mustafa</strong>
	</div>
</a>

<div class="content">
	<div class="container-fluid">

		<div class="col-md-6">


			<div class="wizard-card" data-color="red" id="wizardProfile">
				<form method="POST" action="Process?action=UpdatePatient">
					<!--        You can switch ' data-color="orange" '  with one of the next bright colors: "blue", "green", "orange", "red"          -->

					<div class="wizard-header">
						<h3>
							<b>Add</b> Patient info <br> <small>This information
								about Patient.</small>
						</h3>
					</div>


					<div class="wizard-navigation">
						<ul>
							<li><a href="#about" data-toggle="tab">About</a></li>
							<li><a href="#skin" data-toggle="tab">Next Of kin</a></li>
						</ul>

					</div>

					<div class="tab-content">
						<div class="tab-pane" id="about">
							<div class="row">
								<h4 class="info-text">Basic Patient Information</h4>

								<input type="hidden" name="selectedPatient"
									value="<%=selectedPatientID%>" />

								<div class="col-sm-3">
									<div class="form-group">
										<label>First Name <small>(required)</small></label> <input
											name="firstname" type="text" class="form-control"
											value="<%=selectedPatient.getName()%>"
											>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="form-group">
										<label>Father Name <small>(required)</small></label> <input
											name="fathername" type="text" class="form-control"
											placeholder="Salah..."
											value="<%=selectedPatient.getFatherName()%>">
									</div>
								</div>
								<div class="col-sm-3">
									<div class="form-group">
										<label>Family Name <small>(required)</small></label> <input
											name="familyname" type="text" class="form-control"
											
											value="<%=selectedPatient.getFamilyName()%>">
									</div>
								</div>


								<div class="col-sm-3">
									<div class="form-group">
										<label>Address <small>(required)</small></label> <input
											name="address" type="text" class="form-control"
											
											value="<%=selectedPatient.getAddress()%>">
									</div>
								</div>





								<div class="col-sm-3 col-sm-offset-1">
									<div class="form-group">
										<label>Email </label> <input name="email" type="email"
											class="form-control" placeholder="salahatwa@outlook.com"
											value="<%=selectedPatient.getEmail()%>">
									</div>
								</div>


							<div class="col-sm-3">
									<div class="form-group">
										<div  id="sandbox-container">
											<label>Date of Birth</label>
											<div class="input-daterange input-group" id="datepicker">

												<input value=" <%= FormateDate.getStringDate(selectedPatient.getDob())%>" class="form-control" name="dob" type="text"  required readonly>
											<!-- 	<span class="input-group-addon"></span> -->
											</div>

										</div>
									</div>
								</div>



								<div class="col-sm-3 col-sm-offset-1">
									<div class="form-group">
										<label>Phone <small>(required)</small></label> <input
											type="number" class="form-control" name="phone"
											placeholder="01091687523" required
											value="<%=selectedPatient.getPhone()%>" />
									</div>
								</div>

								<div class="col-sm-3 col-sm-offset-1">
									<div class="form-group">
										<label for="radio">Select Gender</label><br>
										<div class="radio">
											<label><input type="radio" name="gender" required
												value="male" required
												<%if (selectedPatient.getGender().equals("male")) {%> checked
												<%}%> /> Male</label> <label><input type="radio"
												name="gender" value="female" required
												<%if (selectedPatient.getGender().equals("female")) {%>
												checked <%}%> /> Female</label>
										</div>
									</div>
								</div>



								<div class="col-sm-3">
									<div class="form-group">
										<label>Blood Type <small>(required)</small></label> <select
											class="form-control" name="bloodGroupID" required>
											<option value="">Select Blood Type</option>
											<%
												for (BloodGroup bloodGroup : bloodGroups) {
											%>
											<option value="<%=bloodGroup.getBloodGroupId()%>"
												<%if (selectedPatient.getBloodGroup().getBloodGroupId() == bloodGroup.getBloodGroupId()) {%>
												selected <%}%>><c:out
													value="<%=bloodGroup.getBloodGroupName()%>" /></option>
											<%
												}
											%>

										</select>
									</div>
								</div>





							</div>
						</div>
						<div class="tab-pane" id="skin">
							<h4 class="info-text">Next Of kin</h4>
							<div class="row">

								<div class="col-sm-3 col-sm-offset-1">
									<div class="form-group">
										<label>Full Name <small>(required)</small></label> <input
											name="nfullname" type="text" class="form-control"
											placeholder="mostafa abdo grgs.."
											value="<%=selectedPatient.getNextOfKin().getFullName()%>">
									</div>
								</div>


								<div class="col-sm-3 col-sm-offset-1">
									<div class="form-group">
										<label>Address <small>(required)</small></label> <input
											name="naddress" type="text" class="form-control"
											value="<%=selectedPatient.getNextOfKin().getAddress()%>
											placeholder="
											OrabiSt...">
									</div>
								</div>

								<div class="col-sm-3 col-sm-offset-1">
									<div class="form-group">
										<label>Relationship <small>(required)</small></label> <input
											name="nrelationship" type="text" class="form-control"
											value="<%=selectedPatient.getNextOfKin().getRelationship()%>
											placeholder="
											OrabiSt...">
									</div>
								</div>

								<div class="col-sm-3 col-sm-offset-1">
									<div class="form-group">
										<label>Phone <small>(required)</small></label> <input
											type="number" class="form-control" name="nphone"
											value="<%=selectedPatient.getNextOfKin().getPhone()%>"
											placeholder="01091687523" required />
									</div>
								</div>

							</div>
						</div>
					</div>
					<div class="wizard-footer height-wizard">
						<div class="pull-right">
							<input type='button'
								class='btn btn-next btn-fill btn-warning btn-wd btn-sm'
								name='next' value='Next' /> <input type='submit'
								class='btn btn-finish btn-fill btn-warning btn-wd btn-sm'
								name='finish' value='Finish' />

						</div>

						<div class="pull-left">
							<input type='button'
								class='btn btn-previous btn-fill btn-default btn-wd btn-sm'
								name='previous' value='Previous' />
						</div>
						<div class="clearfix"></div>
					</div>

				</form>
			</div>

			<!-- wizard container -->

		</div>


		<div class="col-md-6">
			<div class="card col-sm-offset-1">
				<div class="card-header" data-background-color="red">
					<h4 class="title">All Employees</h4>
					<p class="category"><%=patients.size()%>
						Patient's
					</p>
				</div>

				<form action="" method="POST">
					<table
						class="table table-striped table-bordered table-hover dt-responsive "
						id="allPatients">
						<thead class="text-primary">
							<th>Name</th>
							<th>Gender</th>
							<th>Blood Group</th>
							<th>Address</th>
							<th></th>
						</thead>
						<tbody>
							<c:forEach items="${patients}" var="patient">
								<tr>
									<td><c:out value="${patient.name}" /> <c:out
											value="${patient.fatherName}" /> <c:out
											value="${patient.familyName}" /></td>
									<td><c:out value="${patient.gender}" /></td>
									<td><c:out value="${patient.bloodGroup.bloodGroupName}" /></td>
									<td><c:out value="${patient.address}" /></td>
									<td><a href="patientmgmt.jsp?uempid=${patient.patientId}"><i
											class="material-icons">edit</i></a> <a
										href="Process?action=DeletePatient&dempid=${patient.patientId}"><i
											class="material-icons">close</i></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

				</form>

			</div>
		</div>

	</div>
</div>