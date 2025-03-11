<%-- 
    Document   : AboutUs
    Created on : Feb 18, 2025, 11:03:07 PM
    Author     : Nahla 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>About Us</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="../CSS/Styles.css">
        <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.6.0/uicons-solid-straight/css/uicons-solid-straight.css'>

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
                <!-- Right Column: Welcome Text -->
                <div class="col-md-6 about">
                    <h1 class="welcome-text">About Us</h1>
                    <p class="motto">At Mega City Cab, we believe that transportation should be seamless, reliable, and accessible for everyone.
                        Founded with a vision to transform urban travel, our mission is to provide top-notch service that meets the diverse needs
                        of our riders. Born from a passion for exceptional service, we have grown into a trusted name in urban transportation, with
                        a dedicated team committed to ensuring every ride is safe, comfortable, and enjoyable. We prioritize customer satisfaction
                        above all else, with drivers undergoing rigorous training and background checks for your safety. Each ride features GPS 
                        tracking for real-time journey monitoring, and our user-friendly app makes booking quick and hassle-free. We offer a diverse
                        range of vehicles to suit every need—from compact cars for solo travelers to spacious vans for groups—all regularly 
                        maintained to guarantee a smooth ride every time.</p>
                </div>
                <!-- Left Column: Image -->
                <div class="col-md-6">
                    <img src="../Assets/Images/location.png" alt="AboutUs Image" class="img-fluid">
                </div>
            </div>
        </div>

        <div class="bg-800 py-4 services">
        <h2 class="text-center text-3xl font-bold mb-6 ourservices">Our Services</h2>
        <div class="row">
            <div class="col-md-4 text-center">
                <i class="fi fi-ss-site-alt site"></i>
                <h3 class="service-text">Easy Booking</h3>
                <p class="description">Book a ride in just a few clicks.</p>
            </div>
            <div class="col-md-4 text-center">
                <i class="fi fi-ss-usd-circle site"></i>
                <h3 class="service-text">Affordable Rides</h3>
                <p class="description">Competitive pricing for every trip.</p>
            </div>
            <div class="col-md-4 text-center">
                <i class="fi fi-ss-shield-keyhole site"></i>
                <h3 class="service-text">Secure Payments</h3>
                <p class="description">Safe and hassle-free payment options.</p>
            </div>
        </div>
        </div>
        
        <div class="bg-800 py-4 about-closing">
            <h1 class="chooseus">Why choose us?</h1>
            <p class="motto"> At Mega City Cab, we pride ourselves on our reliable service, ensuring prompt pickups and timely arrivals for every ride.
                Our competitive rates allow you to enjoy affordable fares without compromising on quality. Additionally, our customer-focused 
                approach means that our friendly support team is available 24/7 to assist you with any questions or concerns, making your 
                experience with us as smooth as possible. <br> Join the Mega City Cab family today and experience the difference in urban 
                transportation. We’re here to get you where you need to go—safely and efficiently!</p>
            <a href="./SignUp.html" class="btn">Join Now</a>
        </div>

        <footer class="bg-800 text-white py-6">
            <div class="container mx-auto text-center">
                <p>&copy; 2025 Mega City Cab. All rights reserved.</p>
            </div>
        </footer>

    </body>
</html>

