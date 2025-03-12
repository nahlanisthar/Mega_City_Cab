/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mega_city_cab.business.model;

/**
 *
 * @author Nahla
 */
public class Vehicle {
    private String vehicle_number, vehicle_type, vehicle_name, vehicle_model;
    private int driver_id;

    public Vehicle (String vehicle_number, String vehicle_type, String vehicle_name, String vehicle_model, int driver_id) {
        this.vehicle_number = vehicle_number;
        this.vehicle_type = vehicle_type;
        this.vehicle_name = vehicle_name;
        this.vehicle_model = vehicle_model;
        this.driver_id = driver_id;
    }

    public String getNumber() {
        return vehicle_number;
    }

    public String getType() {
        return vehicle_type;
    }

    public String getName() {
        return vehicle_name;
    }

    public String getModel() {
        return vehicle_model;
    }

    public int getDriver_Id() {
        return driver_id;
    }
}
