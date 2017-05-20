<%@page import="com.hospital.models.Employee"%>
<%@page import="com.hospital.models.Message"%>
<%@page import="java.util.List"%>
<%@page import="com.hospital.entities.HospitalService"%>
<%@page import="com.hospital.entities.UserDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<script src="assets/js/jquery.min.js"></script>


<script>

    $(document).ready(function () {
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
    UserDAO userDAO = HospitalService.getInstance();
    Employee em = (Employee) session.getAttribute("employee");
    List<Message> messages = userDAO.getAllMessagesSentByEmployee(em.getEmployeeId());
%>
<div class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <div class="card">
                    <div class="card-header text-center" data-background-color="red">
                        <h4 class="title">
                            All Sent Mails
                            </h3>
                            <p class="category">Sent Emails To different Employee's</p>
                    </div>
                    <div class="card-content">

                        <table id="allMessages" class="table table-striped table-bordered table-hover dt-responsive">

                            <thead>

                            <th>All Sent Messages</th>
                            </thead>
                            <tbody>
                                <%
                                    for (Message message : messages) {
                                %>

                                <tr><td>
                                        
                                            <div class="card">
                                                <div class="card-header"
                                                     data-background-color="green">
                                                    <h4><%=message.getToEmployee().getFirstName()%> <%=message.getToEmployee().getFatherName()%> <%=message.getToEmployee().getFamilyName()%></h4>
                                                </div>
                                                <div class="card-content">
                                                    <h4 class="title"><%=message.getPatient().getName()%> <%=message.getPatient().getFatherName()%> <%=message.getPatient().getFamilyName()%></h4>
                                                    <p class="category">
                                                        <span class="text-success"><i
                                                                class="fa fa-long-arrow-up"></i> <%=message.getSubject()%> </span> <%=message.getMessageBody()%>

                                                    </p>
                                                </div>
                                                <div class="card-footer">
                                                    <div class="stats">
                                                        <i class="material-icons">access_time</i> <%=message.getMessageDate()%>
                                                    </div>
                                                </div>
                                            </div>



                                    </td></tr>

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

