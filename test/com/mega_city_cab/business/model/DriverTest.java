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
public class DriverTest {

    public DriverTest() {
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
    public void givenValidDriverDetails_whenCreateDriver_thenCorrectValuesReturned() {
        // Given
        int driverId = 101;
        String driverName = "James Smith";
        String email = "james@gmail.com";
        String nic = "98765432132V";
        String phone = "0771234567";
        String status = "Available";

        // When
        Driver driver = new Driver(driverId, driverName, email, nic, phone, status);

        // Then
        assertEquals(driverId, driver.getId());
        assertEquals(driverName, driver.getName());
        assertEquals(email, driver.getEmail());
        assertEquals(nic, driver.getNic());
        assertEquals(phone, driver.getPhone());
        assertEquals(status, driver.getStatus());
    }
    
     @Test
    public void testInvalidDriverNIC() {
        // Test invalid NIC number (e.g., too short or incorrect format)
        assertThrows(IllegalArgumentException.class, () -> {
            new Driver(1, "Jane Doe","jane@gmail.com", "9876", "0784375889", "Available");
        });
    }

}
