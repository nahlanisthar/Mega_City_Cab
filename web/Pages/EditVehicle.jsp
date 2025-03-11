<%-- 
    Document   : EditDriver
    Created on : Mar 8, 2025, 2:10:05 AM
    Author     : Nahla 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.mega_city_cab.util.DBconnection" %>
<%@ page import="com.mega_city_cab.business.model.Vehicle" %>
<%
    String vehicleNumber = request.getParameter("num");
    Vehicle vehicle = null;

    try {
        Connection conn = DBconnection.getConnection();
        String sql = "SELECT * FROM vehicles WHERE vehicle_number = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, vehicleNumber);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            vehicle = new Vehicle(
                    rs.getString("vehicle_number"),
                    rs.getString("vehicle_type"),
                    rs.getString("vehicle_name"),
                    rs.getString("vehicle_model"),
                    rs.getInt("driver_id")
            );
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Edit Vehicle</title>
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
            </div>
        </header>
        <nav class="bg-800 py-4">
        </nav>
        <div class="custom-container">
            <div class="edit-container">
                <h1 class="welcome-text">Edit Vehicle Details</h1>
                <form action="/Mega_City_Cab/UpdateVehicleServlet" method="post">
                    <input type="hidden" name="v_number" value="<%= vehicle.getNumber()%>">

                    <div class="mb-3">
                        <label>Type:</label>
                        <select name="v_type" class="form-control">
                            <option value="Bike" <%= vehicle.getType().equals("Bike") ? "selected" : ""%>>Bike</option>
                            <option value="Tuk" <%= vehicle.getType().equals("Tuk") ? "selected" : ""%>>Tuk</option>
                            <option value="Car" <%= vehicle.getType().equals("Car") ? "selected" : ""%>>Car</option>
                            <option value="Mini Van" <%= vehicle.getType().equals("Mini Van") ? "selected" : ""%>>Mini Van</option>
                            <option value="Van" <%= vehicle.getType().equals("Van") ? "selected" : ""%>>Van</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label>Name:</label>
                        <input type="text" name="v_name" value="<%= vehicle.getName()%>" class="form-control">
                    </div>

                    <div class="mb-3">
                        <label>Model:</label>
                        <input type="text" name="v_model" value="<%= vehicle.getModel()%>" class="form-control">
                    </div>

                    <div class="mb-3">
                        <label>Assigned Driver ID:</label>
                        <input type="number" name="v_driver_id" value="<%= vehicle.getDriver_Id()%>" class="form-control">
                    </div>

                    <a href="ManageVehicles.jsp" class="btn btn-danger cancel">Cancel</a>
                    <button type="submit" class="btn btn-warning add">Update Vehicle</button>
                </form>
            </div>
        </div>
        <footer class="bg-800 text-white py-6">
            <div class="container mx-auto text-center">
                <p>&copy; 2025 Mega City Cab. All rights reserved.</p>
            </div>
        </footer>
    </body>
</html>

