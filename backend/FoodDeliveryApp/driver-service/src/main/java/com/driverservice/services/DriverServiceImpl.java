package com.driverservice.services;

import com.driverservice.entities.Driver;
import com.driverservice.repositories.DriverRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class DriverServiceImpl implements DriverService{

    private final DriverRepository driverRepository;

    @Override
    public List<Driver> findAllDrivers() {
        return driverRepository.findAll();
    }

    @Override
    public Driver findDriverById(Integer driverId) {
        return driverRepository.findById(driverId).orElseThrow(()->new RuntimeException("DRIVER NOT FOUND"));
    }

    @Override
    public Driver createDriver(Driver driver) {
        Driver savedDriver=Driver.builder()
                .name(driver.getName())
                .email(driver.getEmail())
                .phone(driver.getPhone())
                .location(driver.getLocation())
                .build();
        return driverRepository.save(savedDriver);
    }

    @Override
    public Driver updateDriver(Driver driver) {
        Driver fetchedDriver=driverRepository.findById(driver.getId()).orElseThrow(()->new RuntimeException("DRIVER NOT FOUND"));
        fetchedDriver.setName(driver.getName());
        fetchedDriver.setEmail(driver.getEmail());
        fetchedDriver.setPhone(driver.getPhone());
        fetchedDriver.setLocation(driver.getLocation());
        return driverRepository.save(fetchedDriver);
    }

    @Override
    public void deleteDriver(Integer driverId) {
        Driver fetchedDriver=driverRepository.findById(driverId).orElseThrow(()->new RuntimeException("DRIVER NOT FOUND"));
        driverRepository.delete(fetchedDriver);
    }

}
