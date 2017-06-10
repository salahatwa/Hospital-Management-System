<%@page import="com.hospital.models.Message"%>
<%@page import="com.hospital.models.Employee"%>
<%@page import="java.util.List"%>
<%@page import="com.hospital.entities.HospitalService"%>
<%@page import="com.hospital.entities.UserDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>




<script src="assets/js/jquery.min.js"></script>


<script>
	$(document).ready(function() {
		$('#allselectedMessages').DataTable();
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
	Message selectedMessage = (Message) session.getAttribute("selectedMessage");
    
%>
<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<div class="card">
					
					<div class="card-content">

						<div class="card">
							<div class="card-header"
								data-background-color="gray">
								<h6><%=selectedMessage.getFromEmployee().getFirstName()%>
									<%=selectedMessage.getFromEmployee().getFatherName()%>
									<%=selectedMessage.getFromEmployee().getFamilyName()%></h6>
							</div>
							<div class="card-content">
								<h4 class="title"><%=selectedMessage.getPatient().getName()%>
									<%=selectedMessage.getPatient().getFatherName()%>
									<%=selectedMessage.getPatient().getFamilyName()%></h4>
								<p class="category">
									<span class="text-success"><i
										class="fa fa-long-arrow-up"></i> <%=selectedMessage.getSubject()%> </span>
								</p>
								<h2><%=selectedMessage.getMessageBody() %></h2>
							</div>
							<div class="card-footer">
								<div class="stats">
									<i class="material-icons">access_time</i>
									<%=selectedMessage.getMessageDate()%>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</div>

