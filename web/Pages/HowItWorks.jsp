<%-- 
    Document   : HowItWorks
    Created on : Feb 18, 2025, 11:03:26 PM
    Author     : Nahla 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>How It Works</title>
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

        <div class="bg-800 py-4 how-closing">
            <h1 class="welcome-text">How It Works</h1>
            <p class="motto"> Welcome to Mega City Cab, your trusted cab service in Colombo! Our user-friendly online booking 
                system ensures a seamless experience from booking your ride to reaching your destination. Whether you're a new
                or returning customer, this guide will help you navigate the process effortlessly.</p>
        </div>

        <div class="steps">
            <div class="row align-items-center">
                <!-- Right Column: Welcome Text -->
                <div class="col-md-6 steps-left">
                    <h1 class="chooseus">Step 1: Log In to Your Account</h1>
                    <p class="motto">Before booking a ride, you must log in using your username and password. This authentication
                        step ensures a secure and personalized experience for all users. If you're a new customer, you'll need to
                        register by providing essential details such as your name, address, National Identity Card (NIC) number, 
                        and contact information. Once your account is set up, logging in will give you instant access to booking 
                        services and your ride history.</p>
                </div>
                <!-- Left Column: Image -->
                <div class="col-md-6">
                    <img src="../Assets/Images/login.png" alt="login Image" class="mx-auto w-50 h-auto">
                </div>
            </div>
        </div>

        <div class="steps">
            <div class="row align-items-center">
                <!-- Left Column: Image -->
                <div class="col-md-6">
                    <img src="../Assets/Images/booking.jpg" alt="login Image" class="mx-auto w-75 h-auto">
                </div>
                <!-- Right Column: Welcome Text -->
                <div class="col-md-6 steps-right">
                    <h1 class="chooseus">Step 2: Book Your Ride</h1>
                    <p class="motto">Booking a cab with Mega City Cab is quick and hassle-free. Simply enter your details, 
                        including your name, contact number, and ride preferences. You will need to specify your pickup location,
                        where the driver should arrive, and your drop-off destination. Additionally, you can choose any special 
                        ride preferences, such as the type of vehicle you require. Once all details are entered, the system will
                        generate a unique booking number for your trip, which will allow you to track your ride and view fare 
                        calculations in advance.</p>
                </div>

            </div>
        </div>

        <div class="steps">
            <div class="row align-items-center">
                <!-- Right Column: Welcome Text -->
                <div class="col-md-6 steps-left">
                    <h1 class="chooseus">Step 3: Check Your Booking Details</h1>
                    <p class="motto">After successfully booking your ride, you can review all relevant details within your 
                        dashboard. Here, you will find important information such as your unique booking ID, the estimated
                        pickup time, and the expected arrival time at your destination. The system also provides a fare estimate
                        before confirming the ride, ensuring complete transparency. If you need to make any modifications, such 
                        as updating your pickup location or canceling your ride, you can do so conveniently from the booking 
                        details section.</p>
                </div>
                <!-- Left Column: Image -->
                <div class="col-md-6">
                    <img src="../Assets/Images/track.png" alt="login Image" class="mx-auto w-50 h-auto">
                </div>
            </div>
        </div>

        <div class="steps">
            <div class="row align-items-center">
                <!-- Left Column: Image -->
                <div class="col-md-6">
                    <img src="../Assets/Images/calculator.png" alt="login Image" class="mx-auto w-50 h-auto">
                </div>
                <!-- Right Column: Welcome Text -->
                <div class="col-md-6 steps-right">
                    <h1 class="chooseus">Step 4: Fare Calculation & Billing</h1>
                    <p class="motto">Once your ride is complete, Mega City Cab’s system will automatically calculate the total
                        fare based on the distance traveled. The final amount includes the base fare, any additional charges, 
                        applicable taxes, and any discounts available at the time of booking. To keep the process smooth, you
                        will receive a detailed breakdown of your fare, and you can choose to either print or save your bill 
                        for future reference.</p>
                </div>
            </div>
        </div>

        <div class="steps">
            <div class="row align-items-center">
                <!-- Right Column: Welcome Text -->
                <div class="col-md-6 steps-left">
                    <h1 class="chooseus">Step 5: Meet Your Driver & Enjoy <br> Your Ride!</h1>
                    <p class="motto">At Mega City Cab, we prioritize your comfort and safety by ensuring that each ride is
                        assigned to a professional and experienced driver. Once your booking is confirmed, you can view key
                        details about your assigned driver, including their name, contact number, and vehicle details such 
                        as the make, model, and license plate number. Your driver will arrive at the designated pickup location
                        at the scheduled time, ready to transport you to your destination smoothly and safely.</p>
                </div>
                <!-- Left Column: Image -->
                <div class="col-md-6">
                    <img src="../Assets/Images/driver-meet.jpg" alt="login Image" class="mx-auto w-75 h-auto">
                </div>
            </div>
        </div>

        <div class="steps">
            <div class="row align-items-center">
                <!-- Left Column: Image -->
                <div class="col-md-6">
                    <img src="../Assets/Images/log out.png" alt="login Image" class="mx-auto w-50 h-auto">
                </div>
                <!-- Right Column: Welcome Text -->
                <div class="col-md-6 steps-right">
                    <h1 class="chooseus">Step 6: Log Out Securely</h1>
                    <p class="motto">Once you have completed your journey and no longer need access to the system, it is
                        important to log out properly. Logging out ensures that your account remains secure and prevents 
                        unauthorized access. With a single click, you can exit the system safely, knowing that your information
                        is protected until your next booking.</p>
                </div>
            </div>
        </div>

        <div class="bg-800 py-4 about-closing">
            <p class="motto"> By following these steps, you'll be able to navigate the Mega City Cab application smoothly
                and efficiently. Enjoy managing your bookings, and thank you for being part of the Mega City Cab team!</p>
        </div>

        <footer class="bg-800 text-white py-6">
            <div class="container mx-auto text-center">
                <p>&copy; 2025 Mega City Cab. All rights reserved.</p>
            </div>
        </footer>

    </body>
</html>
