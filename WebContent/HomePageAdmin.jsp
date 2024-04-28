<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>

<head>
    <title>HomePageAdmin</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        * {
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
        }

        /*card*/
        .card-container {
            display: flex;
            justify-content: center;
            align-items: center;
        }



        .card {
            display: inline-block;
            margin: 20px;
            align-items: center;
            justify-content: center;
            width: 220px;
            height: 162px;
            flex-shrink: 0;
            background-color: #f2f2f2;
            border-radius: 10px;
            background: #EF4A4A;
            box-shadow: 0px 4px 4px 0px rgba(0, 0, 0, 0.25);
            text-align: center;
        }


        /*footer*/
        .footer-container {
            width: 80%;
            margin: 0 auto;
            text-align: center;
            color: #CB0808;
            font-family: Roboto;
            font-size: 10px;
            font-style: normal;
            font-weight: 400;
            line-height: normal;
        }

        .sub-footer {
            color: #000;
            font-family: Roboto;
            font-size: 24px;
            font-style: normal;
            font-weight: 400;
            line-height: normal;

        }

        body {
            margin: 0;
            font-family: sans-serif;
            color: #1e1e1e;
            background: white;
            height: 100%;
        }

        .header {
            position: fixed;
            width: 100%;
            height: 80px;
            z-index: 10;
            background-color: rgba(217, 217, 217, 0.80);
            padding-bottom: 5%;
            justify-content: space-between;
        }

        .logo {
            float: left;
            margin-left: 20px;
            padding: 1%;
            align-items: center;
            justify-content: center;
            font-family: Arial, sans-serif;
        }

        .logo-text {
            font-size: 24px;
            font-weight: bold;

            color: red;
            font-size: 36px;
            font-weight: bold;
            text-transform: uppercase;
        }

        .logo-subtext {
            font-size: 14px;
            color: gray;

            color: black;
            font-size: 18px;
            font-weight: normal;
            text-transform: uppercase;
        }

        .options {
            float: right;
            margin-right: 20px;
            align-items: center;
        }

        .options a {
            display: inline-block;
            padding: 10px 15px;
            margin-top: 15px;
            margin-left: 10px;
            border: 2px solid black;
            border-radius: 10px;
            text-decoration: none;
            color: #000;
            font-family: Roboto;
            font-size: 20px;
            font-style: bold;
            font-weight: 400;
            line-height: bold;
        }

        .options img {
            vertical-align: middle;
            /* add this line */
        }

        .banner-wrapper-fixed {

            width: 100%;
            height: 600px;
            background-image: url("Images/residensi1.png");
            background-position: center;
            background-size: cover;
        }

        .foreground {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.4);

        }
        /* New class for bolded white text */
        .card-title-text {
            font-weight: bold;
            color: white;
            text-decoration: none; /* Remove default link underline */
        }

        /* Fix image size and centering */
        .card img {
            width: 40%;
            height: 40%;
            object-fit: cover;
            margin: auto; /* Center the image */
            display: block; /* Remove any default spacing */
        }
    </style>
</head>

<body>

    <jsp:include page="headerAdmin.jsp" />

    <div class="card-container">

        <div class="card">
            <a href="mgmViewRoom" style="text-decoration: none;">
                <i class="fa fa-bed" style="font-size:120px;color:white"></i><br>
                <span class="card-title card-title-text">CHECK ROOM AVAILABILITY</span>
            </a>
        </div>
        <div class="card">
            <a href="mgmViewTenant" style="text-decoration: none;">
                <i class="fa fa-search" style="font-size:120px;color:white"></i><br>
                <span class="card-title card-title-text">CHECK TENANT INFO</span>
            </a>
        </div>

        <!-- ... (Your existing cards) ... -->

    </div>
    <div class="footer-container">
        <h1>Experience Kuala Lumpur's Iconic Hotel at Residensi UTMKL</h1>
        <div class="sub-footer">
            <span> UTM HOTEL & RESIDENCE </span>
            <br>
            <img src="https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRlwnfggEP2n-f6vLZKxawhqk-XQRFRDGaK31KWOnO3iL92AZKu" alt="Bed icon">
        </div>
    </div>

</body>

</html>