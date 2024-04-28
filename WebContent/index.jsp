<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">


<title>Insert title here</title>
</head>
<body>
	<h1>Click here</h1>
	
									<a href="TenantSignup.jsp">Tenant Signup</a> <br> <a
										href="TenantLogin.jsp">Tenant Login</a> <br> <a
										href="ManagementLogin.jsp">Manager Login</a>
	<h1>
		Hotel Module
		<h1>

			<form action="DisplayHotels">
				<input type="submit" value="Display Hotels" />
			</form>

			<form action="DisplayFacilities">
				<input type="submit" value="Display Facilities" />
			</form>

			<form action="DisplayRoomAvailability">
				<input type="submit" value="Display Room Availability" />
			</form>
			<br> <br>


			<h1>
				Booking Module
				<h1>
					<form action="DisplayBookingForm">
						<input type="submit" value="Display Booking Form" />
					</form>
					<br> <br>

					<h1>
						Tenant Module
						<h1>
							<form action="DisplayTenantInfo">
								<input type="submit" value="Display Tenant Info" />
							</form>
							<form action="DisplayEditTenant">
								<input type="submit" value="Edit Tenant Info" />
							</form>


							<h1>
								Payment Module
								<h1>
									<form action="DisplayPayment">
										<input type="submit" value="Display Payment" />
									</form>
									<form action="DisplayReceipt">
										<input type="submit" value="Display Receipt" />
									</form>

									<form action="homePage.jsp">
										<input type="submit" value="Go to Home Page" />
									</form>

									<form action="checkTenantInfo.jsp">
										<input type="submit" value="Go view check tenant info" />
									</form>
									<a href="payment.jsp">Goto Payment</a><br> <a
										href="registerTenant.jsp">Goto Register Tenant</a> <br> <a
										href="viewHotel.jsp">Goto View Hotel</a> <br> <a
										href="facility.jsp">Goto Facility</a> <br> <a
										href="viewRoomAvailability.jsp">View Room Availability 1</a><br>
									<a href="viewRoomAvailability2.jsp">room availability 2</a> <br>
									<a href="viewRoomAvailability3.jsp">room availability 3</a><br>
									<form action="viewRoomAvailability4.jsp">
										<input type="submit" value="Go view room availability 4" />
									</form>
									<br> <a href="BookRoom.jsp">Book Room</a> <br> <a
										href="HomePageAdmin.jsp">Home Page Admin</a>
									<br><a href="adminHeader">View ADmin header</a>
									<br><a href="tenantHeader">View Tenant header</a>
</body>
</html>