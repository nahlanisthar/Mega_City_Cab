/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mega_city_cab.business.model;

/**
 *
 * @author Nahla
 */
public class Driver {

    private int driver_id;
    private String driver_name, email, phone, nic, status;

    public Driver(int driver_id, String driver_name, String email, String nic, String phone, String status) {
                
        // Validate name 
        if (driver_name == null || driver_name.trim().isEmpty()) {
            throw new IllegalArgumentException("Name cannot be null or empty.");
        }

        // Validate email format
        if (email == null || !email.matches("^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$")) {
            throw new IllegalArgumentException("Invalid email format.");
        }
        
        // Validate NIC 
        if (nic == null || !nic.matches("^[0-9]{11}[Vv]$") && !nic.matches("^[0-9]{12}$")) {
            throw new IllegalArgumentException("Invalid NIC format. NIC should be exactly 12 digits or 11 digits followed by a V.");
        }

        // Validate phone number 
        if (phone == null || phone.length() != 10 && phone.length() != 9 || !phone.matches("[0-9]+")) {
            throw new IllegalArgumentException("Phone number must be 10 digits.");
        }

        // Validate status
        if (status == null || status.trim().isEmpty()) {
            throw new IllegalArgumentException("Status cannot be null or empty.");
        }

        this.driver_id = driver_id;
        this.driver_name = driver_name;
        this.email = email;
        this.nic = nic;
        this.phone = phone;
        this.status = status;
    }

    public int getId() {
        return driver_id;
    }

    public String getName() {
        return driver_name;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone() {
        return phone;
    }

    public String getNic() {
        return nic;
    }

    public String getStatus() {
        return status;
    }
}
