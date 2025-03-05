<%-- 
    Document   : RideActivity
    Created on : Mar 5, 2025, 3:46:16 PM
    Author     : Nahla 
--%>
<%@ page import="java.util.List" %>
<%@ page import="com.mega_city_cab.business.model.Ride" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // Retrieve user's name from session
    HttpSession sessionObj = request.getSession(false);
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect(request.getContextPath() + "/Pages/Login.html"); // Redirect to login page if session is invalid
    }
%>


<!DOCTYPE html>
<html>
    <head>
        <title>Ride History</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="../JS/Scripts.js"></script>
        <link rel="stylesheet" type="text/css" href="../CSS/Styles.css">

    </head>
    <body>
        <header class="bg-600 py-4">
            <div class="container mx-auto flex justify-between items-center">
                <h1 class="headtag">Mega City Cab</h1>
                <div>
                    <a href="Logout.jsp" class="login" onclick="return confirmLogout()">Log Out</a>
                </div>
            </div>
        </header>
        <nav class="bg-800 py-4">
            <div class="container mx-auto flex justify-around text-white">
                <a href="Dashboard.jsp" class="hover:text-yellow-400 nav-content">Home</a>
                <a href="BookARide.jsp" class="hover:text-yellow-400 nav-content">Book A Ride</a>
                <a href="<%= request.getContextPath() %>/RideActivity?user_id=<%= session.getAttribute("user_id") %>" class="hover:text-yellow-400 nav-content">Activity</a>
                <a href="MyProfile.jsp" class="hover:text-yellow-400 nav-content">My Profile</a>
            </div>
        </nav>
        <div class="container mt-5">
            <h1 class="welcome-text">Your Ride History</h1>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th style="width: 8%;">Order No</th>
                        <th style="width: 15%;">Pickup</th>
                        <th style="width: 15%;">Drop-off</th>
                        <th style="width: 22%;">Vehicle</th>
                        <th style="width: 12%;">Driver</th>
                        <th style="width: 10%;">Fare</th>
                        <th style="width: 8%;">Payment</th>
                        <th style="width: 10%;">Date</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Ride> rideHistory = (List<Ride>) session.getAttribute("rideHistory");
                        if (rideHistory != null && !rideHistory.isEmpty()) {
                            for (Ride ride : rideHistory) {
                    %>
                    <tr>
                        <td>#<%= String.format("%05d", ride.getRideId()) %></td>
                        <td><%= ride.getPickupLocation()%></td>
                        <td><%= ride.getDropoffLocation()%></td>
                        <td><%= ride.getVehicleType()%> - <%= ride.getVehicleDetails()%></td>
                        <td><%= ride.getDriverName()%></td>
                        <td>LKR <%= (ride.getFinalFare() != null && ride.getFinalFare() > 0) ? ride.getFinalFare() : ride.getTotalFare() %></td>
                        <td><%= ride.getPaymentType()%></td>
                        <td><%= ride.getRideTimestamp()%></td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="8" class="text-center">No rides found.</td>
                    </tr>
                    <% }%>
                </tbody>
            </table>
        </div>
    </body>
</html>
