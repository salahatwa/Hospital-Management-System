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
        $('#roomTable').DataTable();
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
    List<RoomType> roomTypes = adminDAO.getListObjects(RoomType.class);
    List<Room> rooms = adminDAO.getListObjects(Room.class);
%>
<div class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-9 col-md-offset-2">
                <div class="card">
                    <div class="card-header text-center" data-background-color="red">
                        <h4 class="title">
                            Manage Rooms
                            </h3>
                            <p class="category">Add and delete bed</p>
                    </div>
                    <div class="card-content">
                        <div class="table-responsive table-upgrade">
                            <div class="card card-nav-tabs">
                                <div class="card-header" data-background-color="red">
                                    <div class="nav-tabs-navigation">
                                        <div class="nav-tabs-wrapper">
                                            <span class="nav-tabs-title">Rooms:</span>
                                            <ul class="nav nav-tabs" data-tabs="tabs">
                                                <li class="active"><a href="#room" data-toggle="tab">
                                                        <i class="material-icons">bug_report</i> Rooms
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
                                                id="roomTable">
                                                <thead>
                                                <th>Room Type</th>
                                                <th>Room Number</th>
                                                <th>Number of beds</th>
                                                <th>Number of available beds</th>
                                                <th>Room Cost</th>
                                                <th></th>
                                                </thead>
                                                <tbody>

                                                    <%
                                                        for (Room room : rooms) {
                                                    %>

                                                    <tr>

                                                        <td><%=room.getRoomType().getTypeOfroom()%></td>
                                                        <td><%= room.getRoomNumber() %></td>
                                                        <td><%=room.getNumberOfBeds()%></td>
                                                        <td><%=room.getNumberOfAvailableBeds()%></td>
                                                        <td><%=room.getRoomType().getRoomCost()%></td>
                                                        <td class="td-actions text-right"><a 
                                                                href="mgmtroom.jsp?uroom=<%=room.getRoomId()%>"
                                                                rel="tooltip" title="Edit Room"
                                                                class="btn btn-primary btn-simple btn-xs"> <i
                                                                    class="material-icons">edit</i>
                                                            </a> <a
                                                                href="Process?action=DeleteRoom&roomID=<%=room.getRoomId()%>"
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

                                                <c:when test="${ not empty param['uroom'] }">
                                                    <%
                                                        int roomID = Integer.parseInt(request.getParameter("uroom"));
                                                        Room selectedRoom = (Room) adminDAO.getObject(roomID, Room.class);
                                                    %>

                                                    <form action="Process?action=UpdateRoom" method="POST">
                                                        <input type="hidden" name="roomID" value="<%=roomID%>"/>
                                                        <div class="col-sm-3">
                                                            <div class="form-group">
                                                                <label>Room Type <small>(required)</small></label> <select
                                                                    name="roomTypeID" class="form-control" required>
                                                                    <option>Select Room Type</option>
                                                                    <%
                                                                        for (RoomType roomType : roomTypes) {
                                                                    %>
                                                                            <option value="<%=roomType.getRoomTypeId()%>" <% if (selectedRoom.getRoomType().getRoomTypeId() == roomType.getRoomTypeId()) {
                                                                            out.print("selected");
                                                                        }%> ><%=roomType.getTypeOfroom()%></option>
                                                                    <%
                                                                        }
                                                                    %>
                                                                </select>
                                                            </div>
                                                        </div>

                                                        <div class="col-sm-3">
                                                            <div class="form-group">
                                                                <label>Room Number <small>(required)</small></label>
                                                                <input required name="roomNumber" type="number"  value="<%=selectedRoom.getRoomNumber()%>"
                                                                       class="form-control" placeholder="Room Number">
                                                            </div>
                                                        </div>

                                                        <div class="col-sm-3">
                                                            <div class="form-group">
                                                                <label>Number Of Beds <small>(required)</small></label>
                                                                <input required name="bedNumbers" type="number" value="<%=selectedRoom.getNumberOfBeds()%>"
                                                                       class="form-control" placeholder="Number of beds">
                                                            </div>
                                                        </div>




                                                        <div class="col-sm-3">
                                                            <div class="form-group">
                                                                <input type="submit"
                                                                       class="btn btn-round btn-fill btn-info"
                                                                       value="Update Room" />
                                                            </div>
                                                        </div>
                                                    </form>

                                                </c:when>

                                                <c:otherwise>
                                                    <form action="Process?action=AddRoom" method="POST">
                                                        <div class="col-sm-3">
                                                            <div class="form-group">
                                                                <label>Room Type <small> (required) </small></label> <select
                                                                    required name="roomTypeID" class="form-control">
                                                                    <option>Select Room Type</option>
                                                                    <%
                                                                        for (RoomType roomType : roomTypes) {
                                                                    %>
                                                                    <option value="<%=roomType.getRoomTypeId()%>"><%=roomType.getTypeOfroom()%></option>
                                                                    <%
                                                                        }
                                                                    %>
                                                                </select>
                                                            </div>
                                                        </div>

                                                        <div class="col-sm-3">
                                                            <div class="form-group">
                                                                <label>Room Number <small>(required)</small></label>
                                                                <input required name="roomNumber" type="number"
                                                                       class="form-control" placeholder="Room Number">
                                                            </div>
                                                        </div>

                                                        <div class="col-sm-3">
                                                            <div class="form-group">
                                                                <label>Number Of Beds <small>(required)</small></label>
                                                                <input required name="bedNumbers" type="number"
                                                                       class="form-control" placeholder="Number of beds">
                                                            </div>
                                                        </div>




                                                        <div class="col-sm-3">
                                                            <div class="form-group">
                                                                <input type="submit"
                                                                       class="btn btn-round btn-fill btn-info"
                                                                       value="Add Room" />
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

