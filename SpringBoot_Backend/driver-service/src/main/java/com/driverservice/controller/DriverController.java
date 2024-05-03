package com.driverservice.controller;

import com.driverservice.entities.Driver;
import com.driverservice.services.DriverServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/drivers")
public class DriverController {

    private final DriverServiceImpl driverServiceImpl;

    @PostMapping
    public ResponseEntity<Driver> createDriver(@RequestBody Driver driver){
        return new ResponseEntity<>(driverServiceImpl.createDriver(driver), HttpStatus.CREATED);
    }

    @GetMapping
    public ResponseEntity<List<Driver>> findAllDrivers(){
        return new ResponseEntity<>(driverServiceImpl.findAllDrivers(),HttpStatus.OK);
    }

    @GetMapping("/{driverId}")
    public ResponseEntity<Driver> findDriverById(@PathVariable("driverId") int driverId){
        return new ResponseEntity<>(driverServiceImpl.findDriverById(driverId),HttpStatus.OK);
    }

    @PutMapping
    public ResponseEntity<Driver> updateDriver(@RequestBody Driver driver){
        return new ResponseEntity<>(driverServiceImpl.updateDriver(driver),HttpStatus.OK);
    }

    @DeleteMapping("/{driverId}")
    public ResponseEntity<String> deleteDriver(@PathVariable("driverId") int driverId){
        driverServiceImpl.deleteDriver(driverId);
        return new ResponseEntity<>("Driver deleted successfully.",HttpStatus.OK);
    }


}
