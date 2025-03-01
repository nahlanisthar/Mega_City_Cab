<%-- 
    Document   : BookARide
    Created on : Feb 18, 2025, 11:53:03 PM
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
        <title>Book A Ride</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" type="text/css" href="../CSS/Styles.css">
        <script src="../JS/Scripts.js"></script>
    </head>
    <body>
        <header class="bg-600 py-4">
            <div class="container mx-auto flex justify-between items-center">
                <h1 class="headtag">Mega City Cab</h1>
                <div>
                    <a href="Logout.jsp" class="login" onclick="return confirmLogout()" >Log Out</a>
                </div>
            </div>
        </header>
        <nav class="bg-800 py-4">
        </nav>
        <button id="homeButton" class="btn btn-danger exit-btn">Exit</button>
        <div class="container mt-5">
            <div class="progressbar">
                <div class="progress" id="progress"></div>
                <div class="progress-step progress-step-active" data-title="Vehicle">1</div>
                <div class="progress-step" data-title="Customer">2</div>
                <div class="progress-step" data-title="Destination">3</div>
                <div class="progress-step" data-title="Payment">4</div>
            </div>
        </div>

        <div class="container set-height">
            <div>
                <p class="motto-2">Please follow these steps to seamlessly book your ride with Mega City Cab.</p>
            </div>
            <div class="card-body">
                <form id="bookingForm" method="POST" action="/Mega_City_Cab/BookingController">
                    <!-- Step 1: Input Destination -->
                    <div class="step active" id="step1">
                        <div class="row align-items-center">
                            <!-- Right Column: Welcome Text -->
                            <div class="col-md-6">
                                <h1 class="chooseus">Step 1: Enter Location</h1>
                                <label for="pickup" class="head-form-label">Pickup Location</label>
                                <div class="row mb-3">
                                    <div class="col-md-2">
                                        <label for="houseNo" class="book-form-label">House No.</label>
                                        <input type="text" class="form-control" id="houseNo" name="houseNo" required>
                                    </div>
                                    <div class="col-md-5">
                                        <label for="street" class="book-form-label">Street Name</label>
                                        <input type="text" class="form-control" id="pickup" name="pickup" required>
                                    </div>
                                    <div class="col-md-5">
                                        <label for="city" class="book-form-label">City</label>
                                        <select class="form-select" id="city1" name="city" required>
                                            <option value=""></option>
                                            <option value="Fort">Fort</option>
                                            <option value="Slave Island">Slave Island</option>
                                            <option value="Kollupitiya">Kollupitiya</option>
                                            <option value="Bambalapitiya">Bambalapitiya</option>
                                            <option value="Havelock Town">Havelock Town</option>
                                            <option value="Wellawatta">Wellawatta</option>
                                            <option value="Cinnamon Gardens">Cinnamon Gardens</option>
                                            <option value="Borella">Borella</option>
                                            <option value="Dematagoda">Dematagoda</option>
                                            <option value="Dehiwala">Dehiwala</option>
                                        </select>
                                    </div>
                                </div>

                                <label for="dropoff" class="head-form-label">Drop-off Location</label>
                                <div class="row mb-3">
                                    <div class="col-md-2">
                                        <label for="houseNo" class="book-form-label">House No.</label>
                                        <input type="text" class="form-control" id="houseNo" name="houseNo" required>
                                    </div>
                                    <div class="col-md-5">
                                        <label for="street" class="book-form-label">Street Name</label>
                                        <input type="text" class="form-control" id="dropoff" name="dropoff" required>
                                    </div>
                                    <div class="col-md-5">
                                        <label for="city" class="book-form-label">City</label>
                                        <select class="form-select" id="city2" name="city" required>
                                            <option value=""></option>
                                            <option value="Fort">Fort</option>
                                            <option value="Slave Island">Slave Island</option>
                                            <option value="Kollupitiya">Kollupitiya</option>
                                            <option value="Bambalapitiya">Bambalapitiya</option>
                                            <option value="Havelock Town">Havelock Town</option>
                                            <option value="Wellawatta">Wellawatta</option>
                                            <option value="Cinnamon Gardens">Cinnamon Gardens</option>
                                            <option value="Borella">Borella</option>
                                            <option value="Dematagoda">Dematagoda</option>
                                            <option value="Dehiwala">Dehiwala</option>
                                        </select>
                                    </div>
                                </div>
                                <button type="button" class="btn next-btn" onclick="nextStep()">Next</button>
                            </div>
                            <!-- Left Column: Image -->
                            <div class="col-md-6">
                                <img src="../Assets/Images/location (2).png" alt="login Image" class="mx-auto w-75 h-auto">
                            </div>
                        </div>
                    </div>


                    <!-- Step 2: Select Vehicle -->
                    <div class="step" id="step2">
                        <h1 class="chooseus">Step 2: Select Vehicle Type</h1>
                        <div class="piccontainer">
                            <div class="card" onclick="selectVehicle('Bike')">
                                <div class="image-section">
                                    <img src="../Assets/Images/bike.jpg" class="bike-img" alt="bike">
                                </div>
                                <div class="content">
                                    <h3 class="vehicle-type">Bike</h3>
                                    <p class="person">1 Person</p>
                                    <p id="bike_fare" class="price">Price: $0.00</p>
                                </div>
                            </div>
                            <div class="card" onclick="selectVehicle('Tuk')">
                                <div class="image-section">
                                    <img src="../Assets/Images/tuk.jpg" alt="tuk">
                                </div>
                                <div class="content">
                                    <h3 class="vehicle-type">Tuk</h3>
                                    <p class="person">3 People</p>
                                    <p id="tuk_fare" class="price">Price: $0.00</p>
                                </div>
                            </div>
                            <div class="card" onclick="selectVehicle('Car')">
                                <div class="image-section">
                                    <img src="../Assets/Images/car.jpg" alt="car">
                                </div>
                                <div class="content">
                                    <h3 class="vehicle-type">Car</h3>
                                    <p class="person">4 People</p>
                                    <p id="car_fare" class="price">Price: $0.00</p>
                                </div>
                            </div>
                            <div class="card" onclick="selectVehicle('Mini Van')">
                                <div class="image-section">
                                    <img src="../Assets/Images/minivan.jpg" alt="minivan">
                                </div>
                                <div class="content">
                                    <h3 class="vehicle-type">Mini Van</h3>
                                    <p class="person">6 People</p>
                                    <p id="minivan_fare" class="price">Price: $0.00</p>
                                </div>
                            </div>
                            <div class="card" onclick="selectVehicle('Van')">
                                <div class="image-section">
                                    <img src="../Assets/Images/van.jpg" alt="van" class="van-img">
                                </div>
                                <div class="content">
                                    <h3 class="vehicle-type">Van</h3>
                                    <p class="person">10 People</p>
                                    <p id="van_fare" class="price">Price: $0.00</p>
                                </div>
                            </div>
                        </div>
                        <div class="selection-label" id="selectedVehicle">You selected:</div>
                        <input type="hidden" name="selectedVehicle" id="selectedVehicleInput">
                        <button type="button" class="btn back-btn" onclick="prevStep()">Back</button>
                        <button type="button" class="btn next-btn" onclick="nextStep()">Next</button>
                    </div>

                    <script>
                        function selectVehicle(vehicle) {
                            document.getElementById('selectedVehicle').innerText = 'You selected: ' + vehicle;
                            document.getElementById('selectedVehicleInput').value = vehicle;
                        }
                    </script>


                    <!-- Step 3: Choose Payment Plan -->
                    <div class="step" id="step3">
                        <div class="row align-items-center">
                            <!-- Right Column: Welcome Text -->
                            <div class="col-md-6">
                                <h1 class="chooseus">Step 3: Choose Payment Plan</h1>
                                <div class="">
                                    <label for="payment" class="pay-form-label">Payment Option</label>
                                    <select class="form-select" id="payment" name="payment" required onchange="togglePaymentFields()">
                                        <option value="Cash">Cash</option>
                                        <option value="Card">Credit/Debit Card</option>
                                        <option value="Mobile">Mobile Payment</option>
                                    </select>
                                </div>

                                <!-- Card Payment Fields -->
                                <div id="cardPaymentFields" style="display: none;">
                                    <h6 class="paytype-form-label">Card Details</h6>
                                    <div class="mb-2">
                                        <label for="cardNumber" class="paydetails-form-label">Card Number</label>
                                        <input type="text" class="form-control" id="cardNumber" placeholder="XXXX-XXXX-XXXX-XXXX">
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <label for="expiry" class="paydetails-form-label">Expiry Date</label>
                                            <input type="month" class="form-control" id="expiry">
                                        </div>
                                        <div class="col">
                                            <label for="cvv" class="paydetails-form-label">CVV</label>
                                            <input type="text" class="form-control" id="cvv" placeholder="XXX">
                                        </div>
                                    </div>
                                </div>

                                <!-- Mobile Payment Fields -->
                                <div id="mobilePaymentFields" style="display: none;">
                                    <h6 class="paytype-form-label">Mobile Payment Details</h6>
                                    <div class="mb-2">
                                        <label for="mobileNumber" class="paydetails-form-label">Mobile Wallet Number</label>
                                        <input type="text" class="form-control" id="mobileNumber" placeholder="+94XXXXXXXXX">
                                    </div>
                                </div>
                                <button type="button" class="btn back-btn" onclick="prevStep()">Back</button>
                                <button type="button" class="btn next-btn" onclick="nextStep()">Next</button>
                            </div>

                            <!-- Left Column: Image -->
                            <div class="col-md-6">
                                <img src="../Assets/Images/payment.jpg" alt="login Image" class="mx-auto w-50 h-auto">
                            </div>
                        </div>
                    </div>

                    <script>
                        function togglePaymentFields() {
                            let paymentMethod = document.getElementById("payment").value;
                            let cardFields = document.getElementById("cardPaymentFields");
                            let mobileFields = document.getElementById("mobilePaymentFields");

                            // Hide all fields initially
                            cardFields.style.display = "none";
                            mobileFields.style.display = "none";

                            if (paymentMethod === "Card") {
                                cardFields.style.display = "block";
                            } else if (paymentMethod === "Mobile") {
                                mobileFields.style.display = "block";
                            }
                        }
                    </script>

                    <!-- Step 4: Confirm and Submit -->
                    <div class="step" id="step4">
                        <div class="row align-items-center">
                            <!-- Right Column: Welcome Text -->
                            <div class="col-md-6">
                                <h1 class="chooseus">Step 4: Confirm and Submit</h1>
                                <p><span class="head-form-label">Vehicle:</span> <span class="value" id="confirmVehicle"></span></p>
                                <p><span class="head-form-label">Name:</span> <span class="value"><%= session.getAttribute("name")%></span></p>
                                <p><span class="head-form-label">Phone Number:</span> <span class="value"><%= session.getAttribute("phone")%></span></p>
                                <p><span class="head-form-label">Pickup Location:</span> <span class="value" id="confirmPickup"></span></p>
                                <p><span class="head-form-label">Drop-off Location:</span> <span class="value" id="confirmDropoff"></span></p>
                                <p><span class="head-form-label">Payment Plan:</span> <span class="value" id="confirmPayment"></span></p>
                                <button type="button" class="btn back-btn" onclick="prevStep()">Back</button>
                                <button type="submit" id="confirmbutton" class="btn confirm-btn">Confirm Booking</button>
                            </div>
                            <div class="col-md-6">
                                <img src="../Assets/Images/confirm.jpg" alt="login Image" class="mx-auto w-50 h-auto">
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <footer class="bg-800 text-white py-6">
            <div class="container mx-auto text-center">
                <p>&copy; 2025 Mega City Cab. All rights reserved.</p>
            </div>
        </footer>

        <script>
            document.getElementById("homeButton").addEventListener("click", function (event) {
                let confirmExit = confirm("Are you sure you want to exit?");
                if (confirmExit) {
                    window.location.href = "Dashboard.jsp";
                }
                // If the user clicks "Cancel", do nothing (stay on the same page)
            });
        </script>

    </body>
</html>

