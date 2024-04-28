<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Hotel</title>
    <style>
        body {
            margin: 0;
            font-family: 'Roboto', sans-serif;
        }

        .navbar {
            background-color: #D9D9D9;
            padding: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 0;
            box-shadow: 0px 5px 5px rgba(0, 0, 0, 0.1);
        }

        .navbar-brand {
            color: #CB0808;
            font-size: 25px;
            margin-bottom: 0;
            font-weight: bold;
        }

        .small-text {
            font-size: 15px;
            color: black;
        }

        .btn-danger {
            background-color: #EF4A4A;
            color: white;
            border: none;
            border-radius: 15px;
            padding: 15px 30px;
            font-size: 18px;
        }

        .image-scroll-container {
            display: flex;
            overflow: hidden;
            height: 357px;
            margin-top: 20px;
        }

        .image-scroll-container img {
            height: 100%;
            margin: 0;
        }

        .image-scroll-container img:nth-child(1),
        .image-scroll-container img:nth-child(3) {
            width: calc(50% - 5px);
        }

        .image-scroll-container img:nth-child(2) {
            width: calc(1.5 * (50% - 5px));
        }

        #bottom-bar-container {
            background-color: #D9D9D9;
            box-shadow: 0px 5px 5px rgba(0, 0, 0, 0.1), 0px -5px 5px rgba(0, 0, 0, 0.1);
            height: 70px;
            margin-top: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 10px;
        }

        #bottom-bar-text {
            color: black;
            font-size: 25px;
            font-weight: bold;
        }

        .pics-container {
            background-color: #D9D9D9;
            border-radius: 20px;
            width: 950px;
            height: 300px;
            margin: 20px auto 0;
            box-shadow: 0px 10px 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            display: flex;
        }

        .pics-container img {
            width: 33.33%;
            height: 300px;
        }

        .pics-container img:not(:last-child) {
            margin-right: 10px;
        }

        .text-container {
            background-color: #D9D9D9;
            border-radius: 0 0 20px 20px;
            width: 400px;
            height: fit-content;
            margin: 0 auto 80px;
            box-shadow: 0px 10px 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }

        .text-container h2 {
            margin-bottom: 10px;
        }

        .price-container {
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            align-items: center;
        }

        .price-label {
            margin-bottom: 10px;
            margin-left: 5px;
            font-weight: bold;
        }

        .green-rectangle {
            background-color: #00FF0A;
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            border-radius: 10px;
            padding: 10px;
            color: #FFFFFF;
            margin-top: 10px;
            margin-right: 20px;
        }

        .book-rectangle {
            background-color: #00FF0A;
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            border-radius: 10px;
            padding: 10px;
            color: #FFFFFF;
            margin-top: 10px;
            margin-left: 200px;
        }

        .white-container {
            background-color: white;
            box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.1);
            width: 1000px;
            height: 400px;
            margin: 20px auto;
            padding: 20px;
            border-radius: 10px;
        }

        .white-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <jsp:include page="headerTenant.jsp" />
<div class="image-scroll-container">
    <img src="https://lh5.googleusercontent.com/proxy/VPZGVjWA0JD0rhsLsaLg1Uvw1I-TTvbagoEG9YIIjiKFGDVVtOV8hj9VchoIyfMwMGGH5SwpZaqSXloytPcqdAGOJ_9rWf4VpDYShjtZ4tpCkZ_RvmPsMDv8zTZkwFTUMkkzjP1CvAm0LRYBBDVjFb2JwNnKlA=w360-h240-n-k-no" alt="Image 1">
    <img src="https://lh5.googleusercontent.com/proxy/GzHu-bzQLYj194Cb3VSELfldXuOPnYyS4KNwGeJIhu8CMRoRQQDZylwQUHBg5csAfEGafubrF2hpgTa-pRHHdbDK1V_QKUPp54UKylOsdm2I8GzkGpYQjCPp3bnWEGQvJfnbMmIJh9Fu7nemjPYjayFhkA6qmw=w360-h240-n-k-no" alt="Image 2">
    <img src="https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSzzOKV9xR9y_Qsz-_0cACLTWK1f4KhWSdI5-CWtNsgiDf8CTIa" alt="Image 3">
