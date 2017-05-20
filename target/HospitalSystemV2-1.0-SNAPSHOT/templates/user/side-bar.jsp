<%@page import="com.hospital.models.Employee"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	Employee emp2 = (Employee) session.getAttribute("employee");
%>

<div class="sidebar" data-color="red"
	data-image="assets/img/sidebar-2.jpg">
	<!--
		        Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"

		        Tip 2: you can also add an image using data-image tag
		    -->

	<div class="logo">
		<a href="employeeProfile.jsp" class="simple-text"> <%=emp2.getFirstName()%>
			<%=emp2.getFatherName()%>
		</a>



	</div>

	<div class="sidebar-wrapper">
		<ul class="nav">

			<li><a href="compose.jsp" class="btn btn-default"> <i
					class="material-icons">location_on</i>
					<p>Compose</p>
			</a></li>

			<li><a href="home.jsp"> <i class="material-icons">dashboard</i>
					<p>Home</p>
			</a></li>

			<%
				if (emp2.getType().equals("Admin")) {
			%>
			<li><a href="empmgmt.jsp"> <i class="material-icons">person</i>
					<p>Manage Employee</p>
			</a></li>
			<li><a href="mgmtroom.jsp"> <i class="material-icons">content_paste</i>
					<p>Manage Room</p>
			</a></li>
			<li><a href="servicetime.jsp"> <i class="material-icons">location_on</i>
					<p>Nurse Service Time</p>
			</a></li>
			<%
				} else if (emp2.getType().equals("Receptioniest")) {
			%>
			<li><a href="patientmgmt.jsp"> <i class="material-icons">person</i>
					<p>Manage Patient</p>
			</a></li>
			<li><a href="bookBed.jsp"> <i class="material-icons">content_paste</i>
					<p>Book Bed</p>
			</a></li>

			<%
				} else if (emp2.getType().equals("Doctor")) {
			%>
			<li><a href="dieseasePatient.jsp"> <i class="material-icons">person</i>
					<p>Disease Patient</p>
			</a></li>
			<%
				} else if (emp2.getType().equals("Pharmatiest")) {
			%>
			<li><a href="drugmgmt.jsp"> <i class="material-icons">person</i>
					<p>Manage Drug</p>
			</a></li>
			<li><a href="selldrug.jsp"> <i class="material-icons">content_paste</i>
					<p>Sell Drug</p>
			</a></li>

			<%
				} else if (emp2.getType().equals("Nurse")) {
			%>
			<li><a href="viewpatient.jsp"> <i class="material-icons">person</i>
					<p>View Patient</p>
			</a></li>
			
			<li><a href="viewservice.jsp"> <i class="material-icons">person</i>
					<p>View Service Time</p>
			</a></li>

			<%
				} else if (emp2.getType().equals("Lab")) {
			%>
			<li><a href="viewpatient.jsp"> <i class="material-icons">person</i>
					<p>View Patient</p>
			</a></li>

			<%
				} else if (emp2.getType().equals("Xray")) {
			%>
			<li><a href="viewpatient.jsp"> <i class="material-icons">person</i>
					<p>View Patient</p>
			</a></li>

			<%
				} else if (emp2.getType().equals("Accountant")) {
			%>
			<li><a href="computefees.jsp"> <i class="material-icons">person</i>
					<p>Patient Fees</p>
			</a></li>

			<%
				}
			%>


			<li><a href="inbox.jsp"> <i class="material-icons">library_books</i>
					<p>Inbox</p>
			</a>
			<li><a href="sentMail.jsp"> <i
					class="material-icons text-gray">notifications</i>
					<p>Sent Mails</p>
			</a></li>

			<!--<li><a href="maps.html"> <i class="material-icons">location_on</i>
					<p>Maps</p>
			</a></li> -->

			<li class="active-pro"><a href="changePassword.jsp"> <i
					class="material-icons">unarchive</i>
					<p>Change Password</p>
			</a></li>

			<li><a href="logout.jsp"> <i class="material-icons">bubble_chart</i>
					<p>Log out</p>
			</a></li>
		</ul>
	</div>
</div>

