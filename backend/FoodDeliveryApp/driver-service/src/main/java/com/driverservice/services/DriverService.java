package com.driverservice.services;

import com.driverservice.entities.Driver;

import java.util.List;

public interface DriverService {

    public List<Driver> findAllDrivers();
    public Driver findDriverById(Integer driverId);
    public Driver createDriver(Driver driver);
    public Driver updateDriver(Driver driver);
    public void deleteDriver(Integer driverId);

}
