<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.project.database.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tenant Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- Add any additional styles or links here -->
</head>
<body>

    <jsp:include page="headerTenant.jsp" />
<% Tenant curT = (Tenant)session.getAttribute("tenant");
	Room room = (Room)request.getAttribute("room");
	
	//curT is Tenant bean object 
	//room is Room bean object, which will be null if this tenant aint renting
%>


    <div class="content">
        <table class="table table-striped mx-auto" style="width: 60%;">
            <thead>
                <tr>
                    <th scope="col">Details</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>First Name:</td>
                    <td><%= curT.getFirstName() %></td>
                </tr>
                <tr>
                    <td>Last Name:</td>
                    <td><%= curT.getLastName() %></td>
                </tr>
                <tr>
                    <td>Phone:</td>
                    <td><%= curT.getPhone() %></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><%= curT.getEmail() %></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><%= curT.getPassword() %></td>
                </tr>
                <% if(room != null) { %>
                    <tr>
                        <td>Current Room:</td>
                        <td><%= room.getRoomNo() %></td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <!-- Add any additional scripts or links here -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-rnN0A7S1jsT1hu9RHlMpaZJ7fdiN/kd8fXVn4+2oIyoJ4u0FQFnJkw/ZIzhSIAfy" crossorigin="anonymous"></script>
</body>
</html>
