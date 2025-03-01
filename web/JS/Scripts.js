/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

//book a ride
//progress
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
    }

    function updateProgressBar(stepIndex) {
        const totalSteps = progressSteps.length - 1;
        const progressPercent = (stepIndex / totalSteps) * 100;
        progressBar.style.width = `${progressPercent}%`;
    }

    window.nextStep = function () {
        if (currentStep === 0) {
            const pickup = document.getElementById("pickup").value;
            const dropoff = document.getElementById("dropoff").value;
            const city1 = document.getElementById("city1").value;
            const city2 = document.getElementById("city2").value;

            if (!pickup || !dropoff || !city1 || !city2) {
                alert("Please fill in all required fields.");
                return;
            }
        } else if (currentStep === 1) {
            const selectedVehicle = document.getElementById("selectedVehicleInput").value;
            if (!selectedVehicle) {
                alert("Please select a vehicle type.");
                return;
            }
        } else if (currentStep === 2) {
            const paymentOption = document.getElementById("payment").value;
            if (!paymentOption) {
                alert("Please select a payment option.");
                return;
            }

            // Check for Card Payment Fields
            if (paymentOption === "Card") {
                const cardNumber = document.getElementById("cardNumber").value;
                const expiry = document.getElementById("expiry").value;
                const cvv = document.getElementById("cvv").value;

                if (!cardNumber || !expiry || !cvv) {
                    alert("Please fill in all card payment fields.");
                    return;
                }

                // Additional card validation example
                if (cardNumber.length !== 19 || !/^\d{4}-\d{4}-\d{4}-\d{4}$/.test(cardNumber)) {
                    alert("Please enter a valid card number in the format XXXX-XXXX-XXXX-XXXX.");
                    return;
                }

                if (cvv.length !== 3 || isNaN(cvv)) {
                    alert("Please enter a valid CVV.");
                    return;
                }
            }

            // Check for Mobile Payment Fields
            if (paymentOption === "Mobile") {
                const mobileNumber = document.getElementById("mobileNumber").value;

                if (!mobileNumber) {
                    alert("Please fill in your mobile wallet number.");
                    return;
                }

                // Additional mobile number validation example
                if (!/^\+94\d{9}$/.test(mobileNumber)) {
                    alert("Please enter a valid mobile wallet number in the format +94XXXXXXXXX.");
                    return;
                }
            }
        }

        if (currentStep < steps.length - 1) {
            currentStep++;
            showStep(currentStep);
            updateConfirmation();
        }
    };

    window.prevStep = function () {
        if (currentStep > 0) {
            currentStep--;
            showStep(currentStep);
        }
    };

    showStep(currentStep);

    function updateConfirmation() {
        document.getElementById("confirmVehicle").textContent = document.getElementById("selectedVehicleInput").value;
        document.getElementById("confirmPickup").textContent = document.getElementById("pickup").value;
        document.getElementById("confirmDropoff").textContent = document.getElementById("dropoff").value;
        document.getElementById("confirmPayment").textContent = document.getElementById("payment").value;
    }
});


//logout
function confirmLogout() {
    let confirmAction = confirm("Are you sure you want to logout?");
    if (confirmAction) {
        window.location.href = "LogoutServlet"; // Redirect to logout servlet
        return true; // Continue execution
    }
    return false; // Stop execution if canceled
}
