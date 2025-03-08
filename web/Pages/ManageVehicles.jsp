<%-- 
    Document   : AdminDashboard
    Created on : Mar 6, 2025, 2:38:18 AM
    Author     : Nahla 
--%>
<%
    if (request.getSession().getAttribute("vehicles") == null) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/ViewVehiclesServlet");
        dispatcher.forward(request, response);
        return;
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.mega_city_cab.business.model.Vehicle" %>

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
                <h1 class="welcome-text">Mega City Cab Vehicles</h1>
                <div class="row align-items-center">
                    <!-- Left Column: Image -->
                    <div class="col-md-6">
                        <div class="mb-4">
                            <input type="text" id="searchInput" class="form-control mb-3" placeholder="Search by Vehicle Number, Type, Name or Driver ID">
                        </div>
                    </div>
                    <!-- Right Column: Welcome Text -->
                    <div class="col-md-6">
                        <div class="mb-4">
                            <button class="btn btn-primary add-btn" onclick="showAddVehicleForm()">Add Vehicle</button>
                        </div>
                    </div>
                </div>
                <!-- Hidden Add Vehicle Form -->
                <div id="addVehicleForm" style="display:none;" class="p-4 border rounded shadow-lg bg-white addDriver">
                    <h3 class="AddDriverText">Add New Vehicle</h3>
                    <form action="/Mega_City_Cab/AddVehicleServlet" method="post">
                        <div class="mb-2">
                            <label class="addtext">Number:</label>
                            <input type="text" name="vehicleNumber" required class="form-control">
                        </div>
                        <div class="mb-2">
                            <label class="addtext">Type:</label>
                            <select name="type" required class="form-control">
                                <option value="Bike">Bike</option>
                                <option value="Tuk">Tuk</option>
                                <option value="Car">Car</option>
                                <option value="Mini Van">Mini Van</option>
                                <option value="Van">Van</option>
                            </select>
                        </div>
                        <div class="mb-2">
                            <label class="addtext">Name:</label>
                            <input type="text" name="vehicleName" required class="form-control">
                        </div>
                        <div class="mb-2">
                            <label class="addtext">Model:</label>
                            <input type="text" name="model" required class="form-control">
                        </div>
                        <div class="mb-2">
                            <label class="addtext">Assigned Driver ID:</label>
                            <input type="text" name="assigned_driver" required class="form-control">
                        </div>
                        <button type="button" class="btn btn-secondary cancel" onclick="hideAddVehicleForm()">Cancel</button>
                        <button type="submit" class="btn btn-success add">Add Vehicle</button>
                    </form>
                </div>
                <table id="vehicleTable" class="table table-striped">
                    <thead>
                        <tr>
                            <th>Number</th>
                            <th>Type</th>
                            <th>Name</th>
                            <th>Model</th>
                            <th>Assigned Driver ID</th>
                            <th style="width: 15%">Actions</th> <!-- New column for buttons -->
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<Vehicle> vehicles = (List<Vehicle>) request.getSession().getAttribute("vehicles");
                            if (vehicles != null && !vehicles.isEmpty()) {
                                for (Vehicle vehicle : vehicles) {
                        %>
                        <tr>
                            <td><%= vehicle.getNumber()%></td>
                            <td><%= vehicle.getType()%></td>
                            <td><%= vehicle.getName()%></td>
                            <td><%= vehicle.getModel()%></td>
                            <td><%= (vehicle.getDriver_Id() == 0) ? "Not Assigned" : vehicle.getDriver_Id()%></td>
                            <td>
                                <!-- Update Button -->
                                <a href="EditVehicle.jsp?num=<%= vehicle.getNumber()%>" class="btn btn-warning">Update</a>

                                <!-- Remove Button -->
                                <form action="/Mega_City_Cab/RemoveVehicleServlet" method="post" style="display:inline;" onsubmit="return confirm('Are you sure you want to remove this vehicle?');">
                                    <input type="hidden" name="vehicleNumber" value="<%= vehicle.getNumber()%>">
                                    <button type="submit" class="btn btn-danger">Remove</button>
                                </form>
                            </td>
                        </tr>
                        <%
                            }
                        } else {
                        %>
                        <tr>
                            <td colspan="8" class="text-center">No vehicles found.</td>
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
            function showAddVehicleForm() {
                document.getElementById('addVehicleForm').style.display = 'block';
            }
            function hideAddVehicleForm() {
                document.getElementById('addVehicleForm').style.display = 'none';
            }

            document.getElementById("searchInput").addEventListener("keyup", function () {
                let searchQuery = this.value.toLowerCase();
                let rows = document.querySelectorAll("#vehicleTable tbody tr");

                rows.forEach(row => {
                    let no = row.children[0].textContent.toLowerCase();
                    let type = row.children[1].textContent.toLowerCase();
                    let name = row.children[2].textContent.toLowerCase();
                    let id = row.children[4].textContent.toLowerCase();

                    if (no.includes(searchQuery) || type.includes(searchQuery) || name.includes(searchQuery) || id.includes(searchQuery)) {
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
