/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mega_city_cab.presentation.controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.WebServlet;

import com.mega_city_cab.persistence.dao.CustomerDAO;
import com.mega_city_cab.persistence.dao.UserDAO;
import com.mega_city_cab.business.model.Customer;
import com.mega_city_cab.business.model.User;

/**
 *
 * @author Nahla
 */
@WebServlet("/register")
public class RegisterationController extends HttpServlet {

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String nic = request.getParameter("nic");
        String phone = request.getParameter("phone");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Customer customer = new Customer(name, email, nic, phone);
        CustomerDAO customerDAO = new CustomerDAO();

        int customerId = customerDAO.addCustomer(customer);

        if (customerId > 0) {
            User user = new User(username, password, customerId);
            UserDAO userDAO = new UserDAO();

            if (userDAO.addUser(user)) {
                response.sendRedirect(request.getContextPath() + "/Pages/Login.html");
            } else {
                // Display simple popup message and go back to registration
                response.setContentType("text/html");
                try (PrintWriter out = response.getWriter()) {
                    out.println("<script>");
                    out.println("alert('Registration Failed. Please Try Again Later.');");
                    out.println("window.location.href='register.html';");
                    out.println("</script>");
                }
            }
        } else {
            // Display simple popup message and go back to registration
                response.setContentType("text/html");
                try (PrintWriter out = response.getWriter()) {
                    out.println("<script>");
                    out.println("alert('There's something wrong at our end. Please bear with us and try again after a few minutes.');");
                    out.println("window.location.href='register.html';");
                    out.println("</script>");
                }
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterationController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterationController at " + request.getContextPath() + "</h1>");
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
