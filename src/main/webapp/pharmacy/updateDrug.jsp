<%@page import="com.hospital.models.Drug"%>
<%@page import="com.hospital.entities.PharmatiestDAO"%>
<%@page import="com.hospital.models.Employee"%>
<%@page import="com.hospital.models.Category"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.hospital.models.Employee"%>
<%@page import="java.util.List"%>
<%@page import="com.hospital.entities.HospitalService"%>
<%@page import="com.hospital.entities.AdminDAO"%>

<script src="assets/js/jquery.min.js"></script>

<script>
	$(document).ready(function() {
		$('#allDrugs').DataTable();
	});
</script>

<%
	PharmatiestDAO pharmatiestDAO = HospitalService.getInstance();

	Employee currentEmp = (Employee) session.getAttribute("employee");

	List<Drug> drugs = pharmatiestDAO.getListObjects(Drug.class);

	request.setAttribute("drugs", drugs);

	int selectedDrugID = Integer.parseInt(request.getParameter("uempid"));
	Drug selectedDrug = (Drug) pharmatiestDAO.getObject(selectedDrugID, Drug.class);
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
				<form method="POST" action="Process?action=UpdateDrug">
					<!--        You can switch ' data-color="orange" '  with one of the next bright colors: "blue", "green", "orange", "red"          -->

					<div class="wizard-header">
						<h3>
							<b>Update</b> Drug info <br> <small>This information
								about Drug.</small>
						</h3>
					</div>


					<div class="wizard-navigation">
						<ul>
							<li><a href="#about" data-toggle="tab">About</a></li>
						</ul>
					</div>

					<div class="tab-content">
						<div class="tab-pane" id="about">
							<div class="row">
								<h4 class="info-text">Basic Drug Information</h4>

                               <input type="hidden" name="drugID" value="<%=selectedDrug.getDrugId() %>" />

								<div class="col-sm-3">
									<div class="form-group">
										<label>Drug Name <small>(required)</small></label> <input
											name="name" type="text" class="form-control"
											placeholder="Kotofan drug.." required value="<%=selectedDrug.getName() %>" >
									</div>
								</div>

								<div class="col-sm-3 col-sm-offset-1">
									<div class="form-group">
										<label>Cost <small>(required)</small></label> <input
											type="number" class="form-control" name="cost"
											placeholder="10.00" required value="<%=selectedDrug.getCost() %>"/>
									</div>
								</div>


								<div class="col-sm-3 col-sm-offset-1">
									<div class="form-group">
										<label>Quantity <small>(required)</small></label> <input
											type="number" class="form-control" name="quantity" value="<%=selectedDrug.getQuantity() %>"
											placeholder="50" required />
									</div>
								</div>




								<div class="col-sm-3">
									<div class="form-group">
										<label>Unit Per Day <small>(required)</small></label> <input
											name="unitPerDay" type="text" class="form-control" value="<%=selectedDrug.getUnitPerDay() %>"
											placeholder="3 times..">
									</div>
								</div>

								<div class="col-sm-3">
									<div class="form-group">
										<label>production date <small>(required)</small></label> <input
											name="startDate" type="text" class="form-control" value="<%=selectedDrug.getStartDate() %>"
											placeholder="05/03/2017">
									</div>
								</div>


								<div class="col-sm-3">
									<div class="form-group">
										<label>Finished Date <small>(required)</small></label> <input
											name="drug_expired" type="text" class="form-control" value="<%=selectedDrug.getDrug_expired() %>"
											placeholder="05/08/2017">
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
					<h4 class="title">All Drugs</h4>
					<p class="category"><%=drugs.size()%>
						Drug's
					</p>
				</div>

				<form action="" method="POST">
					<table
						class="table table-striped table-bordered table-hover dt-responsive "
						id="allDrugs">
						<thead class="text-primary">
							<th>Name</th>
							<th>Cost</th>
							<th>Quantity</th>
							<th>Unit Per Day</th>
							<th>production date</th>
							<th>drug expired</th>
							<th>Employee</th>
							<th></th>
						</thead>
						<tbody>
							<c:forEach items="${drugs}" var="drug">
								<tr>
									<td><c:out value="${drug.name}" /></td>
									<td><c:out value="${drug.cost}" /></td>
									<td><c:out value="${drug.quantity}" /></td>
									<td><c:out value="${drug.unitPerDay}" /></td>
									<td><c:out value="${drug.startDate}" /></td>
									<td><c:out value="${drug.drug_expired}" /></td>
									<td><c:out value="${drug.employee.firstName}" /> <c:out
											value="${drug.employee.fatherName}" /> <c:out
											value="${drug.employee.familyName}" /></td>
									<td><a href="drugmgmt.jsp?uempid=${drug.drugId}"><i
											class="material-icons">edit</i></a> <a
										href="Process?action=DeleteDrug&dempid=${drug.drugId}"><i
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