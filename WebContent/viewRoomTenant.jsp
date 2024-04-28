<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.util.List, com.project.database.*"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>Jie Kai Part</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-rnN0A7S1jsT1hu9RHlMpaZJ7fdiN/kd8fXVn4+2oIyoJ4u0FQFnJkw/ZIzhSIAfy" crossorigin="anonymous">
  </script>
<style>
  html, body {
    height: 100%;
    margin: 0;
  }

  .container {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    margin-top: 5vw;
  }

  .availability b {
    background-color: #dc3545;
    color: white;
    padding: 1.5vw 10vw;
    font-size: large;
    border-radius: 1vw;
    box-shadow: 0px 5px 10px rgba(0, 0, 0, 0.2);
  }

  .availability p {
    margin-top: 3vw;
    font-size: smaller;
    text-align: center;
  }

  .tenentInfo {
    text-align: center;
  }

  .card {
    width: 90vw;
    max-width: 80rem;
    border-radius: 1vw;
    box-shadow: 0px 5px 10px rgba(0, 0, 0, 0.2);
    margin: 3vh 0;
    height: auto; /* Set the height to auto */
  }

  .form-container {
    width: 90%; /* Adjust the width as needed */
  }

  .card-body {
    display: flex;
    justify-content: center; /* Align items with space between them */
  }

  .L_Info {
    width: 90%; /* Adjust the width as needed */
    height: 100%;
    padding: 1em; /* Add padding to ensure space between inputs and the edge of the card */
    box-sizing: border-box; /* Include padding in the element's total width and height */
  }

  .input-group.mb-3 {
    width: 100%;
    margin-bottom: 1vw;
  }

  .input-group.mb-3 .input-group-text {
    font-size: large;
  }

  .input-group.mb-3 .form-control {
    font-size: larger;
  }

  .green-button {
    background-color: green;
    color: white;
    border: none;
    padding: 15px 100px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 10px;
    border-radius: 12px;
  }

  .red-button {
    background-color: red;
    color: white;
    border: none;
    padding: 15px 100px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 10px;
    border-radius: 12px;
  }

  .content {
    display: flex;
    justify-content: center;
    height: 50vh;
    align-items: center;
  }
</style>

</head>
<body>
<%
	List<Rental> rentlist = (List<Rental>) request.getAttribute("rentallist");

	Tenant tenant = new Tenant();
	
	if(!rentlist.isEmpty()){
		//means got tenant 
		tenant = (Tenant)request.getAttribute("tenant");
		
	}
	Room room =(Room) request.getAttribute("room");
	
%>

	<%@ include file="headerAdmin.jsp" %>

<div class="container">
	<h2>Room : <%=room.getRoomNo() %> (Tower <%=room.getRoomType() %>)</h2>
    <div class="availability">
    	<% if(!rentlist.isEmpty()){ //means got tenant%>
			<button class="red-button">Currently Being Rented</button>	        
	     <%}else{ %>
	        <button class="green-button">Available For Rent</button>
	     <%} %>
    </div>	

</div>

<div class="container" style="margin-top:1em;">
    <br><br>
	<% if(!rentlist.isEmpty()){ //means got tenant%>
    <div class="tenentInfo">
        <h2>Current Tenant Info</h2>
        <div class="card">
			<div class="card-body">
			    <div class="L_Info">
			        <div class="input-group mb-3">
			            <span class="input-group-text" id="basic-addon1">Tenant Name</span>
			            <input type="text" class="form-control" aria-label="Name" aria-describedby="basic-addon1" value="<%=tenant.getFirstName() +' '+ tenant.getLastName()%>" readonly>
			        </div>
			        <div class="input-group mb-3">
			            <span class="input-group-text" id="basic-addon1">Phone No</span>
			            <input type="text" class="form-control" aria-label="Name" aria-describedby="basic-addon1" value="<%=tenant.getPhone() %>" readonly>
			        </div>
			
			        <div class="input-group mb-3">
			            <span class="input-group-text" id="basic-addon1">Email</span>
			            <input type="email" class="form-control" aria-label="Name" aria-describedby="basic-addon1" value="<%=tenant.getEmail() %>" readonly>
			        </div>
			        <hr>
			        <div class="input-group mb-3">
			            <span class="input-group-text" id="basic-addon1">Rental Start Date</span>
			            <input type="date" class="form-control" aria-label="Name" aria-describedby="basic-addon1" value="<%=rentlist.get(0).getRentalDate() %>" readonly>
			        </div>
			        <div class="input-group mb-3">
			            <span class="input-group-text" id="basic-addon1">Rental End Date</span>
			            <input type="date" class="form-control" aria-label="Name" aria-describedby="basic-addon1" value="<%=rentlist.get(0).getRentalDateEnd() %>" readonly>
			        </div>
			    </div>
			</div>

               <!--  <div class="R_Img">
                    <img src="https://th.bing.com/th/id/OIP.AmjFC9hr-A_SCFCS4mTMpQHaEK?w=282&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7" style = "width:30vw; object-fit: cover;">
                </div>-->
            </div>
	        <form action="mgmViewEditTenantPage">
	        	<input type="hidden" value="<%=tenant.getTenantId() %>" name="tenantId" />
	        	<input type="hidden" value="<%=room.getRoomId() %>" name="roomId" />
	        	<input type="hidden" value="<%=rentlist.get(0).getRentalId() %>" name="rentalId" />
	        	<button class="green-button">Edit Tenant Info</button>
	        </form>
	        <form action="mgmDeleteTenantRental">
	        	<input type="hidden" value="<%=tenant.getTenantId() %>" name="tenantId" />
	        	<input type="hidden" value="<%=room.getRoomId() %>" name="roomId" />
	        	<input type="hidden" value="<%=rentlist.get(0).getRentalId() %>" name="rentalId" />
	        	<button class="red-button">Remove Tenant's Rental</button>
	        </form>
            

        </div>
        <br><br>
    </div>
	<%} else{ %>
        <h2>No Current Tenant</h2>
	<%} %>
</div>
</body>
</html>
