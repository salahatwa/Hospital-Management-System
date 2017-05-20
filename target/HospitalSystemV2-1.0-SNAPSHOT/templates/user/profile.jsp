<%@page import="com.hospital.utils.FormateDate"%>
<%@page import="com.hospital.models.Employee"%>
<%@page import="com.hospital.models.Category"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.hospital.models.Employee"%>
<%@page import="java.util.List"%>
<%@page import="com.hospital.entities.HospitalService"%>
<%@page import="com.hospital.entities.AdminDAO"%>

<script src="../assets/js/jquery.min.js"></script>


<script>
	var dates = "";
	for (j = 2017; j >= 1900; j--) {
		dates += '<option value='+j+'>' + j + '</option>'
	}

	var room = 1;
	function workExp_fields() {

		room++;
		var objTo = document.getElementById('workExp_fields')
		var divtest = document.createElement("div");
		divtest.setAttribute("class", "form-group removeclass" + room);
		var rdiv = 'removeclass' + room;
		divtest.innerHTML = '<div class="col-sm-3 nopadding"><div class="form-group"> <input type="text" class="form-control" id="nameOfOrganization" name="nameOfOrganization[]" value="" placeholder="Organization name"></div></div><div class="col-sm-3 nopadding"><div class="form-group"> <input type="text" class="form-control" id="position" name="position[]" value="" placeholder="position"></div></div>'
				+ '<div class="col-sm-3 nopadding"><div class="form-group"><div class="input-group"> <select class="form-control" id="startDate" name="startDate[]"><option value="">Date</option>'
				+ dates
				+ ' </select></div></div></div>'
				+ ' <div class="col-sm-3 nopadding"><div class="form-group"><div class="input-group"> <select class="form-control" id="endDate" name="endDate[]"><option value="">Date</option>'
				+ dates
				+ '</select>'
				+ '<div class="input-group-btn"> <button class="btn btn-danger" type="button" onclick="remove_workExp_fields('
				+ room
				+ ');"> '
				+ ' <span class="glyphicon glyphicon-minus" aria-hidden="true"></span> </button></div></div></div></div><div class="clear"></div>';

		objTo.appendChild(divtest)
	}
	function remove_workExp_fields(rid) {
		$('.removeclass' + rid).remove();
	}

	var qual = 1;
	function qualifications_fields() {

		qual++;
		var objTo = document.getElementById('qualifications_fields')
		var divtest = document.createElement("div");
		divtest.setAttribute("class", "form-group removeclass" + qual);
		var rdiv = 'removeclass' + qual;
		divtest.innerHTML = '<div class="col-sm-3 nopadding"><div class="form-group"> <input type="text" class="form-control" id="instituteName" name="instituteName[]" value="" placeholder="Institute name"></div></div><div class="col-sm-3 nopadding"><div class="form-group"> <input type="text" class="form-control" id="qualificationName" name="qualificationName[]" value="" placeholder="qualificationName"></div></div><div class="col-sm-3 nopadding"><div class="form-group"> <input type="text" class="form-control" id="Degree" name="Degree[]" value="" placeholder="Degree"></div></div><div class="col-sm-3 nopadding"><div class="form-group"><div class="input-group"> <select class="form-control" id="educationDate" name="educationDate[]"><option value="">Date</option>'
				+ dates
				+ '</select><div class="input-group-btn"> <button class="btn btn-danger" type="button" onclick="remove_qualifications_fields('
				+ qual
				+ ');"> <span class="glyphicon glyphicon-minus" aria-hidden="true"></span> </button></div></div></div></div><div class="clear"></div>';

		objTo.appendChild(divtest)
	}
	function remove_qualifications_fields(rid) {
		$('.removeclass' + rid).remove();
	}

	$(document).ready(function() {
		$('#allEmployees').DataTable();
	});
</script>

