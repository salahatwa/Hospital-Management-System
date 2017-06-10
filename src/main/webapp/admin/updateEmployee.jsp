<%@page import="com.hospital.utils.FormateDate"%>
<%@page import="com.hospital.models.Employee"%>
<%@page import="com.hospital.models.Category"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.hospital.models.Employee"%>
<%@page import="java.util.List"%>
<%@page import="com.hospital.entities.HospitalService"%>
<%@page import="com.hospital.entities.AdminDAO"%>

<script src="assets/js/jquery.min.js"></script>


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
		$('#allselectedEmployees').DataTable();
	});
</script>

<%
	AdminDAO adminDAO2 = HospitalService.getInstance();

	Employee currentEmp2 = (Employee) session.getAttribute("employee");
	List<Employee> employees2 = adminDAO2.getListEmployeeWithout(currentEmp2.getEmployeeId());

	List<Category> categories2 = adminDAO2.getListObjects(Category.class);

	request.setAttribute("employees2", employees2);
	request.setAttribute("categories", categories2);

	int selectedEmployeeID = Integer.parseInt(request.getParameter("uempid"));
	Employee selectedEmployee = (Employee) adminDAO2.getObject(selectedEmployeeID, Employee.class);
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
				<form method="POST" action="Process?action=UpdateEmployee"
					enctype="multipart/form-data">
					<!--        You can switch ' data-color="orange" '  with one of the next bright colors: "blue", "green", "orange", "red"          -->

					<input type="hidden" name="employeeID"
						value="<%=selectedEmployeeID%>" />
					<div class="wizard-header">
						<h3>
							<b>Update</b> Employee info <br> <small>This
								information about Employee.</small>
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

											<%
												if (selectedEmployee.getPhoto() != "") {
													
											%>

											<img src='<%=selectedEmployee.getPhoto()%>'
												class="picture-src" id="wizardPicturePreview" title="" /> <input
												type="file" id="wizard-picture" name="picture">
										</div>
										<%
											} else {
										%>
										<img src="assets/img/default-avatar.png" class="picture-src"
											id="wizardPicturePreview" title="" /> <input type="file"
											id="wizard-picture" name="picture">
									</div>
									<%
										}
									%>
									<h6>Choose Picture</h6>
								</div>
							</div>

							<div class="col-sm-3">
								<div class="form-group">
									<label>First Name <small>(required)</small></label> <input
										name="firstname" type="text" class="form-control"
										placeholder="Mosatafa..."
										value="<%=selectedEmployee.getFirstName()%>">
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group">
									<label>Father Name <small>(required)</small></label> <input
										name="fathername" type="text" class="form-control"
										placeholder="Salah..."
										value="<%=selectedEmployee.getFatherName()%>">
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group">
									<label>Family Name <small>(required)</small></label> <input
										name="familyname" type="text" class="form-control"
										placeholder="Atwa..."
										value="<%=selectedEmployee.getFamilyName()%>">
								</div>
							</div>


							<div class="col-sm-3">
								<div class="form-group">
									<label>Address<small>(required)</small></label> <input
										name="address" type="text" class="form-control"
										placeholder="Orabi St..."
										value="<%=selectedEmployee.getAddress()%>">
								</div>
							</div>





							<div class="col-sm-3 col-sm-offset-1">
								<div class="form-group">
									<label>Email <small>(required)</small></label> <input
										name="email" type="email" class="form-control"
										placeholder="salahatwa@outlook.com"
										value="<%=selectedEmployee.getEmail()%>">
								</div>
							</div>

							<div class="col-sm-3 ">
									<div class="form-group">
										<label>Password <small>(required)</small></label> <input
										id="password"	name="pass" type="password" class="form-control" 
											placeholder="Employee Password...">
									</div>
								</div>
								
								<div class="col-sm-3 ">
									<div class="form-group">
										<label>Confirm Password <small>(required)</small></label> <input
										id="confirm_password"	 type="password" class="form-control" 
											placeholder="Confirm Employee Password...">
									</div>
								</div>

							<div class="col-sm-3">
								<div class="form-group">
									<div  id="sandbox-container">
										<label>Date of Birth</label>
										<div class="input-daterange input-group" id="datepicker">

											<input class="form-control" name="dob" type="text"
												placeholder="Date of Birth" required readonly value=" <%= FormateDate.getStringDate(selectedEmployee.getDob())%>">
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
										value="<%=selectedEmployee.getPhone()%>" />
								</div>
							</div>

							<div class="col-sm-3 col-sm-offset-1">
								<div class="form-group">
									<c:set var="employeeGender"
										value="<%=selectedEmployee.getGender()%>" />
									<label for="radio">Select Gender</label><br>
									<div class="radio">
										<label><input type="radio" name="gender" value="male"
											required
											<c:if test="${ employeeGender=='male' }"> checked </c:if>
											required /> Male</label> <label><input type="radio"
											value="female" name="gender"
											<c:if test="${ employeeGender=='female' }"> checked </c:if> />
											Female</label>
									</div>
								</div>
							</div>



							<div class="col-sm-3">
								<div class="form-group">
									<label>Category <small>(required)</small></label> <select
										class="form-control" name="catgoryID" required>
										<option value="">Category</option>
										<c:set var="employeeCategory"
											value="<%=selectedEmployee.getCategory().getCategoryId()%>" />
										<c:forEach items="${categories}" var="category">
											<option value="${category.categoryId}"
												<c:if test="${ category.categoryId==employeeCategory }"> selected </c:if>>

												<c:out value="${category.categoryName}" />

											</option>
										</c:forEach>
									</select>
								</div>
							</div>


							<div class="col-sm-3 col-sm-offset-1">
								<div class="form-group">
									<label>Employee Job <small>(required)</small></label> <select
										class="form-control" name="type" required
										value="<%=selectedEmployee.getType()%>">
										<c:set var="employeeType"
											value="<%=selectedEmployee.getType()%>" />
										<option value="">Job</option>
										<option value="Admin"
											<c:if test="${ employeeType=='Admin' }"> selected </c:if>>Admin</option>
										<option value="Doctor"
											<c:if test="${ employeeType=='Doctor' }"> selected </c:if>>Doctor</option>
										<option value="Nurse"
											<c:if test="${ employeeType=='Nurse' }"> selected </c:if>>Nurse</option>
										<option value="Lab"
											<c:if test="${ employeeType=='Lab' }"> selected </c:if>>Lab</option>
										<option value="Xray"
											<c:if test="${ employeeType=='Xray' }"> selected </c:if>>Xray</option>
										<option value="pharmacist"
											<c:if test="${ employeeType=='pharmacist' }"> selected </c:if>>pharmacist</option>
										<option value="Receptionist"
											<c:if test="${ employeeType=='Receptionist' }"> selected </c:if>>Receptionist</option>
										<option value="Accountant"
											<c:if test="${ employeeType=='Accountant' }"> selected </c:if>>Accountant</option>
									</select>
								</div>
							</div>

							<div class="col-sm-3 col-sm-offset-1">
								<div class="form-group">
									<label>User Name <small>(required)</small></label> <input
										name="userName" type="text" class="form-control" required
										placeholder="User Name..."
										value="<%=selectedEmployee.getUsername()%>">
								</div>
							</div>

						</div>
					</div>
					<div class="tab-pane" id="qual">
						<h4 class="info-text">Qualifications</h4>
						<div class="row">


							<div id="qualifications_fields"></div>

							<%
								for (int i = 0; i < selectedEmployee.getQualifications().size(); i++) {
							%>
							<div class="col-sm-3 nopadding">
								<div class="form-group">
									<input type="text" class="form-control" id="instituteName"
										name="instituteName[]"
										value="<%=selectedEmployee.getQualifications().get(i).getInstituteName()%>"
										placeholder="Institute name">
								</div>
							</div>
							<div class="col-sm-3 nopadding">
								<div class="form-group">
									<input type="text" class="form-control" id="qualificationName"
										name="qualificationName[]"
										value="<%=selectedEmployee.getQualifications().get(i).getQualificationName()%>"
										placeholder="Qualification Name">
								</div>
							</div>

							<div class="col-sm-3 nopadding">
								<div class="form-group">
									<input type="text" class="form-control" id="Degree"
										name="Degree[]"
										value="<%=selectedEmployee.getQualifications().get(i).getDegree()%>"
										placeholder="Degree">
								</div>
							</div>

							<div class="col-sm-3 nopadding">
								<div class="form-group">
									<div class="input-group">
										<select class="form-control" id="educationDate"
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
										<div class="input-group-btn">
											<button class="btn btn-success" type="button"
												onclick="qualifications_fields();">
												<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
											</button>
										</div>
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
								for (int i = 0; i < selectedEmployee.getWorkExperinces().size(); i++) {
							%>
							<div class="col-sm-3 nopadding">
								<div class="form-group">
									<input type="text" class="form-control" id="nameOfOrganization"
										name="nameOfOrganization[]"
										value="<%=selectedEmployee.getWorkExperinces().get(i).getNameOfOrganization()%>"
										placeholder="Organization name">
								</div>
							</div>
							<div class="col-sm-3 nopadding">
								<div class="form-group">
									<input type="text" class="form-control" id="position"
										name="position[]"
										value="<%=selectedEmployee.getWorkExperinces().get(i).getPosition()%>"
										placeholder="Position">
								</div>
							</div>


							<div class="col-sm-3 nopadding">
								<div class="form-group">
									<div class="input-group">
										<select class="form-control" id="startDate" name="startDate[]">
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
										<select class="form-control" id="endDate" name="endDate[]">
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
										<div class="input-group-btn">
											<button class="btn btn-success" type="button"
												onclick="workExp_fields();">
												<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
											</button>
										</div>
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
						name='next' value='Next' onclick="validatePassword();" /> <input type='submit'
						class='btn btn-finish btn-fill btn-warning btn-wd btn-sm'
						name='finish' value='Finish' onclick="validatePassword();" />

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
				<p class="category"><%=employees2.size()%>
					Employee's
				</p>
			</div>

			<form action="" method="POST">
				<table
					class="table table-striped table-bordered table-hover dt-responsive "
					id="allselectedEmployees">
					<thead class="text-primary">
						<th>Name</th>
						<th>Job</th>
						<th>Category</th>
						<th>Action</th>
					</thead>
					<tbody>
						<c:forEach items="${employees2}" var="employee">
							<tr>
								<td><c:out value="${employee.firstName}" /> <c:out
										value="${employee.fatherName}" /> <c:out
										value="${employee.familyName}" /> </td>
										
								<td><c:out value="${employee.category.categoryName}" /></td>
								<td><c:out value="${employee.type}" /></td>
								<td><a href="empmgmt.jsp?uempid=${employee.employeeId}"><i
										class="material-icons">edit</i></a> <a
									href="Process?action=deleteEmployee&dempid=${employee.employeeId}"><i
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