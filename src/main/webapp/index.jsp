<%@page import="com.hospital.models.Employee"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%
Employee employee=(Employee) session.getAttribute("employee");

if(employee!=null)
	response.sendRedirect("home.jsp");

%>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Hospital Management System</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/css/scrolling-nav.css" rel="stylesheet" />
        <link href="assets/css/style.css" rel="stylesheet" type="text/css" />
        <script src="assets/js/jquery-3.1.0.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/scrolling-nav.js"></script>
        <style>

            .carousel-inner>.item>a>img, .carousel-inner>.item>img{
                width:100%;
                height:600px;
            }
            .carousel-inner{
                top:90px;
            }
            .navbar-nav{
                float:right;
            }
            #hmsNav{
                width: 100%;
            }

            .modal-dialog{
                width: 350px;
            }

        </style>

<script>
function errorPassword() {
	demo.showNotification('top','right','User name or passsword error','danger');
}
</script>

    </head>
 
<body id="page-top"  <c:if test="${not empty param['error']}">  onload="errorPassword();" </c:if> >
    
        <!-- Navigation -->
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top">Hospital Management System</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav">
                    <!-- Hidden li included to remove active class from about link when scrolled up past about section -->
                    <li class="hidden">
                        <a class="page-scroll" href="#page-top"></a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#about">About</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#services">Services</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#contact">Contact</a>
                    </li>
                    <li><a href="#" data-toggle="modal" data-target="#login-modal">Employee Login</a></li>
                    <li><a href="#" data-toggle="modal" data-target="#signup-modal">Patient Registration</a></li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
            <li data-target="#myCarousel" data-slide-to="3"></li>
            <li data-target="#myCarousel" data-slide-to="4"></li>
        </ol>

        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img src="assets/img/slide1.jpg" />
            </div>

            <div class="item">
                <img src="assets/img/slide2.jpg" />
            </div>

            <div class="item">
                <img src="assets/img/slide3.jpg" />
            </div>
            <div class="item">
                <img src="assets/img/slide4.jpg" />
            </div>
            <div class="item">
                <img src="assets/img/slide5.jpg" />
            </div>
        </div>
    </div>

    <!-- About Section -->
    <section id="about" class="about-section">
        <div class="container">
            <div class="row">
                    <div class="row">
	                    <div class="col-md-12">
	                        <div class="card">
	                            <div class="card-header" data-background-color="purple">
	                                <h4 class="title">Material Dashboard Heading</h4>
	                                <p class="category">Created using Roboto Font Family</p>
	                            </div>
	                            <div class="card-content">
									<div id="typography">
										<div class="title">
											<h2>Typography</h2>
										</div>
										<div class="row">
										
										
										 
											<div class="tim-typo">
												<h1><span class="tim-note">Header 1</span>The Life of Material Dashboard </h1>
											</div>
											<div class="tim-typo">
												<h2><span class="tim-note">Header 2</span>The life of Material Dashboard </h2>
											</div>
											<div class="tim-typo">
												<h3><span class="tim-note">Header 3</span>The life of Material Dashboard </h3>
											</div>
											<div class="tim-typo">
												<h4><span class="tim-note">Header 4</span>The life of Material Dashboard </h4>
											</div>
											<div class="tim-typo">
												<h6><span class="tim-note">Header 6</span>The life of Material Dashboard </h6>
											</div>
											<div class="tim-typo">
												<p><span class="tim-note">Paragraph</span>
													I will be the leader of a company that ends up being worth billions of dollars, because I got the answers. I understand culture. I am the nucleus. I think that’s a responsibility that I have, to push possibilities, to show people, this is the level that things could be at.</p>
											</div>
											<div class="tim-typo">
												<span class="tim-note">Quote</span>
												<blockquote>
												 <p>
												 I will be the leader of a company that ends up being worth billions of dollars, because I got the answers. I understand culture. I am the nucleus. I think that’s a responsibility that I have, to push possibilities, to show people, this is the level that things could be at.
												 </p>
												 <small>
												 Kanye West, Musician
												 </small>
												</blockquote>
											</div>

											<div class="tim-typo">
												<span class="tim-note">Muted Text</span>
												<p class="text-muted">
												I will be the leader of a company that ends up being worth billions of dollars, because I got the answers...
												</p>
											</div>
											<div class="tim-typo">
												<span class="tim-note">Primary Text</span>
												<p class="text-primary">
												I will be the leader of a company that ends up being worth billions of dollars, because I got the answers...                        </p>
											</div>
											<div class="tim-typo">
												<span class="tim-note">Info Text</span>
												<p class="text-info">
												I will be the leader of a company that ends up being worth billions of dollars, because I got the answers...                        </p>
											</div>
											<div class="tim-typo">
												<span class="tim-note">Success Text</span>
												<p class="text-success">
												I will be the leader of a company that ends up being worth billions of dollars, because I got the answers...                        </p>
											</div>
											<div class="tim-typo">
												<span class="tim-note">Warning Text</span>
												<p class="text-warning">
												I will be the leader of a company that ends up being worth billions of dollars, because I got the answers...
												</p>
											</div>
											<div class="tim-typo">
												<span class="tim-note">Danger Text</span>
												<p class="text-danger">
												I will be the leader of a company that ends up being worth billions of dollars, because I got the answers...                        </p>
											</div>
											
										</div>
									</div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            
            </div>
        </div>
    </section>

    <!-- Services Section -->
    <section id="services" class="services-section">
        <div class="container">
                <div class="row">
                    <div class="row">
	                    <div class="col-md-12">
	                        <div class="card">
	                            <div class="card-header" data-background-color="purple">
	                                <h4 class="title">Material Dashboard Heading</h4>
	                                <p class="category">Created using Roboto Font Family</p>
	                            </div>
	                            <div class="card-content">
									<div id="typography">
										<div class="title">
											<h2>Typography</h2>
										</div>
										<div class="row">
											<div class="tim-typo">
												<h1><span class="tim-note">Header 1</span>The Life of Material Dashboard </h1>
											</div>
											<div class="tim-typo">
												<h2><span class="tim-note">Header 2</span>The life of Material Dashboard </h2>
											</div>
											<div class="tim-typo">
												<h3><span class="tim-note">Header 3</span>The life of Material Dashboard </h3>
											</div>
											<div class="tim-typo">
												<h4><span class="tim-note">Header 4</span>The life of Material Dashboard </h4>
											</div>
											<div class="tim-typo">
												<h6><span class="tim-note">Header 6</span>The life of Material Dashboard </h6>
											</div>
											<div class="tim-typo">
												<p><span class="tim-note">Paragraph</span>
													I will be the leader of a company that ends up being worth billions of dollars, because I got the answers. I understand culture. I am the nucleus. I think that’s a responsibility that I have, to push possibilities, to show people, this is the level that things could be at.</p>
											</div>
											<div class="tim-typo">
												<span class="tim-note">Quote</span>
												<blockquote>
												 <p>
												 I will be the leader of a company that ends up being worth billions of dollars, because I got the answers. I understand culture. I am the nucleus. I think that’s a responsibility that I have, to push possibilities, to show people, this is the level that things could be at.
												 </p>
												 <small>
												 Kanye West, Musician
												 </small>
												</blockquote>
											</div>

											<div class="tim-typo">
												<span class="tim-note">Muted Text</span>
												<p class="text-muted">
												I will be the leader of a company that ends up being worth billions of dollars, because I got the answers...
												</p>
											</div>
											<div class="tim-typo">
												<span class="tim-note">Primary Text</span>
												<p class="text-primary">
												I will be the leader of a company that ends up being worth billions of dollars, because I got the answers...                        </p>
											</div>
											<div class="tim-typo">
												<span class="tim-note">Info Text</span>
												<p class="text-info">
												I will be the leader of a company that ends up being worth billions of dollars, because I got the answers...                        </p>
											</div>
											<div class="tim-typo">
												<span class="tim-note">Success Text</span>
												<p class="text-success">
												I will be the leader of a company that ends up being worth billions of dollars, because I got the answers...                        </p>
											</div>
											<div class="tim-typo">
												<span class="tim-note">Warning Text</span>
												<p class="text-warning">
												I will be the leader of a company that ends up being worth billions of dollars, because I got the answers...
												</p>
											</div>
											<div class="tim-typo">
												<span class="tim-note">Danger Text</span>
												<p class="text-danger">
												I will be the leader of a company that ends up being worth billions of dollars, because I got the answers...                        </p>
											</div>
											
										</div>
									</div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            
            </div>
       
        </div>
    </section>

    <!-- Contact Section -->
    <section id="contact" class="contact-section">
        <div class="container">
                <div class="row">
                    <div class="row">
	                    <div class="col-md-12">
	                        <div class="card">
	                            <div class="card-header" data-background-color="purple">
	                                <h4 class="title">Material Dashboard Heading</h4>
	                                <p class="category">Created using Roboto Font Family</p>
	                            </div>
	                            <div class="card-content">
									<div id="typography">
										<div class="title">
											<h2>Typography</h2>
										</div>
										<div class="row">
											<div class="tim-typo">
												<h1><span class="tim-note">Header 1</span>The Life of Material Dashboard </h1>
											</div>
											<div class="tim-typo">
												<h2><span class="tim-note">Header 2</span>The life of Material Dashboard </h2>
											</div>
											<div class="tim-typo">
												<h3><span class="tim-note">Header 3</span>The life of Material Dashboard </h3>
											</div>
											<div class="tim-typo">
												<h4><span class="tim-note">Header 4</span>The life of Material Dashboard </h4>
											</div>
											<div class="tim-typo">
												<h6><span class="tim-note">Header 6</span>The life of Material Dashboard </h6>
											</div>
											<div class="tim-typo">
												<p><span class="tim-note">Paragraph</span>
													I will be the leader of a company that ends up being worth billions of dollars, because I got the answers. I understand culture. I am the nucleus. I think that’s a responsibility that I have, to push possibilities, to show people, this is the level that things could be at.</p>
											</div>
											<div class="tim-typo">
												<span class="tim-note">Quote</span>
												<blockquote>
												 <p>
												 I will be the leader of a company that ends up being worth billions of dollars, because I got the answers. I understand culture. I am the nucleus. I think that’s a responsibility that I have, to push possibilities, to show people, this is the level that things could be at.
												 </p>
												 <small>
												 Kanye West, Musician
												 </small>
												</blockquote>
											</div>

											<div class="tim-typo">
												<span class="tim-note">Muted Text</span>
												<p class="text-muted">
												I will be the leader of a company that ends up being worth billions of dollars, because I got the answers...
												</p>
											</div>
											<div class="tim-typo">
												<span class="tim-note">Primary Text</span>
												<p class="text-primary">
												I will be the leader of a company that ends up being worth billions of dollars, because I got the answers...                        </p>
											</div>
											<div class="tim-typo">
												<span class="tim-note">Info Text</span>
												<p class="text-info">
												I will be the leader of a company that ends up being worth billions of dollars, because I got the answers...                        </p>
											</div>
											<div class="tim-typo">
												<span class="tim-note">Success Text</span>
												<p class="text-success">
												I will be the leader of a company that ends up being worth billions of dollars, because I got the answers...                        </p>
											</div>
											<div class="tim-typo">
												<span class="tim-note">Warning Text</span>
												<p class="text-warning">
												I will be the leader of a company that ends up being worth billions of dollars, because I got the answers...
												</p>
											</div>
											<div class="tim-typo">
												<span class="tim-note">Danger Text</span>
												<p class="text-danger">
												I will be the leader of a company that ends up being worth billions of dollars, because I got the answers...                        </p>
											</div>
											
										</div>
									</div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            
            </div>
       
        </div>
    </section>

    <div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog">
            <div class="loginmodal-container">
                <h1>Login to Your Account</h1><br>
                <form method="POST" action="LoginService">
                    <input type="text" name="user" placeholder="Username" required>
                    <input type="password" name="pass" placeholder="Password" required>
                    <input type="submit" name="login" class="login loginmodal-submit" value="Login">
                </form>
            </div>
        </div>
    </div>

    <div class="modal fade" id="signup-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog">
            <div class="signupmodal-container">
                <h1>Patient Registration</h1><br>
                <form id="signupform" method="POST" action="Process?action=addPatient">
                    <input type="text" name="fullname" placeholder="Full Name" required>
                    <label>Select Category</label>
                    <select name="catid"></select>
                    <input type="text" name="dob" placeholder="Date of Birth" readonly class="dob" />
                    <div class="radio">
                        <label><input type="radio" name="gender" value="male" required/> Male</label>
                        <label><input type="radio" name="gender" value="female"/> Female</label>
                    </div>
                    <input type="submit" name="signup" class="signup signupmodal-submit" value="Register">
                </form>
            </div>
        </div>
    </div>


	<!--  Notifications Plugin    -->
	<script src="assets/js/bootstrap-notify.js"></script>

	<!-- Material Dashboard DEMO methods, don't include it in your project! -->
	<script src="assets/js/demo.js"></script>

</body>
</html>
