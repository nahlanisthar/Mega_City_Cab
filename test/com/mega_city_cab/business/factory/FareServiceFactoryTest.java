/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package com.mega_city_cab.business.factory;

import com.mega_city_cab.business.service.FareService;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

import com.mega_city_cab.business.service.BikeFareService;
import com.mega_city_cab.business.service.CarFareService;

/**
 *
 * @author Nahla
 */
public class FareServiceFactoryTest {

    public FareServiceFactoryTest() {
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
    public void givenVehicleType_whenGetFareService_thenCorrectInstanceReturned() {
        // Given
        String vehicleType = "bike";

        // When
        FareService service = FareServiceFactory.getFareService(vehicleType);

        // Then
        assertTrue(service instanceof BikeFareService);
    }

    @Test
    public void givenInvalidVehicleType_whenGetFareService_thenThrowException() {
        // Given
        String vehicleType = "bus"; // Invalid vehicle type

        // When & Then
        assertThrows(IllegalArgumentException.class, () -> {
            FareServiceFactory.getFareService(vehicleType);
        });
    }
}
