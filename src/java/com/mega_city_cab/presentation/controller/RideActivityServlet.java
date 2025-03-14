/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mega_city_cab.presentation.controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.mega_city_cab.util.DBconnection;
import com.mega_city_cab.business.model.Ride;

/**
 *
 * @author Nahla
 */
@WebServlet(name = "RideActivity", urlPatterns = {"/RideActivity"})
public class RideActivityServlet extends HttpServlet {

    private static Connection conn;  // Singleton Connection instance

    @Override
    public void init() throws ServletException {
        super.init();
        conn = DBconnection.getConnection(); // Initialize the singleton connection
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int userId = Integer.parseInt(request.getParameter("user_id")); // Ensure user_id is stored in session

        System.out.println("✅ Retrieved user_id from session: " + userId);

        List<Ride> rideHistory = new ArrayList<>();

        // SQL query to fetch ride history for the logged-in user
        String sql = "SELECT ride_id, name, phone, pickup_location, dropoff_location, vehicle_type, "
                + "vehicle_details, driver_id, driver_name, total_fare, discount_coupon, final_fare, "
                + "payment_type, ride_timestamp FROM ride_activity WHERE user_id = ? ORDER BY ride_timestamp DESC";

        try (PreparedStatement stmt = conn.prepareStatement(sql)){
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Ride ride = new Ride(
                        rs.getInt("ride_id"),
                        userId,
                        rs.getString("name"),
                        rs.getString("phone"),
                        rs.getString("pickup_location"),
                        rs.getString("dropoff_location"),
                        rs.getString("vehicle_type"),
                        rs.getString("vehicle_details"),
                        rs.getInt("driver_id"),
                        rs.getString("driver_name"),
                        rs.getDouble("total_fare"),
                        rs.getString("discount_coupon"),
                        rs.getDouble("final_fare"),
                        rs.getString("payment_type"),
                        rs.getTimestamp("ride_timestamp")
                );
                rideHistory.add(ride);
            }

            session.setAttribute("rideHistory", rideHistory);

            System.out.println("✅ Total Rides Retrieved: " + rideHistory.size());
            for (Ride ride : rideHistory) {
                System.out.println("Ride ID: " + ride.getRideId() + ", Pickup: " + ride.getPickupLocation());
            }

            response.sendRedirect(request.getContextPath() + "/Pages/RideActivity.jsp");

        } catch (Exception e) {
            e.printStackTrace();
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
            out.println("<title>Servlet RideActivity</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RideActivity at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
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
