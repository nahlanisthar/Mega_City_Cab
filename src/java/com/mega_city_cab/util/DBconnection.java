/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mega_city_cab.util;

/**
 *
 * @author Nahla
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

//singleton pattern//
public class DBconnection {

    private static final String URL = "jdbc:mysql://localhost:3306/mega_city_cab";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    private static Connection instance;

// Public method to provide a single instance of Connection
    public static synchronized Connection getConnection() {
        if (instance == null) { // Only create a new connection if one doesn't exist
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                instance = DriverManager.getConnection(URL, USER, PASSWORD);
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
            }
        }
        return instance;
    }
}
