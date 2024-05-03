package com.addressservice.services;

import com.addressservice.entities.Address;

import java.util.List;

public interface AddressService {

    public List<Address> findAllAddress();
    public Address findAddressById(Integer AddressId);
    public Address createAddress(Address Address);
    public Address updateAddress(Address Address);
    public void deleteAddress(Integer AddressId);
    public List<Address> findAddressByUserId(int userId);

}
