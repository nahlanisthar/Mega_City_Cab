/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package com.mega_city_cab.business.model;

import java.sql.Timestamp;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Nahla
 */
public class RideTest {

    public RideTest() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Before
    public void setUp() {
    }

    @After
    public void tearDown() {
    }

    @Test
    public void givenValidRideDetails_whenCreateRide_thenCorrectValuesReturned() {
        // Given
        int rideId = 1;
        int userId = 10;
        String name = "Alice";
        String phone = "0771234567";
        String pickupLocation = "Colombo";
        String dropoffLocation = "Kandy";
        String vehicleType = "Car";
        String vehicleDetails = "Toyota Prius - White";
        int driverId = 101;
        String driverName = "James Smith";
        double totalFare = 5000.00;
        String discountCoupon = "SAVE10";
        Double finalFare = 4500.00;
        String paymentType = "Credit Card";
        Timestamp rideTimestamp = new Timestamp(System.currentTimeMillis());

        // When
        Ride ride = new Ride(rideId, userId, name, phone, pickupLocation, dropoffLocation, vehicleType,
                vehicleDetails, driverId, driverName, totalFare, discountCoupon, finalFare, paymentType, rideTimestamp);

        // Then
        assertEquals(rideId, ride.getRideId());
        assertEquals(userId, ride.getUserId());
        assertEquals(name, ride.getName());
        assertEquals(phone, ride.getPhone());
        assertEquals(pickupLocation, ride.getPickupLocation());
        assertEquals(dropoffLocation, ride.getDropoffLocation());
        assertEquals(vehicleType, ride.getVehicleType());
        assertEquals(vehicleDetails, ride.getVehicleDetails());
        assertEquals(driverId, ride.getDriverId());
        assertEquals(driverName, ride.getDriverName());
        assertEquals(totalFare, ride.getTotalFare(), 0.01);
        assertEquals(discountCoupon, ride.getDiscountCoupon());
        assertEquals(finalFare, ride.getFinalFare());
        assertEquals(paymentType, ride.getPaymentType());
        assertEquals(rideTimestamp, ride.getRideTimestamp());
    }
}
