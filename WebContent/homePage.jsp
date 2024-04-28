<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.project.database.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<!-- for bootstrap -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">

<!-- for icons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<!-- css -->
<style type="text/css">
.custom-navbar-color {
	background-color: #e1e1e1;
}

.icon {
	font-size: 30px;
	margin: 10px;
	cursor: pointer;
}

.intro-image {
	width: 100%;
}

.button-container {
	display: flex;
	justify-content: center;
	align-items: center;
    text-decoration: none; /* Remove the underline */
    color: inherit; /* Inherit the color from the parent element */
    background: none; /* Remove the background color */
    border: none; /* Remove the border */
    cursor: pointer; /* Set cursor to pointer */
	
}
  .button-container button a {
    color: inherit; /* Inherit the color from the parent element */
    text-decoration: none; /* Remove the underline */
  }

.red-button {
	background-color: red;
	color: white;
	border: none;
	padding: 15px ;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 20px;
	cursor: pointer;
	border-radius: 12px;
}

.content {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

.last-image {
	width: 20%;
	margin-bottom: 30px;
}
</style>


</head>
<body>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        // Check if Successmsg attribute is not null
        var successMsg = "<%= request.getAttribute("Successmsg") %>";
        if (successMsg !== null && successMsg !== '' && successMsg !== 'null') {
            // Display the popup
            alert(successMsg);
        }
    });
</script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        // Check if msg attribute is not null
        var msg = "<%= request.getAttribute("msg") %>";
        if (msg !== null && msg !== '' && msg !== 'null') {
            // Display the popup
            alert(msg);
        }
    });
</script>
<script>
function confirmLogout() {
    var confirmLogout = confirm("Are you sure you want to log out?");
    if (confirmLogout) {
        window.location.href = "Logout"; // Redirect to the logout URL if confirmed
    }
}
</script>
            <% if (session.getAttribute("tenant") != null) { 
            	Tenant tenant = (Tenant) request.getAttribute("tenant");
            	
            	if(tenant != null){
            %>
                <!-- <script>
                    alert('Your Name is :<%= tenant.getFirstName() %>, ID :<%= tenant.getTenantId() %> ');
                </script>-->
            <% }} %>
            
      
    <jsp:include page="headerTenant.jsp" />
	<img src="https://www.residensiutmkl.com/wp-content/uploads/2022/01/Gurney-Mall-@-Kuala-Lumpur-01.jpg" alt="Description of image"
		class="intro-image">

<div class="button-container">
  <button class="red-button">
    <a href="DisplayHotels"><i class="fas fa-bed" style="font-size: 40px;"></i> <br>View Hotel</a>
  </button>
  <button class="red-button">
    <a href="DisplayFacilities"><i class="fas fa-building" style="font-size: 40px;"></i> <br>View Facilities</a>
  </button>
  <button class="red-button">
    <a href="DisplayBooking"><i class="fas fa-book" style="font-size: 40px;"></i> <br>View Rental History</a>
  </button>
</div>
	<br>
	<div class="content">
		<p style="color: red;">Experience Kuala Lumpur's Iconic Hotel at
			Residensi UTMKL</p>
		<p>UTM HOTEL & RESIDENCE</p>
		<img src="https://www.residensiutmkl.com/wp-content/uploads/2021/12/logo_utmhr-286x300.png" alt="Description of the image"
			class="last-image">
	</div>
	<!-- for bootstrap -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>

