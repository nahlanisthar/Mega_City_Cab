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
import com.mega_city_cab.persistence.dao.CustomerDAO;

/**
 *
 * @author Nahla
 */
public class CustomerTest {

    CustomerDAO cus = new CustomerDAO();

    public CustomerTest() {
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
    public void givenValidCustomerDetails_whenCreateCustomer_thenCorrectValuesReturned() {
        // Given
        Customer customer = new Customer(1, "John Doe", "john@gmail.com", "12345678910V", "0712345678");

        // When & Then
        assertEquals(1, customer.getId());
        assertEquals("John Doe", customer.getName());
        assertEquals("john@gmail.com", customer.getEmail());
        assertEquals("12345678910V", customer.getNic());
        assertEquals("0712345678", customer.getPhone());
    }

    @Test
    public void testInvalidPhoneNumber() {
        // Test invalid phone number (e.g., too short)
        assertThrows(IllegalArgumentException.class, () -> {
            new Customer(1, "John Doe", "john@gmail.com", "123", "123456789101");
        });
    }

    @Test
    public void testInvalidEmail() {
        // Test invalid email format
        assertThrows(IllegalArgumentException.class, () -> {
            new Customer(1, "John Doe", "invalid-email", "1234567890", "123456789101");
        });
    }
}
