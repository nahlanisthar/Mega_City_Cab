<%-- 
    Document   : AdminDashboard
    Created on : Mar 6, 2025, 2:38:18 AM
    Author     : Nahla 
--%>
<%
    if (request.getSession().getAttribute("drivers") == null) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/ViewDriversServlet");
        dispatcher.forward(request, response);
        return;
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.mega_city_cab.business.model.Driver" %>

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
                    <a href="AdminLogoutServlet" class="login" onclick="return confirmLogout()">Log Out</a>
                </div>
            </div>
        </header>
        <nav class="bg-800 py-4">
            <div class="container mx-auto flex justify-around text-white">
                <a href="AdminDashboard.jsp" class="hover:text-yellow-400 nav-content">Dashboard</a>
                <a href="ManageUsers.jsp" class="hover:text-yellow-400 nav-content">Manage Users</a>
                <a href="ManageDrivers.jsp" class="hover:text-yellow-400 nav-content">Manage Drivers</a>
                <a href="#" class="hover:text-yellow-400 nav-content">Manage Vehicles</a>
            </div>
        </nav>
        <div class="custom-container">
            <div class="ride-container">
                <h1 class="welcome-text">Mega City Cab Users</h1>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>NIC</th>
                            <th>Phone</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<Driver> drivers = (List<Driver>) request.getSession().getAttribute("drivers");
                            if (drivers != null && !drivers.isEmpty()) {
                                for (Driver driver : drivers) {
                        %>
                        <tr>
                            <td><%= driver.getId()%></td>
                            <td><%= driver.getName()%></td>
                            <td><%= driver.getEmail()%></td>
                            <td><%= driver.getNic()%></td>
                            <td><%= driver.getPhone()%></td>
                            <td><%= driver.getStatus()%></td>
                            
                        </tr>
                        <%
                            }
                        } else {
                        %>
                        <tr>
                            <td colspan="8" class="text-center">No drivers found.</td>
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

            function confirmLogout() {
                let confirmAction = confirm("Are you sure you want to logout?");
                if (confirmAction) {
                    window.location.href = ; // Redirect to logout servlet
                    return true; // Continue execution
                }
                return false; // Stop execution if canceled
            }
        </script>
    </body>
</html>
