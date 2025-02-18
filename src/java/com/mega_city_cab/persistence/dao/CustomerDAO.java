/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mega_city_cab.persistence.dao;

/**
 *
 * @author Nahla
 */
import com.mega_city_cab.business.model.Customer;
import com.mega_city_cab.util.DBconnection;
import java.sql.*;

public class CustomerDAO {

    public int addCustomer(Customer customer) {
        try (Connection con = DBconnection.getConnection()) {
            String query = "INSERT INTO customers (name, email, nic, phone) VALUES (?, ?, ?, ?)";
            PreparedStatement pst = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            pst.setString(1, customer.getName());
            pst.setString(2, customer.getEmail());
            pst.setString(3, customer.getNic());
            pst.setString(4, customer.getPhone());

            int rows = pst.executeUpdate();
            if (rows > 0) {
                ResultSet rs = pst.getGeneratedKeys();
                if (rs.next()) {
                    return rs.getInt(1); // Return customer_id
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }
}
