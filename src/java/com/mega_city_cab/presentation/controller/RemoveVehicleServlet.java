/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mega_city_cab.presentation.controller;

import com.mega_city_cab.util.DBconnection;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author Nahla
 */
@WebServlet(name = "RemoveVehicleServlet", urlPatterns = {"/RemoveVehicleServlet"})
public class RemoveVehicleServlet extends HttpServlet {

    private static Connection conn;  // Singleton Connection instance

    @Override
    public void init() throws ServletException {
        super.init();
        conn = DBconnection.getConnection(); // Initialize the singleton connection
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String vehicle_number = request.getParameter("vehicleNumber");

        String sql = "DELETE FROM vehicles WHERE vehicle_number=?";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, vehicle_number);
            stmt.executeUpdate();

            response.sendRedirect(request.getContextPath() + "/ViewVehiclesServlet");
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
            out.println("<title>Servlet RemoveVehicleServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RemoveVehicleServlet at " + request.getContextPath() + "</h1>");
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
