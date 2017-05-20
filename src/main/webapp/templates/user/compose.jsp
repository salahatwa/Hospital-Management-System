<%@page import="com.hospital.utils.Entity"%>
<%@page import="com.hospital.models.Patient"%>
<%@page import="com.hospital.models.Employee"%>
<%@page import="java.util.List"%>
<%@page import="com.hospital.entities.HospitalService"%>
<%@page import="com.hospital.entities.UserDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!--  Made With Get Shit Done Kit  -->
<a href="#" class="made-with-mk">
	<div class="brand">Eng</div>
	<div class="made-with">
		Made with <strong>Mustafa</strong>
	</div>
</a>
<%
	UserDAO userDAO = HospitalService.getInstance();
        Employee currentEmployee=(Employee)session.getAttribute("employee");
	List<Employee> employees = userDAO.getListEmployeeWithout(currentEmployee.getEmployeeId());
	
	List<Patient> patients=userDAO.getListObjects(Patient.class);
%>

<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<div class="card">
					<div class="card-header text-center" data-background-color="red">
						<h4 class="title">
							Sent New Mail
							</h3>
							<p class="category">Sent E-Mails To different Employee's</p>
					</div>
					<div class="card-content">
						<div class="table-responsive table-upgrade">

							<form method="POST" action="Process?action=ComposeEmail">

								<div class="col-sm-10">
									<div class="form-group">
										<label>TO <small>(required)</small></label>
										<select name="sendToID">
										<option value="<%=Entity.Receptioniest.name()%>">All Receptioniest</option>
										 <%for(Employee em:employees){ %>
										  <option value="<%=em.getEmployeeId()%>"> <%=em.getType()%> / <%=em.getFirstName()%> <%=em.getFatherName()%> <%=em.getFamilyName()%></option>
										 <%} %>
										</select>
									</div>
								</div>
								<div class="col-sm-10">
									<div class="form-group">
										<label>Patient <small>(required)</small></label>
										<select name="patientID">
										 <%for(Patient patient:patients){ %>
										  <option value="<%=patient.getPatientId()%>"><%=patient.getName()%> <%=patient.getFatherName()%> <%=patient.getFamilyName()%></option>
										 <%} %>
										</select>
									</div>
								</div>
								<div class="col-sm-10">
									<div class="form-group">
										<label>Subject <small>(required)</small></label> <input
											name="messageSubject" type="text" class="form-control"
											placeholder="-----">
									</div>
								</div>

								<div class="col-sm-10">
									<div class="form-group">
										<label>Body <small>(required)</small></label>
										<textarea rows="4" cols="50" name="messageBody"
											class="form-control"
											placeholder="Write your message here...."></textarea>
									</div>
								</div>


								<input type="submit"  class="btn btn-round btn-fill btn-info"  value="Sent"/>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

