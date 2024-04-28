<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.List, com.project.database.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tenant Rentals</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- Add any additional styles or links here -->
</head>
<body>

    <jsp:include page="headerTenant.jsp" />

    <div class="content">
        <h2 class="text-center">Rental History</h2> <!-- Add the "text-center" class for center alignment -->
        <table class="table table-striped mx-auto" style="width: 60%;">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Rental Date Start</th>
                    <th scope="col">Rental Date End</th>
                    <th scope="col">Room Number</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Rental> rlist = (List<Rental>)request.getAttribute("rentalList");
                    List<Room> rolist = (List<Room>)request.getAttribute("roomlist");
                    for (int i = 0; i < rlist.size(); i++) {
                        Rental rental = rlist.get(i);
                %>
                        <tr>
                            <th scope="row"><%= i + 1 %></th>
                            <td><%= rental.getRentalDate() %></td>
                            <td><%= rental.getRentalDateEnd() %></td>
                            <td><%= rolist.get(i).getRoomNo() %></td>
                        </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>

    <!-- Add any additional scripts or links here -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-rnN0A7S1jsT1hu9RHlMpaZJ7fdiN/kd8fXVn4+2oIyoJ4u0FQFnJkw/ZIzhSIAfy" crossorigin="anonymous"></script>
</body>
</html>
