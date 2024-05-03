package com.addressservice.services;

import com.addressservice.entities.Address;
import com.addressservice.repositories.AddressRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class AddressServiceImpl implements AddressService{

    private final AddressRepository addressRepository;

    @Override
    public List<Address> findAllAddress() {
        return addressRepository.findAll();
    }

    @Override
    public Address findAddressById(Integer AddressId) {
        return addressRepository.findById(AddressId).orElseThrow(()->new RuntimeException("ADDRESS NOT FOUND"));
    }

    @Override
    public Address createAddress(Address Address) {
        Address savedAddress=com.addressservice.entities.Address.builder()
                .userId(Address.getUserId())
                .street(Address.getStreet())
                .state(Address.getState())
                .city(Address.getCity())
                .pincode(Address.getPincode())
                .build();
        return addressRepository.save(savedAddress);
    }

    @Override
    public Address updateAddress(Address Address) {
        com.addressservice.entities.Address fetchedAddress=addressRepository.findById(Address.getId()).orElseThrow(()->new RuntimeException("ADDRESS NOT FOUND"));
        fetchedAddress.setCity(Address.getCity());
        fetchedAddress.setStreet(Address.getStreet());
        fetchedAddress.setState(Address.getState());
        fetchedAddress.setUserId(Address.getUserId());
        fetchedAddress.setPincode(Address.getPincode());
        return addressRepository.save(fetchedAddress);
    }

    @Override
    public void deleteAddress(Integer AddressId) {
        Address fetchedAddress=addressRepository.findById(AddressId).orElseThrow(()->new RuntimeException("ADDRESS NOT FOUND"));
        addressRepository.delete(fetchedAddress);
    }

    @Override
    public List<Address> findAddressByUserId(int userId) {
        return addressRepository.findAllByUserId(userId);
    }

}
