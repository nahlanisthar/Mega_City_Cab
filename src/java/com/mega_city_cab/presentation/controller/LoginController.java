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
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.annotation.WebServlet;
import com.mega_city_cab.persistence.dao.UserDAO;

/**
 *
 * @author Nahla
 */

@WebServlet("/login")
public class LoginController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserDAO userDAO = new UserDAO();
        boolean isValidUser = userDAO.validateUser(username, password);
        if (isValidUser) {
            String customerName = userDAO.getCustomerNameByUsername(username);

            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("name", customerName);
            session.setAttribute("loggedIn", true);
            session.setMaxInactiveInterval(60 * 60); // 1 hour session timeout

            response.sendRedirect(request.getContextPath() + "/Pages/Dashboard.jsp");
        } else {
                try (PrintWriter out = response.getWriter()) {
                    out.println("<script>");
                    out.println("alert('Invalid Username or Password. Please try again');");
                    out.println("window.location.href='Pages/Login.html';");
                    out.println("</script>");
                }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("Login.html"); // Show login page on GET request
    }

    @Override
    public String getServletInfo() {
        return "Login Controller Servlet";
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
            out.println("<title>Servlet LoginController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

}
