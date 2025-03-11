/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mega_city_cab.business.model;

/**
 *
 * @author Nahla
 */
import java.sql.Timestamp;

public class Ride {
    private int rideId;
    private int userId;
    private String name;
    private String phone;
    private String pickupLocation;
    private String dropoffLocation;
    private String vehicleType;
    private String vehicleDetails;
    private int driverId;
    private String driverName;
    private double totalFare;
    private String discountCoupon;
    private Double finalFare;
    private String paymentType;
    private Timestamp rideTimestamp;

    public Ride(int rideId, int userId, String name, String phone, String pickupLocation, String dropoffLocation,
                String vehicleType, String vehicleDetails, int driverId, String driverName, double totalFare,
                String discountCoupon, Double finalFare, String paymentType, Timestamp rideTimestamp) {
        this.rideId = rideId;
        this.userId = userId;
        this.name = name;
        this.phone = phone;
        this.pickupLocation = pickupLocation;
        this.dropoffLocation = dropoffLocation;
        this.vehicleType = vehicleType;
        this.vehicleDetails = vehicleDetails;
        this.driverId = driverId;
        this.driverName = driverName;
        this.totalFare = totalFare;
        this.discountCoupon = discountCoupon;
        this.finalFare = finalFare;
        this.paymentType = paymentType;
        this.rideTimestamp = rideTimestamp;
    }

    // Getters
    public int getRideId() { return rideId; }
    public int getUserId() { return userId; }
    public String getName() { return name; }
    public String getPhone() { return phone; }
    public String getPickupLocation() { return pickupLocation; }
    public String getDropoffLocation() { return dropoffLocation; }
    public String getVehicleType() { return vehicleType; }
    public String getVehicleDetails() { return vehicleDetails; }
    public int getDriverId() { return driverId; }
    public String getDriverName() { return driverName; }
    public double getTotalFare() { return totalFare; }
    public String getDiscountCoupon() { return discountCoupon; }
    public Double getFinalFare() { return finalFare; }
    public String getPaymentType() { return paymentType; }
    public Timestamp getRideTimestamp() { return rideTimestamp; }
}