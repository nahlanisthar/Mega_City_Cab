/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mega_city_cab.business.model;

/**
 *
 * @author Nahla
 */
public class Customer {

    private String name, email, nic, phone;
    private int customer_id;

    public Customer(int customer_id, String name, String email, String nic, String phone) {
        // Validate name
        if (name == null || name.trim().isEmpty()) {
            throw new IllegalArgumentException("Name cannot be null or empty.");
        }

        // Validate email format
        if (email == null || !email.matches("^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$")) {
            throw new IllegalArgumentException("Invalid email format.");
        }

        // Validate phone number (must be exactly 10 digits)
        if (phone == null || phone.length() != 10 || !phone.matches("[0-9]+")) {
            throw new IllegalArgumentException("Phone number must be 10 digits.");
        }

        // Validate NIC
        if (nic == null || !nic.matches("^[0-9]{11}[Vv]$") && !nic.matches("^[0-9]{12}$")) {
            throw new IllegalArgumentException("Invalid NIC format. NIC should be exactly 12 digits or 11 digits followed by a V.");
        }
        
        this.customer_id = customer_id;
        this.name = name;
        this.email = email;
        this.nic = nic;
        this.phone = phone;
    }

    public int getId() {
        return customer_id;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getNic() {
        return nic;
    }

    public String getPhone() {
        return phone;
    }
}
