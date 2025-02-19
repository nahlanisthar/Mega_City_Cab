/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

//book a ride
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
        const progressPercent = (stepIndex / (steps.length - 1)) * 100;
        progressBar.style.width = `${progressPercent}%`;
    }

    function nextStep() {
        if (currentStep < steps.length - 1) {
            currentStep++;
            showStep(currentStep);
            updateConfirmation(); // Update confirmation values
        }
    }

    function prevStep() {
        if (currentStep > 0) {
            currentStep--;
            showStep(currentStep);
        }
    }

    function updateConfirmation() {
        document.getElementById("confirmVehicle").textContent = document.getElementById("vehicle").value;
        document.getElementById("confirmName").textContent = document.getElementById("name").value;
        document.getElementById("confirmAddress").textContent = document.getElementById("address").value;
        document.getElementById("confirmTelephone").textContent = document.getElementById("telephone").value;
        document.getElementById("confirmPickup").textContent = document.getElementById("pickup").value;
        document.getElementById("confirmDropoff").textContent = document.getElementById("dropoff").value;
        document.getElementById("confirmPayment").textContent = document.getElementById("payment").value;
    }

    // Initial state
    showStep(currentStep);

    // Attach event listeners to buttons
    document.querySelectorAll(".btn-primary").forEach((btn) => {
        btn.addEventListener("click", nextStep);
    });

    document.querySelectorAll(".btn-secondary").forEach((btn) => {
        btn.addEventListener("click", prevStep);
    });
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
