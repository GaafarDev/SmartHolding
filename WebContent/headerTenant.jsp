<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
    <title>Website Header</title>
    <!-- Add other head elements as needed -->
</head>

<body style="margin: 0;">

    <!-- Separate div for the header -->
    <div style="background-color: #ddd; color: #dc3545; height: 10vh; display: flex; justify-content: space-between; align-items: center; padding: 0 10px; margin: 0;">
<div>
    <a href="tenantHomePage" style="text-decoration: none; color: inherit;">
        <span style="font-size: 24px; font-weight: bold; text-transform: uppercase;">RESIDENSI UTMKL</span>
    </a>
</div>
        <div style="display: flex; align-items: center; margin-right: 10px;">
            <div style="text-align: center; margin-right: 10px;">
                <span style="margin-bottom: 5px; display: block;">TENANT</span>
            </div>
            <a href="tenantProfile"><button style="background-color: silver; border: none; border-radius: 10px; padding: 8px 16px; font-size: 16px; cursor: pointer;">Profile</button></a>
              <a href="tenantLogout"><button style="background-color: silver; border: none; border-radius: 10px; padding: 8px 16px; font-size: 16px; cursor: pointer;">Logout</button></a>
        </div>
    </div>

    <!-- Rest of the body content goes here -->

</body>

</html>











