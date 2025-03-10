/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mega_city_cab.business.service;

import java.sql.Connection;

/**
 *
 * @author Nahla
 */
public interface FareService {
    double getFare(Connection conn, String pickup, String dropoff) throws Exception;
}
