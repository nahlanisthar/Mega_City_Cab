<%-- 
    Document   : AdminLogin
    Created on : Mar 1, 2025, 3:08:01 AM
    Author     : Nahla 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login - Mega City Cab</title>

        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="../CSS/Styles.css">

    </head>
    <body>

        <div class="login-container">
            <div class="row h-100">

                <!-- Left Side (Image) -->
                <div class="col-md-6">
                    <img class="adminloginpic" src="../Assets/Images/admin.png" alt="Home Image">
                </div>

                <!-- Right Side (Full-width Form) -->
                <div class="col-md-6 d-flex flex-column justify-content-center px-5 login-section">
                    <h2 class="loginfont">Welcome Admin!</h2>

                    <form action="/Mega_City_Cab/AdminLoginServlet" method="post">

                        <!-- Username -->
                        <div class="mb-3">
                            <label class="login-form-label">Username:</label>
                            <input type="text" name="username" class="form-control w-75 mx-auto" required>
                        </div>

                        <!-- Password -->
                        <div class="mb-3">
                            <label class="login-form-label">Password:</label>
                            <input type="password" name="password" class="form-control w-75 mx-auto" required>
                        </div>

                        <!-- Submit Button -->
                        <div class="d-flex justify-content-center">
                            <button class="btn submitbtn" onclick="window.location.href='../index.html';" >Login</button>
                        </div>
                    </form>
                </div>

            </div>
        </div>

    </body>
</html>

