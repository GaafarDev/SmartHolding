<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.Date, com.project.database.*, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<style>
.pay-icon{
	max-width: 60px;
	max-height: 30px;
}

   .color-bar {
      height: 10vw; 
      background-color: #D9D9D9; 
    }

    .viewFacility {
      color:#EF4A4A;
      margin-left: 40px;
    }

    .faciIMG {
      background-color:#EF4A4A;
      height: 20vw; 
      margin-top: 40px;
    }
        .wider-button {
        width: 150px; /* Adjust the width as needed */
    }

</style>
</head>
<body>
    <jsp:include page="headerTenant.jsp" />
<%
	Tenant tenant = (Tenant)session.getAttribute("tenant");
	String tenantId = (String)request.getAttribute("tenantid");
	Room room = (Room)request.getAttribute("room");
	


	String checkin = (String)request.getAttribute("checkin");

	String checkout = (String)request.getAttribute("checkout");
%>

<hr>
<div class="container border p-4" >
	<h2>Receipt</h2>
	<br>
	<div class="row" >
	 	<div class="col-8 border text-center px-4 rounded">
	      	<%="GENERATED ON: 2020-11-30 12:50" %><br>
	      	<%="RESIDENSI UTMKL" %><br><br>
      		<!-- Inner form -->
	      	<div class="row border-bottom border-dark">
	      		<div class="col  text-start">
	      			<p class="text-start">Payment Reference</p>
	      		</div>
	      		<div class="col  text-right">
	      			<p class="text-end">        <%
            // Parse checkin and checkout date strings
            SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM");
            SimpleDateFormat outputFormat = new SimpleDateFormat("MMMM yyyy");

            Date checkinDate = inputFormat.parse(checkin);
            Date checkoutDate = inputFormat.parse(checkout);

            // Format as month name and year
            String checkinMonthYear = outputFormat.format(checkinDate);
            String checkoutMonthYear = outputFormat.format(checkoutDate);
        %>
         <p class="text-end"><%= checkinMonthYear + " - " + checkoutMonthYear %></p></p>
	      		</div>
	      	</div>
<div class="row border-bottom border-dark">
    <div class="col  text-start">
        <p class="text-start">Room Type</p>
    </div>
    <div class="col  text-right">
        <p class="text-end">
            <% 
                String roomType = room.getRoomType();
                String roomTypeText = "";

                switch (roomType) {
                    case "1":
                        roomTypeText = "2-Bedroom Apartment";
                        break;
                    case "2":
                        roomTypeText = "3-Bedroom Apartment";
                        break;
                    case "3":
                        roomTypeText = "Studio Apartment 1";
                        break;
                    case "4":
                        roomTypeText = "Studio Apartment 2";
                        break;
                    default:
                        roomTypeText = "Unknown Room Type";
                        break;
                }

                out.println(roomTypeText);
            %>
        </p>
    </div>
</div>
	      	<div class="row border-bottom border-dark">
	      		<div class="col  text-start">
	      			<p class="text-start"><%="Room Number" %></p>
	      		</div>
	      		<div class="col  text-right">
	      			<p class="text-end"><%=room.getRoomNo() %></p>
	      		</div>
	      	</div>
	      	<div class="row border-bottom border-dark">
	      		<div class="col  text-start">
	      			<p class="text-start">Payment Method</p>
	      		</div>
	      		<div class="col  text-right">
	      			<p class="text-end"><%="Credit Card" %></p>
	      		</div>
	      	</div>
	      	<div class="row border-bottom border-dark">
	      		<div class="col  text-start">
	      			<p class="text-start">Customer Info</p>
	      			<p class="text-start">Name</p>
	      			<p class="text-start">Phone</p>
	      			<p class="text-start">Email</p>
	      		</div>
	      		<div class="col  text-right">
	      			<p class="text-end">_</p>	      			
	      			<p class="text-end"><%=tenant.getFirstName()+" "+tenant.getLastName() %></p>
	      			<p class="text-end"><%=tenant.getPhone() %></p>
	      			<p class="text-end"><%=tenant.getEmail() %></p>
	      		</div>
	      	</div>
<div class="row border-bottom border-dark">
    <div class="col  text-start">
        <br>
        <p class="text-start">TOTAL</p>
    </div>
    <div class="col  text-right">
        <br>
        <p class="text-end fw-bold">
<% 
    // Assuming checkin and checkout are in "yyyy-MM" format
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM");

    // Calculate the number of months between checkin and checkout
    int monthsDifference = (checkoutDate.getYear() - checkinDate.getYear()) * 12 + checkoutDate.getMonth() - checkinDate.getMonth() + 1;

    // Ensure that the minimum number of months is 1
    monthsDifference = Math.max(monthsDifference, 1);

    // Assuming room price is stored in room.getPrice() method
    double roomPrice = room.getPrice();

    // Calculate the total cost
    double totalCost = monthsDifference * roomPrice;

    String formattedTotalCost = String.format("RM %.2f", totalCost);
    out.print(formattedTotalCost);
%>
        </p>    </div>
</div>    		<br><br><br>    </div>
	    <div class="col"><br><br><br><br><br>
				  <div class="row ">
				    <div class="col  pt-5">
				    	<div class="d-grid gap-2 col-6 mx-auto">
				    	<form action="processPayment">
                <input type="hidden" name="checkin" value="<%= checkin %>">
                <input type="hidden" name="checkout" value="<%= checkout %>">
                <input type="hidden" name="tenantId" value="<%= tenant.getTenantId() %>">
                <input type="hidden" name="roomId" value="<%= room.getRoomId() %>">
				    		<button type="submit" class="btn wider-button btn-lg btn-danger rounded-pill">Pay</button>
						</form>	</div>    </div>  </div></div>	         </div> </div>
</div>
</body>
</html>