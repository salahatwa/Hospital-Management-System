<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.hospital.models.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	Employee employee = (Employee) session.getAttribute("employee");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome <%=employee.getFirstName()%></title>

<!-- Bootstrap core CSS     -->
<link href="assets/css/bootstrap.min.css" rel="stylesheet" />

<link href="assets/css/dataTables.bootstrap.min.css" rel="stylesheet" />

<link href="assets/css/bootstrap.css" rel="stylesheet" />

<!--  Material Dashboard CSS    -->
<link href="assets/css/material-dashboard.css" rel="stylesheet" />

<link href="assets/css/jquery-ui.min.css" rel="stylesheet" />

<link href="assets/css/scrolling-nav.css" rel="stylesheet" />


<link href="assets/css/style.css" rel="stylesheet" />

<!--  CSS for Demo Purpose, don't include it in your project     -->
<link href="assets/css/gsdk-bootstrap-wizard.css" rel="stylesheet" />

<!--     Fonts and icons     -->
<link href="assets/css/font-awesome.min.css" rel="stylesheet" />

<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons'
	rel='stylesheet' type='text/css'>


</head>
<body>

	<div class="wrapper">

		<%@include file="templates/user/side-bar.jsp"%>

		<div class="main-panel">

			<%@include file="templates/user/nav-bar.jsp"%>

			<%@include file="templates/user/inbox.jsp"%>

			<%@include file="templates/footer.jsp"%>
		</div>

	</div>



	<script src="assets/js/jquery-3.1.0.min.js" type="text/javascript"></script>
	<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="assets/js/material.min.js" type="text/javascript"></script>

	<!--  Charts Plugin -->
	<script src="assets/js/chartist.min.js"></script>

	<!--  Notifications Plugin    -->
	<script src="assets/js/bootstrap-notify.js"></script>


	<!-- Material Dashboard javascript methods -->
	<script src="assets/js/material-dashboard.js"></script>

	<!-- Material Dashboard DEMO methods, don't include it in your project! -->
	<script src="assets/js/demo.js"></script>


	<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="assets/js/jquery.bootstrap.wizard.js"
		type="text/javascript"></script>

	<!--  Plugin for the Wizard -->
	<script src="assets/js/gsdk-bootstrap-wizard.js"></script>

	<!--  More information about jquery.validate here: http://jqueryvalidation.org/	 -->
	<script src="assets/js/jquery.validate.min.js"></script>


	<script src="assets/js/jquery.dataTables.min.js"></script>

	<script src="assets/js/dataTables.bootstrap.min.js"></script>


</body>
</html>