<%-- 
    Document   : ContactUs
    Created on : Feb 18, 2025, 11:03:15 PM
    Author     : Nahla 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Contact Us</title>
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
                    <a href="Login.html" class="login">Login</a>
                    <a href="SignUp.html" class="login">Sign Up</a>
                </div>
            </div>
        </header>
        <nav class="bg-800 py-4">
            <div class="container mx-auto flex justify-around text-white">
                <a href="../index.html" class="hover:text-yellow-400 nav-content">Home</a>
                <a href="AboutUs.jsp" class="hover:text-yellow-400 nav-content">About Us</a>
                <a href="HowItWorks.jsp" class="hover:text-yellow-400 nav-content">How it Works</a>
                <a href="ContactUs.jsp" class="hover:text-yellow-400 nav-content">Contact Us</a>
            </div>
        </nav>
        <div class="custom-container">
            <div class="row align-items-center">
                <!-- Left Column: Image -->
                <div class="col-md-6">
                    <img src="../Assets/Images/friend.png" alt="Home Image" class="img-fluid friend">
                </div>
                <!-- Right Column: Welcome Text -->
                <div class="col-md-6 contact-form">
                    <h1 class="welcome-text">Contact Us</h1>
                    <form method="post" onsubmit="return showMessage()">
                        <!-- Name Field -->
                        <div class="mb-3">
                            <input type="text" class="form-control w-75 h-auto" name="name" placeholder="Enter your name" required>
                        </div>
                        <!-- Email Field -->
                        <div class="mb-3">
                            <input type="email" class="form-control w-75 h-auto" name="email" placeholder="Enter your email" required>
                        </div>
                        <!-- Subject Field -->
                        <div class="mb-3">
                            <input type="text" class="form-control w-75 h-auto" name="subject" placeholder="Subject">
                        </div>
                        <!-- Message Field -->
                        <div class="mb-3">
                            <textarea class="form-control w-75" name="message" rows="5" placeholder="Your message" required></textarea>
                        </div>
                        <!-- Submit Button -->
                        <button type="submit" class="btn sendbtn">Send Message</button>
                    </form>
                </div>
            </div>
        </div>
        <footer class="bg-800 text-white py-6">
            <div class="container mx-auto text-center">
                <p>&copy; 2025 Mega City Cab. All rights reserved.</p>
            </div>
        </footer>

        <!-- Optional JavaScript for Bootstrap -->
        <script>
            function showMessage() {
                alert("Your form has been submitted successfully!");
                return true; 
            }
        </script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

    </body>
</html>