<%
	Employee selectedEmployee = (Employee) session.getAttribute("employee");
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

		<div class="col-md-8 col-md-offset-2">


			<div class="wizard-card" data-color="red" id="wizardProfile">
				<form method="POST" action="" enctype="multipart/form-data">
					<!--        You can switch ' data-color="orange" '  with one of the next bright colors: "blue", "green", "orange", "red"          -->

					<input type="hidden" name="employeeID"
						value="<%=selectedEmployee.getEmployeeId()%>" />
					<div class="wizard-header">
						<h3>
							<b><%=selectedEmployee.getFirstName()%> <%=selectedEmployee.getFatherName()%></b>
							information <br> <small>This information about
								Employee.</small>
						</h3>
					</div>


					<div class="wizard-navigation">
						<ul>
							<li><a href="#about" data-toggle="tab">About</a></li>
							<li><a href="#qual" data-toggle="tab">Qualification</a></li>
							<li><a href="#exp" data-toggle="tab">Work Experience</a></li>
						</ul>

					</div>

					<div class="tab-content">
						<div class="tab-pane" id="about">
							<div class="row">
								<h4 class="info-text">Basic Employee Information</h4>
								<div class="col-sm-4 col-sm-offset-1">
									<div class="picture-container">
										<div class="picture">

											<input type="hidden" name="currentPhoto" readonly
												value="<%=selectedEmployee.getPhoto()%>" />
											<%
												if (selectedEmployee.getPhoto() != "") {
											%>

											<img src='<%=selectedEmployee.getPhoto()%>'
												class="picture-src" id="wizardPicturePreview" title="" />
										</div>
										<%
											} else {
										%>
										<img src='../assets/img/default-avatar.png'
											class="picture-src" id="wizardPicturePreview" title="" />
									</div>
									<%
										}
									%>
								</div>
							</div>

							<div class="col-sm-3">
								<div class="form-group">
									<label>First Name <small></small></label> <input
										name="firstname" type="text" class="form-control" readonly
										placeholder="------"
										value="<%=selectedEmployee.getFirstName()%>">
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group">
									<label>Father Name <small></small></label> <input
										name="fathername" type="text" class="form-control" readonly
										placeholder="------"
										value="<%=selectedEmployee.getFatherName()%>">
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group">
									<label>Family Name <small></small></label> <input
										name="familyname" type="text" class="form-control" readonly
										placeholder="------"
										value="<%=selectedEmployee.getFamilyName()%>">
								</div>
							</div>


							<div class="col-sm-3">
								<div class="form-group">
									<label>Address<small></small></label> <input readonly
										name="address" type="text" class="form-control"
										placeholder="------"
										value="<%=selectedEmployee.getAddress()%>">
								</div>
							</div>





							<div class="col-sm-3 col-sm-offset-1">
								<div class="form-group">
									<label>Email <small></small></label> <input
										name="email" type="email" class="form-control" readonly
										placeholder="------"
										value="<%=selectedEmployee.getEmail()%>">
								</div>
							</div>



					<%-- 		<div class="col-sm-3">
								<div class="form-group">
									<label>Date of Birth</label><br> <input type="text"
										name="dob" placeholder="Date of Birth" class="form-control"
										readonly  value="<%= FormateDate.getStringDate(selectedEmployee.getDob())%>" />
								</div>
							</div> --%>



							<div class="col-sm-3 col-sm-offset-1">
								<div class="form-group">
									<label>Phone <small></small></label> <input
										type="number" class="form-control" name="phone" readonly
										placeholder="------" 
										value="<%=selectedEmployee.getPhone()%>" />
								</div>
							</div>

							

							<div class="col-sm-3">
								<div class="form-group">
									<label>Gender</label><br> <input type="text" name="cat"
										placeholder="------" class="form-control" readonly 
										value="<%=selectedEmployee.getGender()%>" />
								</div>
							</div>