</div>
<div id="bottom-bar-container">  <span id="bottom-bar-text">RESIDENSI UTMKL - LONG STAY</span></div>
<div class="pics-container">
    <img src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQtnvles9MoUuE1gm7W9oY2m3NOK1lIifrMMx2C79NPC4finsdB" alt="Image 4">
    <img src="https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTg7kGjqL51ZLHmfxaK2edL-0zbnA3MZvIGgdvdPTgdUQV7S0i9" alt="Image 5">
    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTld6HAyM3udx1MZdkImUOX2sSmmf_V43dNAIHaSLsBPLPFh8C-" alt="Image 6">
</div>
<div class="text-container">
    <h2>Tower 1 Two-Bedroom Apartment</h2>
    <div class="price-container">
        <p class="price-label">Price:</p>
        <div class="green-rectangle">RM1800</div>
        <a href="DisplayBookingForm" style="text-decoration: none; color: inherit;">
            <div class="book-rectangle">Book</div>
        </a>    </div></div>
<div class="pics-container">
    <img src="https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTAMkE7FusiI596-rq8roviXa_cwnHdS4PzL6zHQqIJYsugeJZQ" alt="Image 4">
    <img src="https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcT6346xt_hm_LimL0e0hZAy3Y5NpKEUw472srNFaAGLEzwUwahE" alt="Image 5">
    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-8K7On_T1QcI7IlpekSCJbu6X10li7s60ooS8P1VXJtxER3kc" alt="Image 6">
</div>
<div class="text-container">
    <h2>Tower 2: Three-Bedroom Apartment</h2>
    <div class="price-container">
        <p class="price-label">Price:</p>
        <div class="green-rectangle">RM2000</div>
        <a href="DisplayBookingForm" style="text-decoration: none; color: inherit;">
            <div class="book-rectangle">Book</div>
        </a>    </div></div>
<div class="pics-container">
    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZfPK2YUAiVn1lnh1zuvvFZNrlZIWidqt5_XG_nfrF1AT2-mGO" alt="Image 4">
    <img src="https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTVA58ImSlrL5b1TZFemcuApFC-9Aeoiv9EZBm2iwV_CnKoO39n" alt="Image 5">
    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQyqVV0RBCxKXsLaae4Ek3pHkgUKZvpLT0ZlNatS7ROghkJWz1k" alt="Image 6">
</div>
<div class="text-container">
    <h2>Tower 3: Studio Apartment</h2>
    <div class="price-container">
        <p class="price-label">Price:</p>
        <div class="green-rectangle">RM1000</div>
        <a href="DisplayBookingForm" style="text-decoration: none; color: inherit;">
            <div class="book-rectangle">Book</div>
        </a>    </div></div>
<div class="pics-container">
    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZfPK2YUAiVn1lnh1zuvvFZNrlZIWidqt5_XG_nfrF1AT2-mGO" alt="Image 4">
    <img src="https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTVA58ImSlrL5b1TZFemcuApFC-9Aeoiv9EZBm2iwV_CnKoO39n" alt="Image 5">
    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQyqVV0RBCxKXsLaae4Ek3pHkgUKZvpLT0ZlNatS7ROghkJWz1k" alt="Image 6">
</div>

<div class="text-container">
    <h2>Tower 4: Studio Apartment</h2>
    <div class="price-container">
        <p class="price-label">Price:</p>
        <div class="green-rectangle">RM1100</div>
        <a href="DisplayBookingForm" style="text-decoration: none; color: inherit;">
            <div class="book-rectangle">Book</div>
        </a>    </div></div>

<div class="white-container">
    <!-- Add the new image with comments -->
    <img src="https://www.residensiutmkl.com/wp-content/uploads/2020/01/d7c67780926fe09ffc34ebfcbb691806.jpg" alt="Image 13">
</div>
</body>
</html>

<!--Here is Loai-->
