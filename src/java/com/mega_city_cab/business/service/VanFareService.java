/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mega_city_cab.business.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Nahla
 */
public class VanFareService implements FareService{

    @Override
    public double getFare(Connection conn, String pickup, String dropoff) throws Exception {
        return fetchFare(conn, "van_fare", pickup, dropoff);
    }

    private double fetchFare(Connection conn, String tableName, String pickup, String dropoff) throws Exception {
        String query = "SELECT fare FROM " + tableName + " WHERE pickup = ? AND dropoff = ?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, pickup);
            stmt.setString(2, dropoff);
            ResultSet rs = stmt.executeQuery();
            return rs.next() ? rs.getDouble("fare") : 0.0;
        }
    }
}
