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
    private String username, password;
    private int customerId;

    public User(String username, String password, int customerId) {
        this.username = username;
        this.password = password;
        this.customerId = customerId;
    }

    public String getUsername() { return username; }
    public String getPassword() { return password; }
    public int getcustomerId() { return customerId; }
}

