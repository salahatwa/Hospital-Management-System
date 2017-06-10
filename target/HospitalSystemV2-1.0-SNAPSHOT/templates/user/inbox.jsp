<%@page import="com.hospital.models.Employee"%>
<%@page import="com.hospital.models.Message"%>
<%@page import="java.util.List"%>
<%@page import="com.hospital.entities.HospitalService"%>
<%@page import="com.hospital.entities.UserDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>




<script src="assets/js/jquery.min.js"></script>


<script>
	$(document).ready(function() {
		$('#allMessages').DataTable();
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
	UserDAO userDAO2 = HospitalService.getInstance();
	Employee em = (Employee) session.getAttribute("employee");
	List<Message> unreadMessages = userDAO2.getAllMessagesForEmployee(em.getEmployeeId());
%>
<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<div class="card">
					<div class="card-header text-center" data-background-color="red">
						<h4 class="title">
							All Received Mails
							</h3>
							<p class="category">All Received Emails From Employee's</p>
					</div>
					<div class="card-content">


						<table id="allMessages"
							class="table table-striped table-bordered table-hover dt-responsive">

							<thead>

								<th>All Received Messages Messages</th>
							</thead>
							<tbody>
								<%
									for (Message message : unreadMessages) {
								%>

								<tr>
									<td>
									
									
									<a href="Process?action=ViewMessage&messageID=<%=message.getMessageId()%>">
											<div class="card">
												<div class="card-header"
													data-background-color="<%if (message.isMessageStatus()) {%>green<%}%><%else {%>red<%}%>">
													<h6><%=message.getFromEmployee().getFirstName()%>
														<%=message.getFromEmployee().getFatherName()%>
														<%=message.getFromEmployee().getFamilyName()%></h6>

													<h7 class="title"><%=message.getPatient().getName()%>
														<%=message.getPatient().getFatherName()%>
														<%=message.getPatient().getFamilyName()%></h7>

													<h7> <i class="fa fa-long-arrow-up"></i> <%=message.getSubject()%>
													<p align="right">
														<i class="material-icons">access_time</i>
														<%=message.getMessageDate()%></p>
													</h7>
												</div>

											</div>

									</a></td>
								</tr>

								<%
									}
								%>
							</tbody>
						</table>


					</div>
				</div>
			</div>
		</div>
	</div>
</div>

