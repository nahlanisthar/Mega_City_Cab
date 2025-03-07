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
                <h1 class="welcome-text">Mega City Cab Drivers</h1>
                <div class="row align-items-center">
                    <!-- Left Column: Image -->
                    <div class="col-md-6">
                        <div class="mb-4">
                            <input type="text" id="searchInput" class="form-control mb-3" placeholder="Search by ID, Name or Availability">
                        </div>
                    </div>
                    <!-- Right Column: Welcome Text -->
                    <div class="col-md-6">
                        <div class="mb-4">
                            <button class="btn btn-primary add-btn" onclick="showAddDriverForm()">Add Driver</button>
                        </div>
                    </div>
                </div>
                <!-- Hidden Add Driver Form -->
                <div id="addDriverForm" style="display:none;" class="p-4 border rounded shadow-lg bg-white addDriver">
                    <h3 class="AddDriverText">Add New Driver</h3>
                    <form action="/Mega_City_Cab/AddDriverServlet" method="post">
                        <div class="mb-2">
                            <label class="addtext">Name:</label>
                            <input type="text" name="driverName" required class="form-control">
                        </div>
                        <div class="mb-2">
                            <label class="addtext">Email:</label>
                            <input type="email" name="email" required class="form-control">
                        </div>
                        <div class="mb-2">
                            <label class="addtext">NIC:</label>
                            <input type="text" name="nic" required class="form-control">
                        </div>
                        <div class="mb-2">
                            <label class="addtext">Phone:</label>
                            <input type="text" name="phone" required class="form-control">
                        </div>
                        <div class="mb-2">
                            <label class="addtext">Status:</label>
                            <select name="status" required class="form-control">
                                <option value="Available">Available</option>
                                <option value="Unavailable">Unavailable</option>
                            </select>
                        </div>
                        <button type="button" class="btn btn-secondary cancel" onclick="hideAddDriverForm()">Cancel</button>
                        <button type="submit" class="btn btn-success add">Add Driver</button>
                    </form>
                </div>
                <table id="driverTable" class="table table-striped">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>NIC</th>
                            <th>Phone</th>
                            <th>Status</th>
                            <th style="width: 15%">Actions</th> <!-- New column for buttons -->
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
                            <td>
                                <!-- Update Button -->
                                <a href="EditDriver.jsp?id=<%= driver.getId()%>" class="btn btn-warning">Update</a>

                                <!-- Remove Button -->
                                <form action="/Mega_City_Cab/RemoveDriverServlet" method="post" style="display:inline;" onsubmit="return confirm('Are you sure you want to remove this driver?');">
                                    <input type="hidden" name="driverId" value="<%= driver.getId()%>">
                                    <button type="submit" class="btn btn-danger">Remove</button>
                                </form>
                            </td>

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
            function showAddDriverForm() {
                document.getElementById('addDriverForm').style.display = 'block';
            }
            function hideAddDriverForm() {
                document.getElementById('addDriverForm').style.display = 'none';
            }

            document.getElementById("searchInput").addEventListener("keyup", function () {
                let searchQuery = this.value.toLowerCase();
                let rows = document.querySelectorAll("#driverTable tbody tr");

                rows.forEach(row => {
                    let id = row.children[0].textContent.toLowerCase();
                    let name = row.children[1].textContent.toLowerCase();
                    let status = row.children[5].textContent.toLowerCase();

                    if (id.includes(searchQuery) ||name.includes(searchQuery) || status.includes(searchQuery)) {
                        row.style.display = "";
                    } else {
                        row.style.display = "none";
                    }
                });
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
