<%@page import="com.hospital.utils.FormateDate"%>
<%@page import="com.hospital.models.NurseServiceTime"%>
<%@page import="com.hospital.models.Nurse"%>
<%@page import="com.hospital.models.ShiftTime"%>
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
		$('#serviceTable').DataTable();
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
	AdminDAO adminDAO = HospitalService.getInstance();
	Employee em = (Employee) session.getAttribute("employee");
	List<ShiftTime> shiftTimes = adminDAO.getListObjects(ShiftTime.class);
	List<Nurse> nurses = adminDAO.getListObjects(Nurse.class);

	List<NurseServiceTime> nurseServiceTimes = adminDAO.getListObjects(NurseServiceTime.class);
%>
<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<div class="card">
					<div class="card-header text-center" data-background-color="red">
						<h4 class="title">
							Manage Nurse Service Time
							</h3>
							<p class="category">Add Nurse Service , Delete Nurse Service</p>
					</div>
					<div class="card-content">
						<div class="table-responsive table-upgrade">
							<div class="card card-nav-tabs">
								<div class="card-header" data-background-color="red">
									<div class="nav-tabs-navigation">
										<div class="nav-tabs-wrapper">
											<span class="nav-tabs-title">Services:</span>
											<ul class="nav nav-tabs" data-tabs="tabs">
												<li class="active"><a href="#room" data-toggle="tab">
														<i class="material-icons">bug_report</i> Time Service
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
												id="serviceTable">
												<thead>
													<th>Nurse Name</th>
													<th>Service Date</th>
													<th>Shift Time</th>
													<th>Department</th>
													<th></th>
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
															 :  <%=nurseServiceTime.getShiftTime().getToTime()%></td>
														<td><%=nurseServiceTime.getDepartment()%></td>
														<td class="td-actions text-right"><a
															href="servicetime.jsp?utime=<%=nurseServiceTime.getNurseServiceTimeID()%>"
															rel="tooltip" title="Edit Room"
															class="btn btn-primary btn-simple btn-xs"> <i
																class="material-icons">edit</i>
														</a> <a
															href="Process?action=DeleteServiceTime&nurseServiceTimeID=<%=nurseServiceTime.getNurseServiceTimeID()%>"
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

												<c:when test="${ not empty param['utime'] }">
													<%
														int nurseServiceTimeID = Integer.parseInt(request.getParameter("utime"));
																NurseServiceTime selectedNurseServiceTime = (NurseServiceTime) adminDAO
																		.getObject(nurseServiceTimeID, NurseServiceTime.class);
													%>

													<form action="Process?action=UpdateServiceTime"
														method="POST">
														<input type="hidden" name="nurseServiceTimeID"
															value="<%=nurseServiceTimeID%>" />


														<div class="col-sm-3">
															<div class="form-group">
																<label>Nurse<small>(required)</small></label> <select
																	required name="nurseID" class="form-control">
																	<option>Select Nurse</option>
																	<%
																		for (Nurse nurse : nurses) {
																	%>
																	<option value="<%=nurse.getEmployeeId()%>"  <%if(selectedNurseServiceTime.getNurse().getEmployeeId()==nurse.getEmployeeId()){ %> selected<%} %> ><%=nurse.getFirstName()%>
																		<%=nurse.getFatherName()%>
																		<%=nurse.getFamilyName()%> </option>
																	<%
																		}
																	%>
																</select>
															</div>
														</div>

														<div class="col-sm-3">
															<div class="form-group">
																<label>Shift Time<small>(required)</small></label> <select
																	required name="shiftTimeID" class="form-control">
																	<option>Select Shift Time</option>
																	<%
																		for (ShiftTime shiftTime : shiftTimes) {
																	%>
																	<option value="<%=shiftTime.getShiftTimeID()%>"  <%if(selectedNurseServiceTime.getShiftTime().getShiftTimeID()==shiftTime.getShiftTimeID()){ %> selected<%} %> ><%=shiftTime.getFromTime()%>
																		 : 
																		<%=shiftTime.getToTime()%></option>
																	<%
																		}
																	%>
																</select>
															</div>
														</div>

														<div class="col-sm-3">
															<div class="form-group">
																<div id="sandbox-container">
																	<label>Service Date</label>
																	<div class="input-daterange input-group"
																		id="datepicker">

																		<input class="form-control" name="serviceDate" type="text"
																			placeholder="Service Date" required readonly value="<%=FormateDate.getStringDate(selectedNurseServiceTime.getServiceDate())%>">
																		<!-- 	<span class="input-group-addon"></span> -->
																	</div>

																</div>
															</div>
														</div>


														<div class="col-sm-3">
															<div class="form-group">
																<label> Department <small>(required)</small></label> <input
																	required name="department" type="text"
																	class="form-control" placeholder="Department" value="<%=selectedNurseServiceTime.getDepartment()%>">
															</div>
														</div>
                                                           
                                                           
														<div class="col-sm-3">
															<div class="form-group">
																<input type="submit"
																	class="btn btn-round btn-fill btn-info"
																	value="Update Service Time" />
															</div>
														</div>

													</form>

												</c:when>

												<c:otherwise>
													<form action="Process?action=AddServiceTime" method="POST">

														<div class="col-sm-3">
															<div class="form-group">
																<label>Nurse<small>(required)</small></label> <select
																	required name="nurseID" class="form-control">
																	<option>Select Nurse</option>
																	<%
																		for (Nurse nurse : nurses) {
																	%>
																	<option value="<%=nurse.getEmployeeId()%>"><%=nurse.getFirstName()%>
																		<%=nurse.getFatherName()%>
																		<%=nurse.getFamilyName()%></option>
																	<%
																		}
																	%>
																</select>
															</div>
														</div>

														<div class="col-sm-3">
															<div class="form-group">
																<label>Shift Time<small>(required)</small></label> <select
																	required name="shiftTimeID" class="form-control">
																	<option>Select Shift Time</option>
																	<%
																		for (ShiftTime shiftTime : shiftTimes) {
																	%>
																	<option value="<%=shiftTime.getShiftTimeID()%>"><%=shiftTime.getFromTime()%>
																		 : 
																		<%=shiftTime.getToTime()%></option>
																	<%
																		}
																	%>
																</select>
															</div>
														</div>

														<div class="col-sm-3">
															<div class="form-group">
																<div id="sandbox-container">
																	<label>Service Date</label>
																	<div class="input-daterange input-group"
																		id="datepicker">

																		<input class="form-control" name="serviceDate" type="text"
																			placeholder="Service Date" required readonly>
																		<!-- 	<span class="input-group-addon"></span> -->
																	</div>

																</div>
															</div>
														</div>


														<div class="col-sm-3">
															<div class="form-group">
																<label> Department <small>(required)</small></label> <input
																	required name="department" type="text"
																	class="form-control" placeholder="Department">
															</div>
														</div>




														<div class="col-sm-3">
															<div class="form-group">
																<input type="submit"
																	class="btn btn-round btn-fill btn-info"
																	value="Add Service Time" />
															</div>
														</div>
													</form>


												</c:otherwise>

											</c:choose>



										</div>
										<div class="tab-pane" id="messages">
											<table class="table">
												<tbody>
													<tr>
														<td>
															<div class="checkbox">
																<label> <input type="checkbox"
																	name="optionsCheckboxes" checked>
																</label>
															</div>
														</td>
														<td>Flooded: One year later, assessing what was lost
															and what was found when a ravaging rain swept through
															metro Detroit</td>
														<td class="td-actions text-right">
															<button type="button" rel="tooltip" title="Edit Task"
																class="btn btn-primary btn-simple btn-xs">
																<i class="material-icons">edit</i>
															</button>
															<button type="button" rel="tooltip" title="Remove"
																class="btn btn-danger btn-simple btn-xs">
																<i class="material-icons">close</i>
															</button>
														</td>
													</tr>
													<tr>
														<td>
															<div class="checkbox">
																<label> <input type="checkbox"
																	name="optionsCheckboxes">
																</label>
															</div>
														</td>
														<td>Sign contract for "What are conference organizers
															afraid of?"</td>
														<td class="td-actions text-right">
															<button type="button" rel="tooltip" title="Edit Task"
																class="btn btn-primary btn-simple btn-xs">
																<i class="material-icons">edit</i>
															</button>
															<button type="button" rel="tooltip" title="Remove"
																class="btn btn-danger btn-simple btn-xs">
																<i class="material-icons">close</i>
															</button>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="tab-pane" id="settings">
											<table class="table">
												<tbody>
													<tr>
														<td>
															<div class="checkbox">
																<label> <input type="checkbox"
																	name="optionsCheckboxes">
																</label>
															</div>
														</td>
														<td>Lines From Great Russian Literature? Or E-mails
															From My Boss?</td>
														<td class="td-actions text-right">
															<button type="button" rel="tooltip" title="Edit Task"
																class="btn btn-primary btn-simple btn-xs">
																<i class="material-icons">edit</i>
															</button>
															<button type="button" rel="tooltip" title="Remove"
																class="btn btn-danger btn-simple btn-xs">
																<i class="material-icons">close</i>
															</button>
														</td>
													</tr>
													<tr>
														<td>
															<div class="checkbox">
																<label> <input type="checkbox"
																	name="optionsCheckboxes" checked>
																</label>
															</div>
														</td>
														<td>Flooded: One year later, assessing what was lost
															and what was found when a ravaging rain swept through
															metro Detroit</td>
														<td class="td-actions text-right">
															<button type="button" rel="tooltip" title="Edit Task"
																class="btn btn-primary btn-simple btn-xs">
																<i class="material-icons">edit</i>
															</button>
															<button type="button" rel="tooltip" title="Remove"
																class="btn btn-danger btn-simple btn-xs">
																<i class="material-icons">close</i>
															</button>
														</td>
													</tr>
													<tr>
														<td>
															<div class="checkbox">
																<label> <input type="checkbox"
																	name="optionsCheckboxes">
																</label>
															</div>
														</td>
														<td>Sign contract for "What are conference organizers
															afraid of?"</td>
														<td class="td-actions text-right">
															<button type="button" rel="tooltip" title="Edit Task"
																class="btn btn-primary btn-simple btn-xs">
																<i class="material-icons">edit</i>
															</button>
															<button type="button" rel="tooltip" title="Remove"
																class="btn btn-danger btn-simple btn-xs">
																<i class="material-icons">close</i>
															</button>
														</td>
													</tr>
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

