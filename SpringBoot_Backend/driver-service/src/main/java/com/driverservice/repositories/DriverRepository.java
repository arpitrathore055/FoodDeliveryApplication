package com.driverservice.repositories;

import com.driverservice.entities.Driver;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DriverRepository extends JpaRepository<Driver,Integer> {
}
