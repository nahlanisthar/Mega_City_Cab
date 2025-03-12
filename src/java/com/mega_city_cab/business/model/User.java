/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mega_city_cab.business.model;

/**
 *
 * @author Nahla
 */
public class User {

    private int user_id;
    private String username, password;
    private int customerId;

    public User(int user_id, String username, String password, int customerId) {
        // Check if username or password is null and throw an exception
        if (username == null && password == null) {
            throw new IllegalArgumentException("Username and Password cannot be null");
        }
        if (username == null) {
            throw new IllegalArgumentException("Username cannot be null");
        }
        if (password == null) {
            throw new IllegalArgumentException("Password cannot be null");
        }

        this.user_id = user_id;
        this.username = username;
        this.password = password;
        this.customerId = customerId;
    }

    public int getUserId() {
        return user_id;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public int getcustomerId() {
        return customerId;
    }
}
