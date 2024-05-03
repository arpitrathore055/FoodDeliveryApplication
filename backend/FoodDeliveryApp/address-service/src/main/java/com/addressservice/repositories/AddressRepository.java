package com.addressservice.repositories;

import com.addressservice.entities.Address;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AddressRepository extends JpaRepository<Address,Integer> {

    public List<Address> findAllByUserId(int userId);

}
