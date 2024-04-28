<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.project.database.*, java.util.List"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>BookRoom</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
  <style>
    /* Style the header */
    .header {
        background-color: #D9D9D9;
        padding: 1%;
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
        display: flex;
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

    .card-container {
        display: flex;
        justify-content: center;
        align-items: center;
        flex-wrap: wrap; /* Allow cards to wrap to the next line */
    }

    /* Updated styling for Tower cards */
    .card {
        margin: 20px;
        width: 220px;
        height: 162px;
        background-color: #78BDFC;
        border-radius: 10px;
        box-shadow: 0px 4px 4px 0px rgba(0, 0, 0, 0.25);
        text-align: center;
        padding: 20px;
        cursor: pointer;
        transition: background-color 0.3s ease;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
    }

    /* Updated styling for selected Tower card */
    .card.selected {
        background-color: red;
    }

    /* Updated styling for Room cards */
    .small-card {
        margin: 20px;
        width: 96.523px;
        height: 74.447px;
        background-color: #78BDFC;
        border-radius: 10px;
        box-shadow: 0px 4px 4px 0px rgba(0, 0, 0, 0.25);
        text-align: center;
        padding: 10px;
        cursor: pointer;
        transition: background-color 0.3s ease;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
    }

    /* Updated styling for selected Room card */
    .small-card.selected {
        background-color: red;
    }

    /* Updated styling for Room buttons */
    .card-button {
        background-color: #78BDFC;
        border: none;
        padding: 10px;
        cursor: pointer;
        border-radius: 10px;
        box-shadow: 0px 4px 4px 0px rgba(0, 0, 0, 0.25);
        transition: background-color 0.3s ease;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
    }

    /* Updated styling for selected Room button */
    .card-button.selected {
        background-color: red;
    }

    /* Centerize and arrange room buttons horizontally */
    .small-card-container {
        display: flex;
        justify-content: center;
        align-items: center;
        flex-wrap: wrap; /* Allow small cards to wrap to the next line */
    }
</style>

</head>

<body>
    <jsp:include page="headerAdmin.jsp" />
    <%
        List<Room> roomlist = (List<Room>)request.getAttribute("roomlist");
        List<Rental> rentallist = (List<Rental>)request.getAttribute("rentallist");
    %>
<script>
    // Initial load with Tower 1 selected
    window.onload = function() {
        loadRooms('1', document.querySelector('.card'));
    }

    function loadRooms(selectedTower, clickedCard) {
        var roomContainer = document.getElementById("roomContainer");
        roomContainer.innerHTML = ''; // Clear existing room cards

        // Loop through roomlist and add cards for rooms with the selected tower
        <% for (Room room : roomlist) { %>
            if ("<%= room.getRoomType() %>" === selectedTower) {
                var roomCard = document.createElement("div");
                roomCard.className = "small-card";
                roomCard.innerHTML = '<form action="viewRoomInfo" method="get">' +
                    '<input type="hidden" name="roomId" value="<%= room.getRoomId() %>">' +
                    '<button type="submit" class="card-button">' +
                    '<span class="card-title"><%= room.getRoomNo() %></span>' +
                    '</button>' +
                    '</form>';
                roomContainer.appendChild(roomCard);
            }
        <% } %>

        // Reset background color for all cards
        var cards = document.querySelectorAll('.card');
        cards.forEach(function (card) {
            card.style.backgroundColor = '';
        });

        // Set background color for the clicked card
        clickedCard.style.backgroundColor = 'red';
    }
</script>
    <div class="card-container">
        <% for (int i = 1; i <= 4; i++) { %>
            <div class="card" onclick="loadRooms('<%= i %>', this)" style="<%= i == 1 ? "background-color: red;" : "" %>">
                <span>Tower <%= i %></span>
            </div>
        <% } %>
    </div>

    <div class="small-card-container" id="roomContainer">
        <% for (Room room : roomlist) { %>
            <form action="viewRoomInfo" method="get" style="margin: 0;">
                <div class="small-card" onclick="submitRoomForm('<%= room.getRoomId() %>');">
                    <input type="hidden" name="roomId" value="<%= room.getRoomId() %>">
                    <button type="submit" class="card-button">
                        <span class="card-title"><%= room.getRoomNo() %></span>
                    </button>
                </div>
            </form>
        <% } %>
    </div>
</body>

</html>
