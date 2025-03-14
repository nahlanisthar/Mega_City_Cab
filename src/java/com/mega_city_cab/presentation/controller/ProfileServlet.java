/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mega_city_cab.presentation.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
import com.mega_city_cab.business.model.Customer;

/**
 *
 * @author Nahla
 */
@WebServlet(name = "ProfileServlet", urlPatterns = {"/ProfileServlet"})
public class ProfileServlet extends HttpServlet {

    private static Connection conn;  // Singleton Connection instance

    @Override
    public void init() throws ServletException {
        super.init();
        conn = DBconnection.getConnection(); // Initialize the singleton connection
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user_id") == null) {
            response.sendRedirect(request.getContextPath() + "/Pages/Login.html");
            return;
        }

        int userId = Integer.parseInt((String) session.getAttribute("user_id"));

        String getCustomerSQL = "SELECT c.customer_id, c.name, c.email, c.nic, c.phone "
                + "FROM customers c "
                + "INNER JOIN users u ON c.customer_id = u.customer_id "
                + "WHERE u.user_id = ?";

        try (PreparedStatement stmt = conn.prepareStatement(getCustomerSQL);) {

            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                Customer customer = new Customer(
                        rs.getInt("customer_id"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("nic"),
                        rs.getString("phone")
                );

                session.setAttribute("customer", customer);
                session.setAttribute("customer_id", rs.getInt("customer_id"));
                response.sendRedirect(request.getContextPath() + "/Pages/MyProfile.jsp");
            } else {  
                response.sendRedirect(request.getContextPath() + "/Pages/Login.html");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } 
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("customer_id") == null) {
            response.sendRedirect(request.getContextPath() + "/Pages/Login.html");
            return;
        }

        int customerId = (int) session.getAttribute("customer_id");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String nic = request.getParameter("nic");
        String phone = request.getParameter("phone");

        String updateSQL = "UPDATE customers SET name = ?, email = ?, nic = ?, phone = ? WHERE customer_id = ?";

        try (PreparedStatement stmt = conn.prepareStatement(updateSQL);) {

            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, nic);
            stmt.setString(4, phone);
            stmt.setInt(5, customerId);
            int rowsUpdated = stmt.executeUpdate();

            if (rowsUpdated > 0) {
                Customer updatedCustomer = new Customer(customerId, name, email, nic, phone);
                session.setAttribute("customer", updatedCustomer);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect(request.getContextPath() + "/Pages/MyProfile.jsp");
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
            out.println("<title>Servlet ProfileServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProfileServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
