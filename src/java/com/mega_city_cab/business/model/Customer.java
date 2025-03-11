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
