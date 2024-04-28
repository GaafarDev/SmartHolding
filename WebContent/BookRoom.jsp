<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.project.database.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>BookRoom</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Include jQuery library -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<!-- Include jQuery UI library -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  <style>
    /* Style the header */

    .header {
      background-color: #D9D9D9;
      padding: 0.1%;
      box-shadow: 2px 2px 5px gray;
      border-radius: 10px;
      display: flex;
      justify-content: space-between;
    }

    .div-right {
      padding: 0.5%;
      text-align: right;
    }

    .Accommodation {
      background-color: red;
      color: white;
      padding: 20px 25px;
      font-size: 28px;
      cursor: pointer;
      border-radius: 25px;
      border: 1px solid red;
    }

    .logo {
      padding: 1%;
      align-items: center;
      justify-content: center;
      font-family: Arial, sans-serif;
    }

    .logo-text {
      color: red;
      font-size: 36px;
      font-weight: bold;
      text-transform: uppercase;
    }

    .logo-subtext {
      color: black;
      font-size: 18px;
      font-weight: normal;
      text-transform: uppercase;
    }

    /* Style the form */
    .form-container {
      background-color: #fff;
      border-radius: 10px;
      width: 90%;
      height: 80%;
      border-radius: 7%;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.15);
      padding: 50px;
      margin-top: 15px;
      margin: 20px;
      font-family: Arial, Helvetica, sans-serif;
    }

    .form {
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      grid-template-rows: auto;
    }

    .form label {
      display: block;
      margin: 10px;
    }

    .form input,
    .form button {
      width: 80%;
      height: 40px;
      align-self: center;
      justify-self: center;
    }

    .form input {
      display: block;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }

    .form button {
      display: block;
      padding: 10px;
      margin: 10px;
      border: none;
      border-radius: 5px;
      background-color: #1abc9c;
      color: white;
      cursor: pointer;
    }

    .rooms-available {
      display: flex;
      justify-content: center;
      align-items: center;
    }

    #rooms {
      grid-column: 1 / 4;
      grid-row: 1 / 2;
    }

    .section1,
    .section2,
    .section3 {
      padding: 10px;
      margin: 10px;
    }

    .section1 {
      grid-column: 1 / 4;
      grid-row: 1 / 2;
    }

    .section2 {
      grid-column: 1 / 2;
      grid-row: 2 / 4;
    }

    .section3 {
      border-left: 2px solid #ccc;
      grid-column: 2 / 4;
      grid-row: 2 / 4;
    }
  </style><script>
    document.addEventListener('DOMContentLoaded', function () {
        const roomButtons = document.querySelectorAll('.room-button');
        const submitBtn = document.getElementById('submitBtn');
        const roomNoInput = document.getElementById('roomNo');
        const checkinMonthInput = document.getElementById('checkinMonth');
        const checkoutMonthInput = document.getElementById('checkoutMonth');
        const checkinInput = document.getElementById('checkin');
        const checkoutInput = document.getElementById('checkout');

        const roomNumbers = {
            roomNo1: '<%= (int)request.getAttribute("roomNo1") %>',
            roomNo2: '<%= (int)request.getAttribute("roomNo2") %>',
            roomNo3: '<%= (int)request.getAttribute("roomNo3") %>',
            roomNo4: '<%= (int)request.getAttribute("roomNo4") %>'
        };

        roomButtons.forEach(function (button) {
            button.addEventListener('click', function () {
                roomButtons.forEach(function (btn) {
                    btn.classList.remove('selected');
                });

                button.classList.add('selected');
                roomNoInput.value = roomNumbers['roomNo' + button.textContent.replace('Tower ', '')];
                submitBtn.removeAttribute('disabled');
                submitBtn.style.backgroundColor = '#1abc9c';
            });
        });

        submitBtn.addEventListener('click', function (e) {
            if (!document.querySelector('.room-button.selected')) {
                e.preventDefault();
                alert('Please select a tower.');
            }
        });
        function updateHiddenInputs() {
            const checkinMonthValue = checkinMonthInput.value;
            const checkoutMonthValue = checkoutMonthInput.value;

            if (checkinMonthValue) {
                // Construct the first day of the month
                const firstDay = new Date(checkinMonthValue + "-01");
                checkinInput.value = firstDay.toISOString().split('T')[0];
            } else {
                checkinInput.value = '';
            }

            if (checkoutMonthValue) {
                // Construct the last day of the month
                const lastDay = new Date(checkoutMonthValue + "-01");
                lastDay.setMonth(lastDay.getMonth() + 1);
                lastDay.setDate(lastDay.getDate() - 1);
                checkoutInput.value = lastDay.toISOString().split('T')[0];
            } else {
                checkoutInput.value = '';
            }
        }

        // Event listeners for input changes
        checkinMonthInput.addEventListener('input', updateHiddenInputs);
        checkoutMonthInput.addEventListener('input', updateHiddenInputs);

        // Trigger initial update
        updateHiddenInputs();

        if (submitBtn.hasAttribute('disabled')) {
            submitBtn.style.backgroundColor = 'gray';
        }
    });
