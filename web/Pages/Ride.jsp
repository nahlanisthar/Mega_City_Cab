<%-- 
    Document   : Ride
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

<%
    String vehicleDetails = (String) session.getAttribute("vehicleDetails");
    Integer driverId = (Integer) session.getAttribute("driverId");
    String driverName = (String) session.getAttribute("driverName");
    String driverPhone = (String) session.getAttribute("driverPhone");
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Book A Ride</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/js/all.min.js"></script>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" type="text/css" href="../CSS/Styles.css">
        <style>
            @keyframes drive {
                0% {
                    transform: translateX(-30px);
                }
                100% {
                    transform: translateX(37vw);
                }
            }


            @keyframes blink {
                0% {
                    opacity: 1;
                }
                50% {
                    opacity: 0.3;
                }
                100% {
                    opacity: 1;
                }
            }

            @keyframes bounce {
                0%, 100% {
                    transform: translateX(-50%) translateY(0);
                }
                50% {
                    transform: translateX(-50%) translateY(-10px);
                }
            }

            /* Smooth Car Movement */
            @keyframes moveCar {
                0% {
                    left: 10%;
                    top: 10%;
                }  /* Starting position */
                20% {
                    left: 20%;
                    top: 10%;
                } /* Moving towards user */
                40% {
                    left: 40%;
                    top: 30%;
                }
                60% {
                    left: 50%;
                    top: 50%;
                }
                80% {
                    left: 65%;
                    top: 70%;
                }
                100% {
                    left: 40%;
                    top: 75%;
                } /* Final position near user */
            }

            @keyframes startRide {
                0% {
                    left: 40%;
                    top: 75%;
                }  /* Starting position */
                20% {
                    left: 50%;
                    top: 70%;
                } /* Moves right & up */
                40% {
                    left: 45%;
                    top: 55%;
                } /* Moves left & up */
                60% {
                    left: 50%;
                    top: 35%;
                } /* Moves left again */
                80% {
                    left: 55%;
                    top: 15%;
                } /* Moves left slightly */
                100% {
                    left: 70%;
                    top: 10%;
                } /* Final stop */

                /* Pulsing User Location */
                @keyframes pulse {
                    0% {
                        transform: scale(1);
                        opacity: 1;
                    }
                    50% {
                        transform: scale(1.2);
                        opacity: 0.7;
                    }
                    100% {
                        transform: scale(1);
                        opacity: 1;
                    }
                }

                @keyframes spin {
                    0% {
                        transform: rotate(0deg);
                    }
                    100% {
                        transform: rotate(360deg);
                    }
                }
            </style>
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
            <div class="container mt-5">
                <div class="progressbar">
                    <div class="progress" id="progress"></div>
                    <div class="progress-step progress-step-active" data-title="Vehicle">5</div>
                    <div class="progress-step" data-title="Customer">6</div>
                    <div class="progress-step" data-title="Destination">7</div>
                    <div class="progress-step" data-title="Payment">8</div>
                </div>
            </div>

            <div class="container set-height">
                <div>
                    <p class="motto-2">Please follow these steps to seamlessly book your ride with Mega City Cab.</p>
                </div>
                <div class="card-body">
                    <form id="bookingForm" method="POST" action="">

                        <!-- Step 5: Finding Driver -->
                        <div class="step active" id="step1" data-step="1">
                            <div class="row align-items-center">
                                <!-- Right Column: Welcome Text -->
                                <div class="col-md-6">
                                    <h1 class="chooseus">Step 5: Connecting you to a Driver</h1>
                                    <h4 class="find-text">Finding a Driver<span class="dots"><span>.</span><span>.</span><span>.</span></span></h4>
                                    <img src="../Assets/Images/car_rider.png" class="image" width="50" alt="Map Pin">
                                    <img src="../Assets/Images/car_rider.png" class="image-2" width="50" alt="Map Pin">
                                    <img src="../Assets/Images/car_rider.png" class="image-3" width="50" alt="Map Pin">
                                    <img src="../Assets/Images/car_rider.png" class="image-4" width="50" alt="Map Pin">
                                    <svg width="200" height="33"> 
                                    <div class="line"></div>
                                    </svg>
                                    <p id="statusText" class="status-text">Searching for nearby drivers...</p>

                                    <button type="button" class="btn btn-danger cancel" onclick="cancelRequest()">Cancel</button>
                                </div>
                                <!-- Left Column: Image -->
                                <div class="col-md-6 space">
                                    <div class="map-container">
                                        <img src="../Assets/Images/pin.png" class="map-pin" width="100" alt="Map Pin">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Step 6: Driver Found -->
                        <div class="step" id="step2" data-step="2">
                            <div class="row align-items-center">
                                <!-- Right Column: Welcome Text -->
                                <div class="col-md-6">
                                    <h1 class="chooseus">Step 6: Track your Driver</h1>
                                    <h4 class="head-form-label-driver mt-3">Driver Found!</h4>
                                    <p class="driver-values"><span class="driver-details-label">Driver ID: </span><span class="value" id=""><%= (driverId != null) ? driverId : "N/A"%></span></p>
                                    <p class="driver-values"><span class="driver-details-label">Driver Name:</span> <span class="value" id=""><%= (driverName != null) ? driverName : "Not Assigned"%></span></p>
                                    <p class="driver-values"><span class="driver-details-label">Phone Number:</span> <span class="value"><%= (driverPhone != null) ? driverPhone : "Not Available"%></span></p>
                                    <p class="driver-values"><span class="driver-details-label">Vehicle:</span> <span class="value" id=""><%= (vehicleDetails != null) ? vehicleDetails : "No vehicle assigned"%></span></p>
                                    <p id="arrivalText" class="arrival-text">🚕 Driver is 5 minutes away...</p>
                                    <button type="button" class="btn btn-danger cancel" onclick="cancelRequest()">Cancel</button>
                                    <button type="button" class="btn next-btn" id="start-trip" onclick="nextStep()">Start Trip</button>
                                </div>
                                <div class="col-md-6">
                                    <div class="map-driver-container">
                                        <img src="../Assets/Images/pickup_pin.png" class="user-pin" width="30" alt="User Pin">
                                        <img src="../Assets/Images/driver_pin.png" class="driver-icon" width="70" alt="Driver Car">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Step 7: Trip Tracker -->
                        <div class="step" id="step3" data-step="3">
                            <div class="row align-items-center">
                                <!-- Right Column: Welcome Text -->
                                <div class="col-md-6">
                                    <h1 class="chooseus">Step 7: Ride in Progress</h1>
                                    <p id="rideText" class="ride-text">🚕 Driver is 5 minutes away...</p>
                                    <button type="button" class="btn next-btn" id="end" onclick="nextStep()">Trip Completed!</button>
                                </div>
                                <div class="col-md-6 space">
                                    <div class="map-driver-container">
                                        <img src="../Assets/Images/pickup_pin.png" class="user-pin-2" width="30" alt="User Pin">
                                        <img src="../Assets/Images/driver_pin.png" class="driver-icon-2" width="70" alt="Driver Car">
                                        <img src="../Assets/Images/pin.png" class="end-pin" width="60" alt="End Pin">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Step 8: Process Payment -->
                        <div class="step" id="step4" data-step="4">
                            <div class="row align-items-center">
                                <!-- Right Column: Welcome Text -->
                                <div class="col-md-6">
                                    <h1 class="chooseus">Step 8: Payment</h1>
                                    <h4 class="head-form-label-driver mt-3">Total Fare: <span class="fare-value" id="selectedPaymentMethod"><%= session.getAttribute("fare")%></span></h4>
                                    <h4 class="head-form-label-driver mt-3">Selected Payment Method: <span class="payment-value" id="selectedPaymentMethod"><%= session.getAttribute("payment")%></span></h4>
                                    <label for="coupon" class="book-form-label">Enter Coupon / Discount code if any: </label>
                                    <input type="hidden" id="fare" name="fare" value="<%= session.getAttribute("fare")%>">
                                    <input type="hidden" id="userId" name="userId" value="<%= session.getAttribute("user_id")%>">
                                    <div class="row mb-2">
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" id="coupon" name="coupon">
                                        </div>
                                        <div class="col-md-4">
                                            <button type="button" class="btn btn-warning" onclick="applyCoupon()">Apply</button>
                                        </div>
                                    </div>
                                    <div id="finalfare" class="hidden">
                                        <label id="FareLabel" class="head-form-label-driver mt-3">Final Fare: <span class="fare-value" id="finalFareLabel">0.00</span></label>
                                    </div>
                                    <div id="pay-text" class="pay-text">
                                        <label class="book-form-label mt-3">Please pay the fare amount to your driver</label>
                                    </div>
                                    <div id="paymentButtonContainer" class="hidden mt-3">
                                        <button type="button" class="btn btn-success" id="processPayment">Process Payment</button>
                                    </div>
                                    <div id="loader" class="loader hidden"><span class="dots"><span>.</span><span>.</span><span>.</span><span>.</span><span>.</span></span></div>
                                    <div id="paymentMessage" class="payment-message hidden"></div>
                                    <div>
                                        <button type="submit" class="btn next-btn" id="end-trip">Finish!</button>
                                    </div>
                                </div>
                                <!-- Left Column: Image -->
                                <div class="col-md-6 space">
                                    <img src="../Assets/Images/payment.jpg" alt="login Image" class="mx-auto w-50 h-auto pay-img">
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
                sessionStorage.removeItem("redirected"); // Ensure redirection happens each time ride.jsp loads
                document.addEventListener("DOMContentLoaded", function () {
                    let lastRedirectTime = localStorage.getItem("lastRedirectTime");
                    let currentTime = new Date().getTime();

                    // Redirect only if more than 5 seconds have passed since the last redirect
                    if (!lastRedirectTime || (currentTime - lastRedirectTime > 5000)) {
                        localStorage.setItem("lastRedirectTime", currentTime);
                        window.location.replace("<%= request.getContextPath()%>/AssignDriverServlet");
                    }
                });

                //step 5
                let messages = [
                    "Finding the best driver for you...",
                    "Matching you with the closest ride...",
                    "Almost there! Assigning your driver..."
                ];
                let index = 0;
                setInterval(() => {
                    document.getElementById("statusText").textContent = messages[index];
                    index = (index) % messages.length; // Loop back to the first message
                }, 3000); // Change every 3 seconds

                function updateSearchStatus() {
                    if (index < messages.length) {
                        document.getElementById('statusText').textContent = messages[index++];
                    } else {
                        clearInterval(searchInterval);
                        connectToDriver();
                    }
                }

                function connectToDriver() {
                    document.getElementById('statusText').textContent = "";
                    document.querySelector('.map-container').classList.add('hidden');
                    document.getElementById('driverInfo').classList.remove('hidden');
                }

                function cancelRequest() {
                    alert("Your ride request has been canceled.");
                    window.location.href = "Dashboard.jsp";
                }

                let searchInterval = setInterval(updateSearchStatus, 3000); // Update every 3s


                //step 6
                let arrival_messages = [
                    "🚗 Driver is 5 minutes away...",
                    "🚗 Driver is 5 minutes away...",
                    "🚕 Driver is 3 minutes away...",
                    "📍 Driver is arriving...",
                    "✅ Driver has arrived!"
                ];
                let arrivalIndex = 0;
                let startTripBtn = document.getElementById("start-trip");
                // Disable "Start Trip" button initially
                //startTripBtn.disabled = true;
                // Function to update status messages every 3 seconds
                function updateStatus() {
                    if (arrivalIndex < arrival_messages.length) {
                        document.getElementById('arrivalText').textContent = arrival_messages[arrivalIndex++];
                    } else {
                        clearInterval(statusInterval); // Stop updating after the last message
                        clearInterval(animationInterval); // Stop animation when driver arrives
                        startTripBtn.disabled = false;
                    }
                }

                // Function to trigger driver animation every 1 second
                function moveDriver() {
                    let driverIcon = document.querySelector('.driver-icon');
                    driverIcon.style.animation = "moveCar 15s linear forwards";
                }

                // Start intervals
                let statusInterval = setInterval(updateStatus, 5000); // Update text every 3s
                let animationInterval = setInterval(moveDriver, 1000); // Animate driver every 1s



                //step 7
                let ride_messages = [
                    "🚗 Driver is on the way to your destination...",
                    "🚗 Driver is on the way to your destination...",
                    "🚗 Driver is on the way to your destination...",
                    "🚗 Driver is on the way to your destination...",
                    "🚗 Driver is on the way to your destination...",
                    "🚕 Approaching your destination...",
                    "📍 Almost there...",
                    "✅ You have arrived at your destination!"
                ];
                let rideIndex = 0;
                let endTripBtn = document.getElementById("end");
                // Disable "End Trip" button initially
                //endTripBtn.disabled = true;

                // Function to update status messages every 3 seconds
                function updateRideStatus() {
                    if (rideIndex < ride_messages.length) {
                        document.getElementById('rideText').textContent = ride_messages[rideIndex++];
                    } else {
                        clearInterval(statusInterval2); // Stop updating after the last message
                        clearInterval(animationInterval2); // Stop animation when driver arrives
                        endTripBtn.disabled = false;
                    }
                }

                // Function to trigger driver animation every 1 second
                function moveRideDriver() {
                    let driverIcon2 = document.querySelector('.driver-icon-2');
                    driverIcon2.style.animation = "startRide 15s linear forwards";
                }

                // Start intervals
                let statusInterval2 = setInterval(updateRideStatus, 6000); // Update text every 3s
                let animationInterval2 = setInterval(moveRideDriver, 1000); // Animate driver every 1s


                //step 8
                function applyCoupon() {
                    let couponCode = document.getElementById("coupon").value;
                    let fare = document.getElementById("fare").value;
                    let userId = document.getElementById("userId").value;

                    if (couponCode.trim() === "") {
                        alert("No coupon entered. Proceeding with full fare.");
                        return;
                    }

                    // Create AJAX request to send coupon details to ApplyCouponServlet
                    let xhr = new XMLHttpRequest();
                    xhr.open("GET", "<%= request.getContextPath()%>/ApplyCouponServlet?coupon=" + encodeURIComponent(couponCode) +
                            "&fare=" + encodeURIComponent(fare) + "&user_id=" + encodeURIComponent(userId), true);
                    xhr.onreadystatechange = function () {
                        if (xhr.readyState === 4 && xhr.status === 200) {
                            // Parse the response (final fare)
                            let response = JSON.parse(xhr.responseText);

                            // Update the final fare and show it in the UI
                            if (response.success) {
                                let finalFare = response.finalFare;
                                document.getElementById("finalfare").classList.remove("hidden");
                                document.getElementById("finalFareLabel").innerHTML = "LKR " + finalFare;
                                // Update session variable (optional)
                                sessionStorage.setItem("finalFare", finalFare);
                            } else {
                                alert(response.message);
                            }
                        }
                    };
                    xhr.send();
                }

                document.addEventListener("DOMContentLoaded", function () {
                    // Get the payment method from JSP
                    let paymentMethod = "<%= session.getAttribute("payment")%>";

                    // Convert to lowercase for case-insensitive comparison
                    paymentMethod = paymentMethod ? paymentMethod.toLowerCase() : "";

                    // Get the button container
                    let paymentButtonContainer = document.getElementById("paymentButtonContainer");
                    let paytextcontainer = document.getElementById("pay-text");
                    let finishbtn = document.getElementById("end-trip");

                    // Show button if payment is 'card' or 'mobile'
                    if (paymentMethod === "card" || paymentMethod === "mobile") {
                        paytextcontainer.classList.add("hidden");
                        paymentButtonContainer.classList.remove("hidden");
                        finishbtn.classList.add("disabled");
                    }
                });
                
                document.getElementById("processPayment").addEventListener("click", processPayment);
                
                function processPayment() {
                    // Show the loader and hide the payment button
                    document.getElementById("loader").classList.remove("hidden");
                    document.getElementById("paymentButtonContainer").classList.add("hidden");
                    document.getElementById("paymentMessage").classList.add("hidden"); // Hide any previous message

                    // Simulate payment processing
                    setTimeout(() => {
                        // Hide the loader
                        document.getElementById("loader").classList.add("hidden");

                        // Display the success message
                        document.getElementById("paymentMessage").textContent = "Payment Successful!";
                        document.getElementById("paymentMessage").classList.remove("hidden");
                        setTimeout(() => {
                            document.getElementById("end-trip").classList.remove("disabled");
                        }, 1000);
                    }, 4000);
                }

                document.addEventListener("DOMContentLoaded", function () {
                    let currentStep = 0;
                    const steps = document.querySelectorAll(".step");
                    const progressSteps = document.querySelectorAll(".progress-step");
                    const progressBar = document.getElementById("progress");
                    function showStep(stepIndex) {
                        steps.forEach((step, index) => {
                            step.classList.toggle("active", index === stepIndex);
                        });
                        progressSteps.forEach((progress, index) => {
                            progress.classList.toggle("progress-step-active", index <= stepIndex);
                        });
                        updateProgressBar(stepIndex);

                        // Auto-move to Step 6 after 5 seconds if Step 5 is displayed
                        if (stepIndex === 0) {
                            setTimeout(() => {
                                nextStep();
                            }, 10000);
                        }
                    }

                    function updateProgressBar(stepIndex) {
                        const totalSteps = progressSteps.length - 1;
                        const progressPercent = (stepIndex / totalSteps) * 100;
                        progressBar.style.width = progressPercent + '%';
                    }

                    window.nextStep = function () {
                        if (currentStep < steps.length - 1) {
                            currentStep++;
                            showStep(currentStep);
                        }
                    };
                    window.prevStep = function () {
                        if (currentStep > 0) {
                            currentStep--;
                            showStep(currentStep);
                        }
                    };
                    showStep(currentStep);
                });

                function confirmLogout() {
                    let activeStep = document.querySelector(".step.active"); // Find the active step

                    if (activeStep) {
                        let currentStep = parseInt(activeStep.getAttribute("data-step")); // Convert to number

                        if (currentStep === 3 || currentStep === 4) {
                            alert("Please complete your ride process before you logout.");
                            return false; // Prevent logout
                        }
                    }

                    let confirmAction = confirm("Are you sure you want to logout?");
                    if (confirmAction) {
                        window.location.href = "LogoutServlet"; // Redirect to logout servlet
                        return true; // Continue execution
                    }
                    return false; // Stop execution if canceled
                }
            </script>
        </body>
    </html>

