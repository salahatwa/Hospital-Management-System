<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.util.Date"%>
<%@page import="com.hospital.entities.AccountantDAO"%>
<%@page import="com.hospital.entities.DoctorDAO"%>
<%@page import="com.hospital.models.Disease"%>
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
    $(document).ready(function () {
        $('#viewPatientTable').DataTable();
    });
</script>
<!--  Made With Get Shit Done Kit  -->
<a href="#" class="made-with-mk">
    <div class="brand">Eng</div>
    <div class="made-with">
        Made with <strong>Mostafa</strong>
    </div>
</a>
<%
    AccountantDAO accountantDAO = HospitalService.getInstance();

    List<BookBed> bookBeds = accountantDAO.getListObjects(BookBed.class);
%>
<div class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <div class="card">
                    <div class="card-header text-center" data-background-color="red">
                        <h4 class="title">
                            View Patient Fees
                            </h3>
                            <p class="category">View Patient Fees</p>
                    </div>
                    <div class="card-content">
                        <div class="table-responsive table-upgrade">
                            <div class="card card-nav-tabs">
                                <div class="card-header" data-background-color="red">
                                    <div class="nav-tabs-navigation">
                                        <div class="nav-tabs-wrapper">
                                            <span class="nav-tabs-title">Patient Fees:</span>
                                            <ul class="nav nav-tabs" data-tabs="tabs">
                                                <li class="active"><a href="#disease" data-toggle="tab">
                                                        <i class="material-icons">bug_report</i>Patient Fees
                                                        <div class="ripple-container"></div>
                                                    </a></li>

                                            </ul>
                                        </div>
                                    </div>
                                </div>

                                <div class="card-content">
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="disease">
                                            <table
                                                class="table table-striped table-bordered table-hover dt-responsive "
                                                id="viewPatientTable">
                                                <thead>
                                                <th>Patient</th>
                                                <th>Blood</th>
                                                <th>Dept</th>
                                                <th>Join Date</th>
                                                <th>Room.No</th>
                                                <th>Room.Type</th>
                                                <th>Room Cost</th>
                                                <th>Days</th>
                                                <th>Total Cost</th>
                                                <th>Fees</th>
                                                <th></th>
                                                </thead>
                                                <tbody>
                                                    <%!
                                                        public static long getDifferenceDays(Date d1, Date d2) {
                                                            long diff = d2.getTime() - d1.getTime();
                                                            return TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS);
                                                        }
                                                    %>

                                                    <%
                                                        for (BookBed bookBed : bookBeds) {
                                                    %>

                                                    <%
                                                        Date currentDate = new Date();
                                                        long totalNumberOfDayes = getDifferenceDays(bookBed.getDatePlaced(), currentDate);
                                                        double totalCost = totalNumberOfDayes * bookBed.getRoom().getRoomType().getRoomCost();
                                                        out.print(totalNumberOfDayes + ":\t:" + bookBed.getRoom().getRoomType().getRoomCost());
                                                    %>

                                                    <tr>
                                                        <td><%=bookBed.getPatient().getName()%> <%=bookBed.getPatient().getFatherName()%>
                                                            <%=bookBed.getPatient().getFamilyName()%></td>

                                                        <td><%=bookBed.getPatient().getBloodGroup().getBloodGroupName()%></td>
                                                        <td><%=bookBed.getDepartement()%></td>

                                                        <td><%=bookBed.getDatePlaced()%></td>
                                                        <td><%=bookBed.getRoom().getRoomId()%></td>
                                                        <td><%=bookBed.getRoom().getRoomType().getTypeOfroom()%></td>
                                                        <td><%=bookBed.getRoom().getRoomType().getRoomCost()%></td>
                                                        <td><%=totalNumberOfDayes%></td>
                                                        <td><%=totalCost%></td>

                                                        <td>
                                                            <%
                                                                if (bookBed.isStatus()) {
                                                            %> Paid success <%
                                                            } else {
                                                            %>Not Paid Yet<%
                                                                }
                                                            %>
                                                        </td>
                                                        <td>
<!--                                                        <td><a
                                                                href="Process?action=CheckedPatientFees&bid=<%=bookBed.getBedId()%>">
                                                                <input type="checkbox" <%if (bookBed.isStatus()) { %>
                                                                       checked <%}%> />
                                                            </a
                                                            -->
                                                            
                                                            <a href="Process?action=CheckedPatientFees&bid=<%=bookBed.getBedId()%>">Check
                                                            </a>
                                                            
                                                            <td>

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
                </div>
            </div>
        </div>
    </div>
</div>

