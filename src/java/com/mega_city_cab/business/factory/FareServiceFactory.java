/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mega_city_cab.business.factory;

import com.mega_city_cab.business.service.*;

/**
 *
 * @author Nahla
 */
public class FareServiceFactory {

    public static FareService getFareService(String vehicleType) {
        switch (vehicleType.toLowerCase()) {
            case "bike":
                return new BikeFareService();
            case "tuk":
                return new TukFareService();
            case "car":
                return new CarFareService();
            case "minivan":
                return new MiniVanFareService();
            case "van":
                return new VanFareService();
            default:
                throw new IllegalArgumentException("Invalid vehicle type: " + vehicleType);
        }
    }
}
