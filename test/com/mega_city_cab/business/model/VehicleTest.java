/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package com.mega_city_cab.business.model;

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
public class VehicleTest {

    public VehicleTest() {
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
    public void givenValidVehicleDetails_whenCreateVehicle_thenCorrectValuesReturned() {
        // Given
        String vehicleNumber = "ABC-1234";
        String vehicleType = "Car";
        String vehicleName = "Toyota Prius";
        String vehicleModel = "2019";
        int driverId = 22;

        // When
        Vehicle vehicle = new Vehicle(vehicleNumber, vehicleType, vehicleName, vehicleModel, driverId);

        // Then
        assertEquals(vehicleNumber, vehicle.getNumber());
        assertEquals(vehicleType, vehicle.getType());
        assertEquals(vehicleName, vehicle.getName());
        assertEquals(vehicleModel, vehicle.getModel());
        assertEquals(driverId, vehicle.getDriver_Id());
    }

    @Test
    public void givenNullVehicleNumber_whenCreateVehicle_thenExceptionThrown() {
        assertThrows(IllegalArgumentException.class, () -> {
            new Vehicle(null, "Car", "Toyota", "Camry", 101);
        });
    }

}
