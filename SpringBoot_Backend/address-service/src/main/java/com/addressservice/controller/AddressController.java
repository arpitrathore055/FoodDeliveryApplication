package com.addressservice.controller;

import com.addressservice.entities.Address;
import com.addressservice.services.AddressService;
import com.addressservice.services.AddressServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/address")
@RequiredArgsConstructor
public class AddressController {

    private final AddressServiceImpl addressServiceImpl;

    @PostMapping
    public ResponseEntity<Address> createAddress(@RequestBody Address address){
        return new ResponseEntity<>(addressServiceImpl.createAddress(address), HttpStatus.CREATED);
    }

    @GetMapping
    public ResponseEntity<List<Address>> findAllAddress(){
        return new ResponseEntity<>(addressServiceImpl.findAllAddress(),HttpStatus.OK);
    }

    @GetMapping("/{addressId}")
    public ResponseEntity<Address> findAddressById(@PathVariable("addressId") int addressId){
        return new ResponseEntity<>(addressServiceImpl.findAddressById(addressId),HttpStatus.OK);
    }

    @GetMapping("/with-user-id/{userId}")
    public ResponseEntity<List<Address>> findAddressByUserId(@PathVariable("userId") int userId){
        return new ResponseEntity<>(addressServiceImpl.findAddressByUserId(userId),HttpStatus.OK);
    }

    @PutMapping
    public ResponseEntity<Address> updateAddress(@RequestBody Address address){
        return new ResponseEntity<>(addressServiceImpl.updateAddress(address),HttpStatus.OK);
    }

    @DeleteMapping("/{addressId}")
    public ResponseEntity<String> deleteAddress(@PathVariable("addressId") int addressId){
        addressServiceImpl.deleteAddress(addressId);
        return new ResponseEntity<>("Address deleted successfully.",HttpStatus.OK);
    }

}
