<%@page import="com.hospital.utils.FormateDate"%>
<%@page import="com.hospital.models.SelledDrug"%>
<%@page import="com.hospital.models.Drug"%>
<%@page import="com.hospital.entities.PharmatiestDAO"%>
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
		$('#sellDrugTable').DataTable();
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
	PharmatiestDAO pharmatiestDAO = HospitalService.getInstance();

	Employee currentEmp = (Employee) session.getAttribute("employee");

	List<Patient> patients = pharmatiestDAO.getListObjects(Patient.class);

	List<Drug> drugs = pharmatiestDAO.getListObjects(Drug.class);

	List<SelledDrug> selDrugs = pharmatiestDAO.getListObjects(SelledDrug.class);
%>
<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<div class="card">
					<div class="card-header text-center" data-background-color="red">
						<h4 class="title">
							Sell Drug
							</h3>
							<p class="category">Sell Drug for Patient</p>
					</div>
					<div class="card-content">
						<div class="table-responsive table-upgrade">
							<div class="card card-nav-tabs">
								<div class="card-header" data-background-color="red">
									<div class="nav-tabs-navigation">
										<div class="nav-tabs-wrapper">
											<span class="nav-tabs-title">Sell Drugs:</span>
											<ul class="nav nav-tabs" data-tabs="tabs">
												<li class="active"><a href="#room" data-toggle="tab">
														<i class="material-icons">bug_report</i> Sell Drugs
														<div class="ripple-container"></div>
												</a></li>

											</ul>
										</div>
									</div>
								</div>

								<div class="card-content">
									<div class="tab-content">
										<div class="tab-pane active" id="room">
											<table
												class="table table-striped table-bordered table-hover dt-responsive "
												id="sellDrugTable">
												<thead>
													<th>P.Name</th>
													<th>D.Name</th>
													<th>D.Cost</th>
													<th>Quan</th>
													<th>U.P.D</th>
													<th>Start</th>
													<th>End</th>
													<th></th>
												</thead>
												<tbody>

													<%
														for (SelledDrug selledDrug : selDrugs) {
													%>

													<tr>
														<td><%=selledDrug.getPatient().getName()%> <%=selledDrug.getPatient().getFatherName()%>
															<%=selledDrug.getPatient().getFamilyName()%></td>
														<td><%=selledDrug.getDrug().getName()%></td>
														<td><%=selledDrug.getDrug().getCost()%></td>
														<td><%=selledDrug.getQuantity()%></td>
														<td><%=selledDrug.getUnitPerDay() %></td>
														<td><%=selledDrug.getStartDate() %></td>
														<td><%=selledDrug.getEndDate() %></td>

														<td class="td-actions text-right"><a
															href="selldrug.jsp?usdrug=<%=selledDrug.getSelledDrugID()%>"
															rel="tooltip" title="Edit Selled Drug"
															class="btn btn-primary btn-simple btn-xs"> <i
																class="material-icons">edit</i>
														</a> <a
															href="Process?action=ReverseSellDrug&usdrug=<%=selledDrug.getSelledDrugID()%>"
															rel="tooltip" title="Remove"
															class="btn btn-danger btn-simple btn-xs"> <i
																class="material-icons">close</i>
														</a> <a
															href="Process?action=InvoiceDrug&usdrug=<%=selledDrug.getSelledDrugID()%>"
															rel="tooltip" title="Report"
															class="btn btn-round btn-fill btn-info" target="_blank">
																invoice </a></td>
													</tr>

													<%
														}
													%>

												</tbody>
											</table>


											<c:choose>

												<c:when test="${ not empty param['usdrug'] }">
													<%
														int selledDrugID = Integer.parseInt(request.getParameter("usdrug"));
																SelledDrug selledDrug = (SelledDrug) pharmatiestDAO.getObject(selledDrugID, SelledDrug.class);
													%>

													<form action="Process?action=UpdateSellDrug" method="POST">
														<input type="hidden" name="selledDrugID"
															value="<%=selledDrugID%>" />
														<div class="col-sm-3">
															<div class="form-group">
																<label>Drug <small>(required)</small></label> <select
																	name="drugID" class="form-control" required>
																	<option>Select Drug</option>
																	<%
																		for (Drug drug : drugs) {
																	%>
																	<option value="<%=drug.getDrugId()%>" <%if (selledDrug.getDrug().getDrugId() .equals( drug.getDrugId() )) {out.print("selected");}%> >
																		<%=drug.getName()%> /<%=drug.getCost()%>
																	</option>
																	<%
																		}
																	%>
																</select>
															</div>
														</div>

														<div class="col-sm-3">
															<div class="form-group">
																<label>Patient <small>(required)</small></label> <select
																	name="patientID" class="form-control" required>
																	<option>Select Patient</option>
																	<%
																		for (Patient patient : patients) {
																	%>
																	<option value="<%=patient.getPatientId()%>"
																		<%if (selledDrug.getPatient().getPatientId() == patient.getPatientId()) {out.print("selected");} %>>
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
																<label>Unit Per Day <small>(required)</small></label> <input
																	name="unitPerDay" type="text" class="form-control"
																	placeholder="3 times.." value="<%= selledDrug.getUnitPerDay()%>">
															</div>
														</div>



														<div class="col-sm-3 ">
															<div class="form-group">
																<div id="sandbox-container">
																	<label>Take From <small>(required)</small></label>
																	<div class="input-daterange input-group"
																		id="datepicker">

																		<input class="form-control" name="startTake"
																			type="text" placeholder="00/00/0000" required value="<%=FormateDate.getStringDate(selledDrug.getStartDate())%>"
																			>
																	</div>

																</div>
															</div>
														</div>


														<div class="col-sm-3 ">
															<div class="form-group">
																<div id="sandbox-container">
																	<label>End Take <small>(required)</small></label>
																	<div class="input-daterange input-group"
																		id="datepicker">

																		<input class="form-control" name="endTake" type="text"
																			placeholder="00/00/0000" required  value="<%=FormateDate.getStringDate(selledDrug.getEndDate())%>" >
																	</div>

																</div>
															</div>
														</div>


														<div class="col-sm-3">
															<div class="form-group">
																<label>Quantity <small>(required)</small></label> <input
																	required name="quantity" type="number"
																	class="form-control" placeholder="Quantity"
																	value="<%=selledDrug.getQuantity()%>">
															</div>
														</div>



														<div class="col-sm-3">
															<div class="form-group">
																<input type="submit"
																	class="btn btn-round btn-fill btn-info"
																	value="Update Selled Drug" />
															</div>
														</div>
													</form>

												</c:when>

												<c:otherwise>

													<form action="Process?action=SellDrug" method="POST">

														<div class="col-sm-3">
															<div class="form-group">
																<label>Drug <small>(required)</small></label> <select
																	name="drugID" class="form-control" required>
																	<option>Select Drug</option>
																	<%
																		for (Drug drug : drugs) {
																	%>
																	<option value="<%=drug.getDrugId()%>">
																		<%=drug.getName()%> /
																		<%=drug.getCost()%>
																	</option>
																	<%
																		}
																	%>
																</select>
															</div>
														</div>

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
																<label>Unit Per Day <small>(required)</small></label> <input
																	name="unitPerDay" type="text" class="form-control"
																	placeholder="3 times..">
															</div>
														</div>

														<div class="col-sm-3">
															<div class="form-group">
																<label>Quantity <small>(required)</small></label> <input
																	required name="quantity" type="number" required
																	class="form-control" placeholder="Quantity">
															</div>
														</div>


														<div class="col-sm-3 ">
															<div class="form-group">
																<div id="sandbox-container">
																	<label>Take From <small>(required)</small></label>
																	<div class="input-daterange input-group"
																		id="datepicker">

																		<input class="form-control" name="startTake"
																			type="text" placeholder="00/00/0000" required
																			>
																	</div>

																</div>
															</div>
														</div>


														<div class="col-sm-3 ">
															<div class="form-group">
																<div id="sandbox-container">
																	<label>End Take <small>(required)</small></label>
																	<div class="input-daterange input-group"
																		id="datepicker">

																		<input class="form-control" name="endTake" type="text"
																			placeholder="00/00/0000" required >
																	</div>

																</div>
															</div>
														</div>





														<div class="col-sm-3">
															<div class="form-group">
																<input type="submit"
																	class="btn btn-round btn-fill btn-info"
																	value="Selled Drug" />
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

