<%-- 
    Document   : Dashboard
    Created on : Feb 18, 2025, 10:08:04 PM
    Author     : Nahla 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // Retrieve user's name from session
    HttpSession sessionObj = request.getSession(false);
if (session == null || session.getAttribute("username") == null) {
    response.sendRedirect("Login.html"); // Redirect to login page if session is invalid
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
                <a href="Ride.jsp" class="hover:text-yellow-400 nav-content">Activity</a>
                <a href="MyProfile.jsp" class="hover:text-yellow-400 nav-content">My Profile</a>
            </div>
        </nav>
        <div class="custom-container">
            <div class="row align-items-center">
                <!-- Left Column: Image -->
                <div class="col-md-6">
                    <img src="../Assets/Images/welcome.jpg" alt="Home Image" class="img-fluid">
                </div>
                <!-- Right Column: Welcome Text -->
                <div class="col-md-6">
                    <h1 class="welcome-text">Welcome, <%= session.getAttribute("name")%>!</h1>
                    <p class="motto-1">Welcome back to Mega City Cab, your trusted partner for safe, comfortable, and 
                        reliable rides across Colombo. Whether you’re travelling to and fro, running errands, or heading out for
                        a special occasion, we’re here to make your journey smooth and hassle-free. Enjoy easy bookings,
                        real-time tracking, secure payments, and professional drivers, all designed to ensure a safe and
                        pleasant experience. Thank you for choosing Mega City Cab, where every ride matters!</p>
                    <a href="../Pages/BookARide.jsp" class="btn">Book Now</a>
                </div>
            </div>
        </div>
        <footer class="bg-800 text-white py-6">
            <div class="container mx-auto text-center">
                <p>&copy; 2025 Mega City Cab. All rights reserved.</p>
            </div>
        </footer>
    </body>
</html>

