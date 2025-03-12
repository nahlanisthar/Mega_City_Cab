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
public class UserTest {

    public UserTest() {
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
    public void givenValidUserDetails_whenCreateUser_thenCorrectValuesReturned() {
        // Given
        int userId = 1;
        String username = "john_doe";
        String password = "securePass123";
        int customerId = 101;

        // When
        User user = new User(userId, username, password, customerId);

        // Then
        assertEquals(userId, user.getUserId());
        assertEquals(username, user.getUsername());
        assertEquals(password, user.getPassword());
        assertEquals(customerId, user.getcustomerId());
    }

    @Test
    public void givenNullUsername_whenCreateUser_thenExceptionThrown() {
        // Given
        int userId = 1;
        String username = null;
        String password = "password123";
        int customerId = 101;

        // When and Then
        assertThrows(IllegalArgumentException.class, () -> {
            new User(userId, username, password, customerId);
        });
    }

    @Test
    public void givenNullPassword_whenCreateUser_thenExceptionThrown() {
        // Given
        int userId = 2;
        String username = "john_doe";
        String password = null;
        int customerId = 102;

        // When and Then
        assertThrows(IllegalArgumentException.class, () -> {
            new User(userId, username, password, customerId);
        });
    }
}
