<%-- 
    Document   : Dashboard
    Created on : Feb 18, 2025, 10:08:04 PM
    Author     : Nahla 
--%>

<%@ page import="com.mega_city_cab.business.model.Customer" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<%
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj == null || sessionObj.getAttribute("username") == null) {
        response.sendRedirect(request.getContextPath() + "/Pages/Login.html");
    }

    Customer customer = (Customer) sessionObj.getAttribute("customer");
%>

<!DOCTYPE html>
<html>
    <head>
        <title>My Profile</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
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
                <a href="<%= request.getContextPath()%>/RideActivity?user_id=<%= session.getAttribute("user_id")%>" class="hover:text-yellow-400 nav-content">Activity</a>
                <a href="MyProfile.jsp" class="hover:text-yellow-400 nav-content">My Profile</a>
            </div>
        </nav>

        <div class="container mt-5 profile-container">
            <div class="row align-items-center">
                <div class="col-md-6">
                    <h1 class="welcome-text">My Profile</h1>
                    <img src="../Assets/Images/profile.png" alt="Home Image" class="w-75 mx-auto profile">
                </div>
                <div class="col-md-6">
                    <div class="profile-card p-4 border border-gray-300 rounded-lg shadow-md">
                        <% if (customer != null) {%>
                        <form action="/Mega_City_Cab/ProfileServlet" method="POST">
                            <div class="mb-3">
                                <label>Name:</label>
                                <input type="text" id="name" name="name" class="form-control" value="<%= customer.getName()%>" disabled>
                            </div>

                            <div class="mb-3">
                                <label>Email:</label>
                                <input type="email" id="email" name="email" class="form-control" value="<%= customer.getEmail()%>" disabled>
                            </div>

                            <div class="mb-3">
                                <label>NIC:</label>
                                <input type="text" id="nic" name="nic" class="form-control" value="<%= customer.getNic()%>" disabled>
                            </div>

                            <div class="mb-3">
                                <label>Phone:</label>
                                <input type="text" id="phone" name="phone" class="form-control" value="<%= customer.getPhone()%>" disabled>
                            </div>

                            <button type="button" id="editBtn" class="btn btn-primary">Edit</button>
                            <button type="submit" id="saveBtn" class="btn btn-success" style="display:none;">Save</button>
                        </form>
                        <% } else { %>
                        <p class="text-center">No profile details found.</p>
                        <% }%>
                    </div>
                </div>
            </div>
        </div>
        <footer class="bg-800 text-white py-6">
            <div class="container mx-auto text-center">
                <p>&copy; 2025 Mega City Cab. All rights reserved.</p>
            </div>
        </footer>

        <script>
            window.onload = () => {
                // Check if we are not on the Profile page and if the redirect flag is not set in sessionStorage
                if (window.location.pathname !== "/Mega_City_Cab/ProfileServlet" && !sessionStorage.getItem("redirected")) {
                    fetchProfile();
                }
            };

            function fetchProfile() {
                // Set the flag in sessionStorage to avoid redirect loop
                sessionStorage.setItem("redirected", "true");
                window.location.href = "/Mega_City_Cab/ProfileServlet";
            }

            document.getElementById("editBtn").addEventListener("click", function () {
                document.getElementById("name").disabled = false;
                document.getElementById("email").disabled = false;
                document.getElementById("nic").disabled = false;
                document.getElementById("phone").disabled = false;

                document.getElementById("editBtn").style.display = "none";
                document.getElementById("saveBtn").style.display = "block";
            });
        </script>
    </body>
</html>

