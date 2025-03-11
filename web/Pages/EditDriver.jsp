<%-- 
    Document   : EditDriver
    Created on : Mar 8, 2025, 2:10:05 AM
    Author     : Nahla 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.mega_city_cab.util.DBconnection" %>
<%@ page import="com.mega_city_cab.business.model.Driver" %>
<%
    int driverId = Integer.parseInt(request.getParameter("id"));
    Driver driver = null;

    try {
        Connection conn = DBconnection.getConnection();
        String sql = "SELECT * FROM drivers WHERE driver_id=?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, driverId);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            driver = new Driver(
                    rs.getInt("driver_id"),
                    rs.getString("driver_name"),
                    rs.getString("email"),
                    rs.getString("phone"),
                    rs.getString("nic"),
                    rs.getString("status")
            );
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Edit Driver</title>
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
                <h1 class="welcome-text">Edit Driver Details</h1>
                <form action="/Mega_City_Cab/UpdateDriverServlet" method="post">
                    <input type="hidden" name="driver_id" value="<%= driver.getId()%>">

                    <div class="mb-3">
                        <label>Name:</label>
                        <input type="text" name="name" value="<%= driver.getName()%>" class="form-control">
                    </div>

                    <div class="mb-3">
                        <label>Email:</label>
                        <input type="email" name="email" value="<%= driver.getEmail()%>" class="form-control">
                    </div>

                    <div class="mb-3">
                        <label>NIC:</label>
                        <input type="text" name="nic" value="<%= driver.getNic()%>" class="form-control">
                    </div>

                    <div class="mb-3">
                        <label>Phone:</label>
                        <input type="text" name="phone" value="<%= driver.getPhone()%>" class="form-control">
                    </div>

                    <div class="mb-3">
                        <label>Status:</label>
                        <select name="status" class="form-control">
                            <option value="Available" <%= driver.getStatus().equals("Available") ? "selected" : ""%>>Available</option>
                            <option value="Unavailable" <%= driver.getStatus().equals("Unavailable") ? "selected" : ""%>>Unavailable</option>
                        </select>
                    </div>
                    <a href="ManageDrivers.jsp" class="btn btn-danger cancel">Cancel</a>
                    <button type="submit" class="btn btn-warning add">Update Driver</button>
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