<%-- 
							<div class="col-sm-3">
								<div class="form-group">
									<label>Category</label><br> <input type="text" name="cat"
										placeholder="Category" class="form-control" readonly 
										value="<%=selectedEmployee.getCategory().getCategoryName()%>" />
								</div>
							</div>
 --%>

							<div class="col-sm-3 col-sm-offset-1">
								<div class="form-group">
									<label>Type</label><br> <input type="text" name="dob"
										placeholder="------" class="form-control" readonly 
										value="<%=selectedEmployee.getType()%>" />
								</div>
							</div>





						</div>
					</div>
					<div class="tab-pane" id="qual">
						<h4 class="info-text">Qualifications</h4>
						<div class="row">


							<div id="qualifications_fields"></div>

							<%
								if (selectedEmployee.getQualifications() != null)
									for (int i = 0; i < selectedEmployee.getQualifications().size(); i++) {
							%>
							<div class="col-sm-3 nopadding">
								<div class="form-group">
									<input type="text" class="form-control" id="instituteName"
										readonly name="instituteName[]"
										value="<%=selectedEmployee.getQualifications().get(i).getInstituteName()%>"
										placeholder="Institute name">
								</div>
							</div>
							<div class="col-sm-3 nopadding">
								<div class="form-group">
									<input type="text" class="form-control" id="qualificationName"
										readonly name="qualificationName[]"
										value="<%=selectedEmployee.getQualifications().get(i).getQualificationName()%>"
										placeholder="Qualification Name">
								</div>
							</div>

							<div class="col-sm-3 nopadding">
								<div class="form-group">
									<input type="text" class="form-control" id="Degree" readonly
										name="Degree[]"
										value="<%=selectedEmployee.getQualifications().get(i).getDegree()%>"
										placeholder="Degree">
								</div>
							</div>

							<div class="col-sm-3 nopadding">
								<div class="form-group">
									<div class="input-group">
										<select class="form-control" id="educationDate" readonly
											name="educationDate[]">
											<c:set var="employeeDate"
												value="<%=selectedEmployee.getQualifications().get(i).getQualificationDate()%>" />

											<option value="">Date</option>
											<%
												for (int j = 2017; j >= 1900; j--) {
											%>
											<c:set var="j" value="<%=j%>" />

											<option value="<%=j%>"
												<c:if test="${ employeeDate==j }"> selected </c:if>><%=j%></option>
											<%
												}
											%>
										</select>
									</div>
								</div>
							</div>
							<%
								}
								else {
							%>
							<div class="col-sm-3 nopadding">
								<div class="form-group">
									<input type="text" class="form-control" id="instituteName"
										readonly name="instituteName[]" placeholder="Institute name">
								</div>
							</div>
							<div class="col-sm-3 nopadding">
								<div class="form-group">
									<input type="text" class="form-control" id="qualificationName"
										readonly name="qualificationName[]"
										placeholder="Qualification Name">
								</div>
							</div>

							<div class="col-sm-3 nopadding">
								<div class="form-group">
									<input type="text" class="form-control" id="Degree" readonly
										name="Degree[]" placeholder="Degree">
								</div>
							</div>

							<div class="col-sm-3 nopadding">
								<div class="form-group">
									<div class="input-group">
										<select class="form-control" id="educationDate" readonly
											name="educationDate[]">
											<c:set var="employeeDate" />

											<option value="">Date</option>
											<%
												for (int j = 2017; j >= 1900; j--) {
											%>
											<option value="<%=j%>"><%=j%></option>
											<%
												}
											%>
										</select>
									</div>
								</div>
							</div>
							<%
								}
							%>

							<div class="clear"></div>


						</div>
					</div>
					<div class="tab-pane" id="exp">
						<div class="row">
							<div class="col-sm-12">
								<h4 class="info-text">Work Experiences</h4>
							</div>


							<div id="workExp_fields"></div>


							<%
								if (selectedEmployee.getWorkExperinces() != null)
									for (int i = 0; i < selectedEmployee.getWorkExperinces().size(); i++) {
							%>
							<div class="col-sm-3 nopadding">
								<div class="form-group">
									<input type="text" class="form-control" id="nameOfOrganization"
										readonly name="nameOfOrganization[]"
										value="<%=selectedEmployee.getWorkExperinces().get(i).getNameOfOrganization()%>"
										placeholder="Organization name">
								</div>
							</div>
							<div class="col-sm-3 nopadding">
								<div class="form-group">
									<input type="text" class="form-control" id="position" readonly
										name="position[]"
										value="<%=selectedEmployee.getWorkExperinces().get(i).getPosition()%>"
										placeholder="Position">
								</div>
							</div>


							<div class="col-sm-3 nopadding">
								<div class="form-group">
									<div class="input-group">
										<select class="form-control" id="startDate" name="startDate[]"
											readonly>
											<c:set var="employeestartDate"
												value="<%=selectedEmployee.getWorkExperinces().get(i).getStartDate()%>" />

											<option value="">Date</option>
											<%
												for (int j = 2017; j >= 1900; j--) {
											%>
											<c:set var="j" value="<%=j%>" />

											<option value="<%=j%>"
												<c:if test="${ employeestartDate==j }"> selected </c:if>><%=j%></option>
											<%
												}
											%>
										</select>
									</div>
								</div>
							</div>





							<div class="col-sm-3 nopadding">
								<div class="form-group">
									<div class="input-group">
										<select class="form-control" readonly id="endDate"
											name="endDate[]">
											<c:set var="employeeendDate"
												value="<%=selectedEmployee.getWorkExperinces().get(i).getEndDate()%>" />


											<option value="">Date</option>
											<%
												for (int j = 2017; j >= 1900; j--) {
											%>
											<c:set var="j" value="<%=j%>" />

											<option value="<%=j%>"
												<c:if test="${ employeeendDate==j }"> selected </c:if>><%=j%></option>
											<%
												}
											%>
										</select>
									</div>
								</div>
							</div>

							<%
								}
								else {
							%>

							<div class="col-sm-3 nopadding">
								<div class="form-group">
									<input type="text" class="form-control" id="nameOfOrganization"
										readonly name="nameOfOrganization[]"
										placeholder="Organization name">
								</div>
							</div>
							<div class="col-sm-3 nopadding">
								<div class="form-group">
									<input type="text" class="form-control" id="position" readonly
										name="position[]" placeholder="Position">
								</div>
							</div>


							<div class="col-sm-3 nopadding">
								<div class="form-group">
									<div class="input-group">
										<select class="form-control" id="startDate" name="startDate[]"
											readonly>

											<option value="">Date</option>
											<%
												for (int j = 2017; j >= 1900; j--) {
											%>
											<c:set var="j" value="<%=j%>" />

											<option value="<%=j%>"><%=j%></option>
											<%
												}
											%>
										</select>
									</div>
								</div>
							</div>





							<div class="col-sm-3 nopadding">
								<div class="form-group">
									<div class="input-group">
										<select class="form-control" id="endDate" name="endDate[]"
											readonly>


											<option value="">Date</option>
											<%
												for (int j = 2017; j >= 1900; j--) {
											%>
											<c:set var="j" value="<%=j%>" />

											<option value="<%=j%>"><%=j%></option>
											<%
												}
											%>
										</select>

									</div>
								</div>
							</div>

							<%
								}
							%>

							<div class="clear"></div>


						</div>
					</div>
			</div>
			<div class="wizard-footer height-wizard">
				<div class="pull-right">
					<input type='button'
						class='btn btn-next btn-fill btn-warning btn-wd btn-sm'
						name='next' value='Next' />

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
</div>