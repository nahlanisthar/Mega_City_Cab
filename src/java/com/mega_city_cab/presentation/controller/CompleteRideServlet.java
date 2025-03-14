/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mega_city_cab.presentation.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.mega_city_cab.util.DBconnection;

/**
 *
 * @author Nahla
 */
@WebServlet(name = "CompleteRideServlet", urlPatterns = {"/CompleteRideServlet"})
public class CompleteRideServlet extends HttpServlet {

    private static Connection conn;  // Singleton Connection instance

    @Override
    public void init() throws ServletException {
        super.init();
        conn = DBconnection.getConnection(); // Initialize the singleton connection
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("Login.html");
            return;
        }

        // Retrieve data from session
        String userIdString = (String) session.getAttribute("user_id"); // Retrieve as String
        int userId = Integer.parseInt(userIdString); // Convert to Integer

        String name = (String) session.getAttribute("name");
        String phone = (String) session.getAttribute("phone");
        String pickupLocation = (String) session.getAttribute("pickup");
        String dropoffLocation = (String) session.getAttribute("dropoff");
        String vehicleType = (String) session.getAttribute("vehicle");
        String vehicleDetails = (String) session.getAttribute("vehicleDetails");
        int driverId = (Integer) session.getAttribute("driverId");
        String driverName = (String) session.getAttribute("driverName");

        String totalFareString = (String) session.getAttribute("fare"); // Retrieve as String
        totalFareString = totalFareString.replaceAll("[^0-9.]", ""); // Remove non-numeric characters
        Double totalFare = Double.valueOf(totalFareString); // Convert to Double

        String paymentMethod = (String) session.getAttribute("payment");
        String discountCoupon = request.getParameter("coupon");
        Object finalFareObj = session.getAttribute("finalFare");
        Double finalFare = (finalFareObj != null) ? Double.valueOf(finalFareObj.toString()) : null;

        System.out.println(userId);
        System.out.println(name);
        System.out.println(phone);
        System.out.println(pickupLocation);
        System.out.println(dropoffLocation);
        System.out.println(vehicleType);
        System.out.println(vehicleDetails);
        System.out.println(driverId);
        System.out.println(driverName);
        System.out.println(totalFare);
        System.out.println(paymentMethod);
        System.out.println(discountCoupon);
        System.out.println(finalFare);
        System.out.println("End");

        // Database connection and insertion
        try (PreparedStatement stmt = conn.prepareStatement("INSERT INTO ride_activity (user_id, name, phone, pickup_location, dropoff_location, vehicle_type, vehicle_details, driver_id, driver_name, total_fare, discount_coupon, final_fare, payment_type) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)")) {

            stmt.setInt(1, userId);
            stmt.setString(2, name);
            stmt.setString(3, phone);
            stmt.setString(4, pickupLocation);
            stmt.setString(5, dropoffLocation);
            stmt.setString(6, vehicleType);
            stmt.setString(7, vehicleDetails);
            stmt.setInt(8, driverId);
            stmt.setString(9, driverName);
            stmt.setDouble(10, totalFare);
            stmt.setString(11, discountCoupon);
            if (finalFare != null) {
                stmt.setDouble(12, finalFare);
            } else {
                stmt.setNull(12, java.sql.Types.DOUBLE);
            }
            stmt.setString(13, paymentMethod);
            stmt.executeUpdate();

            // Redirect to success page after successful insertion
            response.sendRedirect(request.getContextPath() + "/Pages/Dashboard.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            // Redirect to an error page in case of an exception
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('An Error Occurred. Please try again.');");
            out.println("window.location.href='Pages/Login.html';");
            out.println("</script>");
        }
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CompleteRideServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CompleteRideServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
