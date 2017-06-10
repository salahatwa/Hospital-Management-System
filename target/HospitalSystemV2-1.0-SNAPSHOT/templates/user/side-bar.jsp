<%@page import="com.hospital.models.Message"%>
<%@page import="java.util.List"%>
<%@page import="com.hospital.entities.HospitalService"%>
<%@page import="com.hospital.entities.UserDAO"%>
<%@page import="com.hospital.models.Employee"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	UserDAO userDAO = HospitalService.getInstance();

	Employee emp2 = (Employee) session.getAttribute("employee");

	List<Message> messages = userDAO.getAllUnreadMessagesForEmployee(emp2.getEmployeeId());
%>

<div class="sidebar" data-color="red"
	data-image="assets/img/sidebar-2.jpg">
	<!--
		        Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"

		        Tip 2: you can also add an image using data-image tag
		    -->

	<div class="logo">
		<a href="employeeProfile.jsp" class="simple-text"> <%=emp2.getFirstName()%>
			<%=emp2.getFamilyName()%>
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
				} else if (emp2.getType().equals("Receptionist")) {
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
				} else if (emp2.getType().equals("pharmacist")) {
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

					<p>
						Inbox <span class="notification"><%= messages.size() %></span>
					</p>


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

