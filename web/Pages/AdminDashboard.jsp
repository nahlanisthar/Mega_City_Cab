<%-- 
    Document   : AdminDashboard
    Created on : Mar 6, 2025, 2:38:18 AM
    Author     : Nahla 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.mega_city_cab.business.model.Ride" %>

<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    HttpSession adminSession = request.getSession(false);
    if (adminSession == null || adminSession.getAttribute("adminUser") == null) {
        response.sendRedirect("AdminLogin.jsp"); // Redirect if session does not exist
        return;
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Mega City Cab</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.tailwindcss.com"></script>
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
                <a href="AdminDashboard.jsp" class="hover:text-yellow-400 nav-content">Dashboard</a>
                <a href="ManageUsers.jsp" class="hover:text-yellow-400 nav-content">Manage Users</a>
                <a href="ManageDrivers.jsp" class="hover:text-yellow-400 nav-content">Manage Drivers</a>
                <a href="ManageVehicles.jsp" class="hover:text-yellow-400 nav-content">Manage Vehicles</a>
            </div>
        </nav>
        <div class="custom-container">
            <div class="ride-container">
                <h1 class="welcome-text">Welcome, Admin!</h1>
                <p class="motto-1">Take a look at today's cab bookings!</p>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Ride ID</th>
                            <th>User ID</th>
                            <th>Customer Name</th>
                            <th>Customer Phone</th>
                            <th>Pickup Location</th>
                            <th>Drop-off Location</th>
                            <th>Vehicle</th>
                            <th>Driver ID</th>
                            <th>Driver Name</th>
                            <th>Total Fare</th>
                            <th>Discount Coupon</th>
                            <th>Final Fare</th>
                            <th>Payment Type</th>
                            <th>Date and Time</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<Ride> rideHistory = (List<Ride>) session.getAttribute("rideHistory");
                            if (rideHistory != null && !rideHistory.isEmpty()) {
                                for (Ride ride : rideHistory) {
                        %>
                        <tr>
                            <td>#<%= String.format("%05d", ride.getRideId())%></td>
                            <td><%= ride.getUserId()%></td>
                            <td><%= ride.getName()%></td>
                            <td><%= ride.getPhone()%></td>
                            <td><%= ride.getPickupLocation()%></td>
                            <td><%= ride.getDropoffLocation()%></td>
                            <td><%= ride.getVehicleType()%> - <%= ride.getVehicleDetails()%></td>
                            <td><%= ride.getDriverId()%></td>
                            <td><%= ride.getDriverName()%></td>
                            <td>LKR <%= ride.getTotalFare()%></td>
                            <td><%= ride.getDiscountCoupon()%></td>
                            <td>LKR <%= (ride.getFinalFare() != null && ride.getFinalFare() > 0) ? ride.getFinalFare() : ride.getTotalFare()%></td>
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
        </div>
        <footer class="bg-800 text-white py-6">
            <div class="container mx-auto text-center">
                <p>&copy; 2025 Mega City Cab. All rights reserved.</p>
            </div>
        </footer>

        <script>
            sessionStorage.removeItem("redirected"); // Ensure redirection happens each time ride.jsp loads
            document.addEventListener("DOMContentLoaded", function () {
                let lastRedirectTime = localStorage.getItem("lastRedirectTime");
                let currentTime = new Date().getTime();

                // Redirect only if more than 5 seconds have passed since the last redirect
                if (!lastRedirectTime || (currentTime - lastRedirectTime > 5000)) {
                    localStorage.setItem("lastRedirectTime", currentTime);
                    window.location.replace("<%= request.getContextPath()%>/AdminViewRides");
                }
            });

            function confirmLogout() {
                let confirmAction = confirm("Are you sure you want to logout?");
                if (confirmAction) {
                    response.sendRedirect("Logout.jsp"); // Redirect to logout servlet
                    return true; // Continue execution
                }
                return false; // Stop execution if canceled
            }
        </script>
    </body>
</html>
