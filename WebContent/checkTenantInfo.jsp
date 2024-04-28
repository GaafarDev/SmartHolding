<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.List, com.project.database.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Page Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- Add any additional styles or links here -->
</head>
<body>
    <%
        List<Tenant> tl = (List<Tenant>)request.getAttribute("tenantlist");
        List<Rental> rl = (List<Rental>)request.getAttribute("rentallist");
        List<Room> rol = (List<Room>)request.getAttribute("roomlist");
    %>
    <jsp:include page="headerAdmin.jsp" />

<div class="content d-flex justify-content-center">
    <table class="table table-striped" style="width: 60%;" >
            <thead>
                <tr>
                    <th scope="col">Tenant</th>
                    <th scope="col">Current Rental</th>
                </tr>
            </thead>
            <tbody>
                <% for(int i=0; i<tl.size(); i++) { %>
                    <tr>
                        <td><%= tl.get(i).getFirstName() + " " + tl.get(i).getLastName() %></td>
                        <td>
                            <% for(int j=0; j<rl.size(); j++) {
                                if(rl.get(j).getTenantId() == tl.get(i).getTenantId()) { %>
                                    <%= (j+1) + ". " + rl.get(j).getRentalDate() %> - <%= rl.get(j).getRentalDateEnd() %> [
                                    <% for(int k=0; k<rol.size(); k++) {
                                        if(rol.get(k).getRoomId() == rl.get(j).getRoomId()) { %>
                                            <%= rol.get(k).getRoomNo() %>
                                        <% } %>
                                    <% } %>]
                                    <br>
                                <% } %>
                            <% } %>
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <!-- Add any additional scripts or links here -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-rnN0A7S1jsT1hu9RHlMpaZJ7fdiN/kd8fXVn4+2oIyoJ4u0FQFnJkw/ZIzhSIAfy" crossorigin="anonymous"></script>
</body>
</html>
