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
