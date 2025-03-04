/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mega_city_cab.presentation.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.mega_city_cab.util.DBconnection;
import java.io.PrintWriter;

/**
 *
 * @author Nahla
 */
@WebServlet(name = "AssignDriverServlet", urlPatterns = {"/AssignDriverServlet"})
public class AssignDriverServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String vehicleType = (String) session.getAttribute("vehicle");
        System.out.println("Vehicle Type from Session: " + vehicleType);

        if (vehicleType == null) {
            System.out.println("ERROR: vehicleType is NULL in session!");
        }

        try {
            Connection conn = DBconnection.getConnection();

            // Step 1: Retrieve available driver and vehicle
            String sql = "SELECT v.vehicle_number, v.vehicle_name, v.vehicle_model, d.driver_id, d.driver_name, d.phone "
                    + "FROM vehicles v "
                    + "JOIN drivers d ON v.driver_id = d.driver_id "
                    + "WHERE v.vehicle_type = ? AND d.status = 'Available' "
                    + "ORDER BY RAND() LIMIT 1";

            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, vehicleType);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String vehicleNumber = rs.getString("vehicle_number");
                String vehicleName = rs.getString("vehicle_name");
                String vehicleModel = rs.getString("vehicle_model");
                int driverId = rs.getInt("driver_id");
                String driverName = rs.getString("driver_name");
                String driverPhone = rs.getString("phone");

                System.out.println("✅ Driver Found: " + driverName + " (ID: " + driverId + ")");
                System.out.println("✅ Vehicle Found: " + vehicleNumber + ", " + vehicleName + " - " + vehicleModel);

                session.setAttribute("vehicleDetails", vehicleNumber + ", " + vehicleName + " - " + vehicleModel);
                session.setAttribute("driverId", driverId);
                session.setAttribute("driverName", driverName);
                session.setAttribute("driverPhone", driverPhone);

                response.sendRedirect(request.getContextPath() + "/Pages/Ride.jsp");
            } else {
                System.out.println("❌ No available drivers found for vehicle type: " + vehicleType);
                response.getWriter().write("No available drivers for this vehicle type.");
            }
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
            out.println("<title>Servlet AssignDriverServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AssignDriverServlet at " + request.getContextPath() + "</h1>");
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
