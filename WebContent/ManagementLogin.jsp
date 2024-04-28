<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

    <style>
        .custom-container {
            max-width: 80%;
        }

        .custom-submit-wrapper {
            width: 30%;
            margin: 10px auto; /* Center the wrapper horizontally and add space at the top */
            text-align: center; /* Center text inside the wrapper */
        }

        .custom-submit-btn {
            width: 100%;
            border-radius: 20px; /* Adjust the border-radius as needed for the desired rounded corners */
        }

        .form-section {
            margin-top: 3%; /* Add space between the "Sign Up" heading and the form */
        }
    </style>
</head>
<body>
        <a href="tenantLogin">Tenant Login</a>
         <%-- Check if the 'msg' variable exists and display it in a JavaScript alert --%>
            <% if (request.getAttribute("Msg") != null) { %>
                <script>
                    alert('<%= request.getAttribute("Msg") %>');
                </script>
            <% } %>

    <h3 class="text-center mt-5">Manager Login</h3>
    <div class="container custom-container mt-3">
        <form action="auth" class="form-section" method="POST">
        

            <div class="row">
                <div class="col-md-6">
                    <div class="form-floating mb-3">
                        <input type="email" class="form-control" id="email" placeholder="name@example.com" name="email" required>
                        <label for="email">Email</label>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating mb-3">
                        <input type="password" class="form-control" id="password" placeholder="Password" name="password" required>
                        <label for="password">Password</label>
                    </div>
                </div>
            </div>

            <br>
            <div class="custom-submit-wrapper">
                <button type="submit" class="btn btn-danger btn-lg custom-submit-btn text-black">Log In</button>
            </div>
        </form>
    </div>
</body>
</html>