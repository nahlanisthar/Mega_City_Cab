/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mega_city_cab.persistence.dao;

/**
 *
 * @author Nahla
 */
import com.mega_city_cab.business.model.User;
import com.mega_city_cab.util.DBconnection;
import java.sql.*;

public class UserDAO {

    private static final Connection conn = DBconnection.getConnection(); // Singleton Connection instance

    public boolean isUsernameTaken(String username) {
        String query = "SELECT username FROM users WHERE username = ?";
        try (PreparedStatement pst = conn.prepareStatement(query)) {
            pst.setString(1, username);
            ResultSet rs = pst.executeQuery();
            return rs.next(); // True if username exists
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean addUser(User user) {
        String query = "INSERT INTO users (username, password, customer_id) VALUES (?, ?, ?)";
        try (PreparedStatement pst = conn.prepareStatement(query)) {
            pst.setString(1, user.getUsername());
            pst.setString(2, user.getPassword());
            pst.setInt(3, user.getcustomerId());
            return pst.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean validateUser(String username, String password) {
        String query = "SELECT * FROM users WHERE username = ? AND password = ?";
        try (PreparedStatement pst = conn.prepareStatement(query)) {
            pst.setString(1, username);
            pst.setString(2, password);
            ResultSet rs = pst.executeQuery();
            return rs.next(); // Returns true if valid credentials
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public String getCustomerNameByUsername(String username) {
        String query = "SELECT c.name FROM customers c "
                + "JOIN users u ON c.customer_id = u.customer_id "
                + "WHERE u.username = ?";
        try (PreparedStatement pst = conn.prepareStatement(query)) {
            pst.setString(1, username);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                return rs.getString("name");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public String getContactByUsername(String username) {
        String query = "SELECT c.phone FROM customers c "
                + "JOIN users u ON c.customer_id = u.customer_id "
                + "WHERE u.username = ?";
        try (PreparedStatement pst = conn.prepareStatement(query)) {
            pst.setString(1, username);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                return rs.getString("phone");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public String getIdByUsername(String username) {
        String query = "SELECT user_id FROM users WHERE username = ?";
        try (PreparedStatement pst = conn.prepareStatement(query)) {
            pst.setString(1, username);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                return rs.getString("user_id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
