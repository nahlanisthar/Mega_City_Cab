/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mega_city_cab.presentation.controller;

import com.mega_city_cab.util.DBconnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Nahla
 */
@WebServlet(name = "ApplyCouponServlet", urlPatterns = {"/ApplyCouponServlet"})
public class ApplyCouponServlet extends HttpServlet {

    private void processCoupon(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        try {
            String couponCode = request.getParameter("coupon");
            String fareStr = request.getParameter("fare").replace("LKR ", "").trim();
            double fare = Double.parseDouble(fareStr);
            int userId = Integer.parseInt(request.getParameter("user_id"));

            Connection conn = DBconnection.getConnection();

            // Check if coupon exists
            String query = "SELECT discount_percentage, validity_condition FROM coupons WHERE code = ?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, couponCode);
            ResultSet rs = pstmt.executeQuery();

            if (!rs.next()) {
                out.println("{\"success\": false, \"message\": \"Invalid coupon code!\"}");
                return;
            }

            double discountPercentage = rs.getDouble("discount_percentage");
            String validityCondition = rs.getString("validity_condition");

            // Check if user already used the coupon
            String checkUsedQuery = "SELECT * FROM used_coupons WHERE user_id = ? AND coupon_code = ?";
            PreparedStatement usedStmt = conn.prepareStatement(checkUsedQuery);
            usedStmt.setInt(1, userId);
            usedStmt.setString(2, couponCode);
            ResultSet usedRs = usedStmt.executeQuery();

            if (usedRs.next()) {
                out.println("{\"success\": false, \"message\": \"You have already used this coupon!\"}");
                return;
            }

            // Check if coupon is valid (e.g., weekend only)
            if ("WEEKEND_ONLY".equals(validityCondition)) {
                java.util.Calendar calendar = java.util.Calendar.getInstance();
                int dayOfWeek = calendar.get(java.util.Calendar.DAY_OF_WEEK);
                if (dayOfWeek != java.util.Calendar.SATURDAY && dayOfWeek != java.util.Calendar.SUNDAY) {
                    out.println("{\"success\": false, \"message\": \"This coupon is valid only on weekends!\"}");
                    return;
                }
            }

            // Calculate final fare
            double discountAmount = fare * (discountPercentage / 100.0);
            double finalFare = fare - discountAmount;

            // Save used coupon
            String insertUsedCoupon = "INSERT INTO used_coupons (user_id, coupon_code) VALUES (?, ?)";
            PreparedStatement insertStmt = conn.prepareStatement(insertUsedCoupon);
            insertStmt.setInt(1, userId);
            insertStmt.setString(2, couponCode);
            insertStmt.executeUpdate();

            session.setAttribute("finalFare", finalFare);

            // Return the final fare as JSON response
            out.println("{\"success\": true, \"finalFare\": \"" + finalFare + "\"}");

        } catch (Exception e) {
            e.printStackTrace();
            out.println("{\"success\": false, \"message\": \"An error occurred\"}");
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
            out.println("<title>Servlet ApplyCouponServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ApplyCouponServlet at " + request.getContextPath() + "</h1>");
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
        processCoupon(request, response);
    }

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
        processCoupon(request, response);
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
