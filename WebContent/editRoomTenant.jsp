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


    .card-body {
      display: flex;
      justify-content: space-between; /* Align items with space between them */
    }

    .L_Info {
      width: 60%;
      height: 100%;
      padding: 1em; /* Add padding to ensure space between inputs and the edge of the card */
      box-sizing: border-box; /* Include padding in the element's total width and height */
    }

    .R_Img {
      width: 40vw;
      height: 40vw;
      display: flex;
      align-items: center; 
    }

    .R_Img img {
      margin: 2vw;
      max-width: 60%; 
      max-height: 60%;
      object-fit: cover;
      border-radius: 1vw;
      box-shadow: 0px 5px 10px rgba(0, 0, 0, 0.2);
    }

    .input-group.mb-3 {
      width: 100%;
      margin-bottom:1vw;
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
	Tenant tenant = (Tenant)request.getAttribute("tenant");
	int roomId = (int)request.getAttribute("roomId");
	int rentalId = (int)request.getAttribute("rentalId");
%>

	<%@ include file="headerAdmin.jsp" %>


<div class="container" style="margin-top:1em;">
    <br><br>
    <div class="tenentInfo">
        <h2>Edit Tenant Info : <%=tenant.getFirstName() %> <%=tenant.getLastName() %></h2>
        <div class="card">
			<div class="card-body">
			    <div class="L_Info">
	        <form action="mgmSubmitTenantEdit">
	        	<input type="hidden" value="<%=roomId %>" name="roomId" />
	        	<input type="hidden" value="<%=rentalId %>" name="rentalId" />
	        
	        	<input type="hidden" value="<%=tenant.getTenantId() %>" name="tenantId" />
			        <div class="input-group mb-3">
			            <span class="input-group-text" id="basic-addon1">First Name</span>
			            <input type="text" name="firstName" class="form-control" aria-label="Name" aria-describedby="basic-addon1" value="<%=tenant.getFirstName()%>" >
			        </div>
			        <div class="input-group mb-3">
			            <span class="input-group-text" id="basic-addon1">Last Name</span>
			            <input type="text" name="lastName"  class="form-control" aria-label="Name" aria-describedby="basic-addon1" value="<%=tenant.getLastName()%>" >
			        </div>
			        <div class="input-group mb-3">
			            <span class="input-group-text" id="basic-addon1">Phone No</span>
			            <input type="text" name="phone" class="form-control" aria-label="Name" aria-describedby="basic-addon1" value="<%=tenant.getPhone() %>" >
			        </div>
			        <div class="input-group mb-3">
			            <span class="input-group-text" id="basic-addon1">Email</span>
			            <input type="email" name="email" class="form-control" aria-label="Name" aria-describedby="basic-addon1" value="<%=tenant.getEmail() %>" >
			        </div>
			    </div>
			</div>
            </div>
	        	<button class="green-button">Update Tenant Info</button>
	        </form>
        </div>
        <br><br>
    </div>
</div>
</body>
</html>