</script>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const roomButtons = document.querySelectorAll('.room-button');
        const submitBtn = document.getElementById('submitBtn');
        const roomNoInput = document.getElementById('roomNo');
        const checkinMonthInput = document.getElementById('checkinMonth');
        const checkoutMonthInput = document.getElementById('checkoutMonth');
        const checkinInput = document.getElementById('checkin');
        const checkoutInput = document.getElementById('checkout');

        const roomNumbers = {
            roomNo1: '<%= (int)request.getAttribute("roomNo1") %>',
            roomNo2: '<%= (int)request.getAttribute("roomNo2") %>',
            roomNo3: '<%= (int)request.getAttribute("roomNo3") %>',
            roomNo4: '<%= (int)request.getAttribute("roomNo4") %>'
        };

        roomButtons.forEach(function (button) {
            button.addEventListener('click', function () {
                if (!button.hasAttribute('disabled')) {
                    roomButtons.forEach(function (btn) {
                        if (!btn.hasAttribute('disabled')) {
                            btn.style.backgroundColor = '#1abc9c';
                        }
                    });

                    button.style.backgroundColor = 'red';
                    roomNoInput.value = roomNumbers['roomNo' + button.textContent.replace('Tower ', '')];
                    submitBtn.removeAttribute('disabled');
                    submitBtn.style.backgroundColor = '#1abc9c';
                }
            });

            if (button.hasAttribute('disabled')) {
                button.style.backgroundColor = 'gray';
            }
        });

        function updateHiddenInputs() {
            const checkinMonthValue = checkinMonthInput.value;
            const checkoutMonthValue = checkoutMonthInput.value;

            if (checkinMonthValue) {
                const firstDay = new Date(checkinMonthValue + "-01");
                checkinInput.value = firstDay.toISOString().split('T')[0];
            } else {
                checkinInput.value = '';
            }

            if (checkoutMonthValue) {
                const lastDay = new Date(checkoutMonthValue + "-01");
                lastDay.setMonth(lastDay.getMonth() + 1);
                lastDay.setDate(lastDay.getDate() - 1);
                checkoutInput.value = lastDay.toISOString().split('T')[0];
            } else {
                checkoutInput.value = '';
            }

            validateDates();
        }

        function validateDates() {
            const checkinDate = new Date(checkinInput.value);
            const checkoutDate = new Date(checkoutInput.value);

            if (checkoutDate <= checkinDate) {
                submitBtn.setAttribute('disabled', 'disabled');
                submitBtn.style.backgroundColor = 'gray';
                alert('Checkout date must be after checkin date.');
            } else {
                submitBtn.removeAttribute('disabled');
                submitBtn.style.backgroundColor = '#1abc9c';
            }
        }

        checkinMonthInput.addEventListener('input', updateHiddenInputs);
        checkoutMonthInput.addEventListener('input', updateHiddenInputs);

        updateHiddenInputs();

        if (submitBtn.hasAttribute('disabled')) {
            submitBtn.style.backgroundColor = 'gray';
        }
    });
</script>

</head>

<body>
    <jsp:include page="headerTenant.jsp" />
  <div class="form-container">
    <h2>Book a Room</h2>
    <p>Please fill in the form below to book a room.</p>
    <form class="form" action="DisplayPayment" method="post">
      <% int t1 = (int)request.getAttribute("t1");
       int t2 = (int)request.getAttribute("t2");
       int t3 = (int)request.getAttribute("t3");
       int t4 = (int)request.getAttribute("t4");
      %>
      <%  Tenant tenant = (Tenant)session.getAttribute("tenant"); %>
      <div class="section1">
        <label for="rooms">Select Tower</label>
        <div class="rooms-available">
          <button class="room-button" <%=(t1 == 0 ? "disabled" : "") %>>Tower 1</button>
          <button class="room-button" <%=(t2 == 0 ? "disabled" : "") %>>Tower 2</button>
          <button class="room-button" <%=(t3 == 0 ? "disabled" : "") %>>Tower 3</button>
          <button class="room-button" <%=(t4 == 0 ? "disabled" : "") %>>Tower 4</button>
        </div>
      </div>
      <!-- Second section -->
      <div class="section2">
        <div>
          <input type="hidden" id="tenantid" name="tenantid" value="<%=tenant.getTenantId() %>" readonly>
        </div>
        <div>
          <input type="hidden" id="roomNo" name="roomNo" value="" readonly>
        </div>
        <div>
          <label for="fname">First Name:</label>
          <input type="text" id="fname" name="fname" value="<%=tenant.getFirstName() %>" readonly>
        </div>
        <div>
          <label for="lname">Last Name:</label>
          <input type="text" id="lname" name="lname" value="<%=tenant.getLastName() %>" readonly>
        </div>
        <div>
          <label for="phone">Phone Number:</label>
          <input type="tel" id="phone" name="phone" value="<%=tenant.getPhone() %>" readonly>
        </div>
        <div>
          <label for="email">Email:</label>
          <input type="email" id="email" name="email" value="<%=tenant.getEmail() %>" readonly>
        </div>
      </div>
<div class="section3">
    <div>
        <label for="checkinMonth">Check in Month:</label>
        <input type="month" id="checkinMonth" name="checkinMonth" required>
        <input type="hidden" id="checkin" name="checkin" value="">
    </div>    <div>
        <label for="checkoutMonth">Check out Month:</label>
        <input type="month" id="checkoutMonth" name="checkoutMonth" required>
        <input type="hidden" id="checkout" name="checkout" value="">
    </div>    <div>
        <button id="submitBtn" type="submit" disabled>Proceed to Payment</button>
    </div></div>
</body>
</html>