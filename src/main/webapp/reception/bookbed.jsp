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
		$('#bookBedTable').DataTable();
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
	ReceptioniestDAO receptioniestDAO = HospitalService.getInstance();

	Employee currentEmp = (Employee) session.getAttribute("employee");
	List<Patient> patients = receptioniestDAO.getListObjects(Patient.class);

	List<BookBed> bookBeds = receptioniestDAO.getListObjects(BookBed.class);

	List<Room> rooms = receptioniestDAO.getAllAvailableRoom();
%>
<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<div class="card">
					<div class="card-header text-center" data-background-color="red">
						<h4 class="title">
							Book Bed
							</h3>
							<p class="category">Book Bed for Patient</p>
					</div>
					<div class="card-content">
						<div class="table-responsive table-upgrade">
							<div class="card card-nav-tabs">
								<div class="card-header" data-background-color="red">
									<div class="nav-tabs-navigation">
										<div class="nav-tabs-wrapper">
											<span class="nav-tabs-title">Booked Beds:</span>
											<ul class="nav nav-tabs" data-tabs="tabs">
												<li class="active"><a href="#room" data-toggle="tab">
														<i class="material-icons">bug_report</i> Booked Beds
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
												id="bookBedTable">
												<thead>
													<th>Patient</th>
													<th>Departement</th>
													<th>Date of Booked</th>
													<th>Room</th>
													<th>Room Type</th>
													<th>Status</th>
													<th></th>
												</thead>
												<tbody>

													<%
														for (BookBed bookBed : bookBeds) {
													%>

													<tr>
														<td><%=bookBed.getPatient().getName()%> <%=bookBed.getPatient().getFatherName()%>
															<%=bookBed.getPatient().getFamilyName()%></td>
														<td><%=bookBed.getDepartement()%></td>
														<td><%=bookBed.getDatePlaced()%></td>
														<td><%=bookBed.getRoom().getRoomId()%></td>
														<td><%=bookBed.getRoom().getRoomType().getTypeOfroom()%></td>
														<td><%=bookBed.isStatus()%></td>
														<td class="td-actions text-right"><a
															href="bookBed.jsp?ubbed=<%=bookBed.getBedId()%>"
															rel="tooltip" title="Edit Room"
															class="btn btn-primary btn-simple btn-xs"> <i
																class="material-icons">edit</i>
														</a> <a
															href="Process?action=DeleteBookBed&ubbed=<%=bookBed.getBedId()%>"
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

												<c:when test="${ not empty param['ubbed'] }">
													<%
														int bookBedID = Integer.parseInt(request.getParameter("ubbed"));
																BookBed selectedBookBed = (BookBed) receptioniestDAO.getObject(bookBedID, BookBed.class);
													%>

													<form action="Process?action=UpdateBookBed" method="POST">
														<input type="hidden" name="bookBedID" value="<%=bookBedID%>" />
														<div class="col-sm-3">
															<div class="form-group">
																<label>Room <small>(required)</small></label> <select
																	name="roomTypeID" class="form-control" required>
																	<option>Select Room</option>
																	<%
																		for (Room room : rooms) {
																	%>
																	<option value="<%=room.getRoomId()%>"
																		<%if (selectedBookBed.getRoom().getRoomId() == room.getRoomId())
							out.print("selected");%>>
																		<%=room.getRoomType().getTypeOfroom()%> /
																		<%=room.getRoomType().getRoomCost()%>
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
																		<%if (selectedBookBed.getPatient().getPatientId() == patient.getPatientId())
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
																<label>Departement <small>(required)</small></label> <input
																	required name="departement" type="text"
																	class="form-control" placeholder="Departement"
																	value="<%=selectedBookBed.getDepartement()%>">
															</div>
														</div>



														<div class="col-sm-3">
															<div class="form-group">
																<input type="submit"
																	class="btn btn-round btn-fill btn-info"
																	value="Update BookedBed" />
															</div>
														</div>
													</form>

												</c:when>

												<c:otherwise>
													<form action="Process?action=BookBed" method="POST">


														<div class="col-sm-3">
															<div class="form-group">
																<label>Room <small>(required)</small></label> <select
																	name="roomTypeID" class="form-control" required>
																	<option>Select Room</option>
																	<%
																		for (Room room : rooms) {
																	%>
																	<option value="<%=room.getRoomId()%>">
																		<%=room.getRoomType().getTypeOfroom()%> /
																		<%=room.getRoomType().getRoomCost()%>
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
																<label>Departement <small>(required)</small></label> <input
																	required name="departement" type="text"
																	class="form-control" placeholder="Departement">
															</div>
														</div>

													

														<div class="col-sm-3">
															<div class="form-group">
																<input type="submit"
																	class="btn btn-round btn-fill btn-info"
																	value="Book Bed" />
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

