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
		$('#allEmployees').DataTable();
	});
	
	function errorPassword() {
		demo.showNotification('top','right','User name or passsword error','danger');
	}


</script>








<%
	AdminDAO adminDAO = HospitalService.getInstance();

	Employee currentEmp = (Employee) session.getAttribute("employee");
	List<Employee> employees = adminDAO.getListEmployeeWithout(currentEmp.getEmployeeId());

	List<Category> categories = adminDAO.getListObjects(Category.class);

	request.setAttribute("employees", employees);
	request.setAttribute("categories", categories);
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
				<form method="POST" action="Process?action=AddEmployee"
					enctype="multipart/form-data">
					<!--        You can switch ' data-color="orange" '  with one of the next bright colors: "blue", "green", "orange", "red"          -->

					<div class="wizard-header">
						<h3>
							<b>Add</b> Employee info <br> <small>This
								information about employee.</small>
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
											<img src="../assets/img/default-avatar.png"
												class="picture-src" id="wizardPicturePreview" title="" /> <input
												type="file" id="wizard-picture" name="picture">
										</div>
										<h6>Choose Picture</h6>
									</div>
								</div>

								<div class="col-sm-3">
									<div class="form-group">
										<label>First Name <small>(required)</small></label> <input
											name="firstname" type="text" class="form-control"
											placeholder="Mosatafa...">
									</div>
								</div>
								<div class="col-sm-3 ">
									<div class="form-group">
                                                                            <label>Father Name <small>(required)</small></label> <input required
											name="fathername" type="text" class="form-control"
											placeholder="Mostafa...">
									</div>
								</div>
								<div class="col-sm-5 col-sm-offset-1">
									<div class="form-group">
										<label>Family Name <small>(required)</small></label> <input
											name="familyname" type="text" class="form-control"
											placeholder="Atwa...">
									</div>
								</div>


								<div class="col-sm-3 col-sm-offset-1">
									<div class="form-group">
										<label>Address<small>(required)</small></label> <input
											name="address" type="text" class="form-control" required
											placeholder="Orabi St...">
									</div>
								</div>



								<div class="col-sm-3 ">
									<div class="form-group">
										<label>Password <small>(required)</small></label> <input
										id="password"	name="pass" type="password" class="form-control" required
											placeholder="Employee Password...">
									</div>
								</div>
								
								<div class="col-sm-3 ">
									<div class="form-group">
										<label>Confirm Password <small>(required)</small></label> <input
										id="confirm_password"	 type="password" class="form-control" required
											placeholder="Confirm Employee Password...">
									</div>
								</div>
								
								
								<div class="col-sm-3 col-sm-offset-1">
									<div class="form-group">
										<label>Email <small>(required)</small></label> <input
											name="email" type="email" class="form-control" required
											placeholder="salahatwa@outlook.com">
									</div>
								</div>



								<div class="col-sm-3 ">
									<div class="form-group">
										<div  id="sandbox-container">
											<label>Date of Birth</label>
											<div class="input-daterange input-group" id="datepicker">

												<input class="form-control" name="dob" type="text"
													placeholder="Date of Birth" required readonly>
												<!-- 	<span class="input-group-addon"></span> -->
											</div>

										</div>
									</div>
								</div>


								<div class="col-sm-3 ">
									<div class="form-group">
										<label>Phone <small>(required)</small></label> <input
											type="number" class="form-control" name="phone"
											placeholder="01091687523" required />


										<c:if test="${not empty param['sucess']}">
											<script>
		
		demo.showNotification('top', 'right', 'User name or passsword error',
				</script>
										</c:if>
									</div>
								</div>

								<div class="col-sm-3 col-sm-offset-1">
									<div class="form-group">
										<label for="radio">Select Gender</label><br>
										<div class="radio">
											<label><input type="radio" name="gender" required
												value="male" required /> Male</label> <label><input
												type="radio" name="gender" value="female" /> Female</label>
										</div>
									</div>
								</div>



								<div class="col-sm-3">
									<div class="form-group">
										<label>Category <small>(required)</small></label> <select
											class="form-control" name="catgoryID" required>
											<option value="">Category</option>
											<c:forEach items="${categories}" var="category">
												<option value="${category.categoryId}"><c:out
														value="${category.categoryName}" /></option>
											</c:forEach>
										</select>
									</div>
								</div>


								<div class="col-sm-3 col-sm-offset-1">
									<div class="form-group">
										<label>Employee Job <small>(required)</small></label> <select
											class="form-control" name="type" required>
											<option value="">Job</option>
											<option value="Admin">Admin</option>
											<option value="Doctor">Doctor</option>
											<option value="Nurse">Nurse</option>
											<option value="Lab">Lab</option>
											<option value="Xray">Xray</option>
											<option value="pharmacist">pharmacist</option>
											<option value="Receptionist">Receptionist</option>
											<option value="Accountant">Accountant</option>
										</select>
									</div>
								</div>


								<div class="col-sm-3 col-sm-offset-1">
									<div class="form-group">
										<label>User Name <small>(required)</small></label> <input
											name="userName" type="text" class="form-control" required
											placeholder="User Name...">
									</div>
								</div>






							</div>
						</div>
						<div class="tab-pane" id="qual">
							<h4 class="info-text">Qualifications</h4>
							<div class="row">


								<div id="qualifications_fields"></div>
								<div class="col-sm-3 nopadding">
									<div class="form-group">
										<input type="text" class="form-control" id="instituteName"
											name="instituteName[]" value="" placeholder="Institute name"
											required>
									</div>
								</div>
								<div class="col-sm-3 nopadding">
									<div class="form-group">
										<input type="text" class="form-control" id="qualificationName"
											name="qualificationName[]" value=""
											placeholder="Qualification Name" required>
									</div>
								</div>

								<div class="col-sm-3">
									<div class="form-group">
										<input type="text" class="form-control" id="Degree"
											name="Degree[]" value="" placeholder="Degree" required>
									</div>
								</div>

								<div class="col-sm-3 nopadding">
									<div class="form-group">
										<div class="input-group">
											<select class="form-control" id="educationDate"
												name="educationDate[]" required>

												<option value="">Date</option>
												<%
													for (int j = 2017; j >= 1900; j--) {
												%>
												<option value="<%=j%>"><%=j%></option>
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
								<div class="clear"></div>


							</div>
						</div>
						<div class="tab-pane" id="exp">
							<div class="row">
								<div class="col-sm-12">
									<h4 class="info-text">Work Experiences</h4>
								</div>


								<div id="workExp_fields"></div>
								<div class="col-sm-3 nopadding">
									<div class="form-group">
										<input type="text" class="form-control" required
											id="nameOfOrganization" name="nameOfOrganization[]" value=""
											placeholder="Organization name" required>
									</div>
								</div>
								<div class="col-sm-3 nopadding">
									<div class="form-group">
										<input type="text" class="form-control" id="position"
											name="position[]" value="" placeholder="Position" required>
									</div>
								</div>


								<div class="col-sm-3 nopadding">
									<div class="form-group">
										<div class="input-group">
											<select class="form-control" id="startDate"
												name="startDate[]" required>

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



								<div class="col-sm-3 nopadding">
									<div class="form-group">
										<div class="input-group">
											<select class="form-control" id="endDate" name="endDate[]"
												required>

												<option value="">Date</option>
												<%
													for (int j = 2017; j >= 1900; j--) {
												%>
												<option value="<%=j%>"><%=j%></option>
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

								<div class="clear"></div>


							</div>
						</div>
					</div>
					<div class="wizard-footer height-wizard">
						<div class="pull-right">
							<input type='button'
								class='btn btn-next btn-fill btn-warning btn-wd btn-sm'
								name='next' value='Next' onclick="validatePassword();"/> <input type='submit'
								class='btn btn-finish btn-fill btn-warning btn-wd btn-sm'
								name='finish' value='Add Employee' />

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
					<p class="category"><%=employees.size()%>
						Employee's
					</p>
				</div>

				<form action="" method="POST">
					<table
						class="table table-striped table-bordered table-hover dt-responsive "
						id="allEmployees">
						<thead class="text-primary">
							<th>Name</th>
							<th>Job</th>
							<th>Category</th>
							<th></th>
						</thead>
						<tbody>
							<c:forEach items="${employees}" var="employee">
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


