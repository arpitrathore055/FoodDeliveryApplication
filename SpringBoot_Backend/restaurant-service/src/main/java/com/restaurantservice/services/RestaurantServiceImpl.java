package com.restaurantservice.services;

import com.restaurantservice.entities.Restaurant;
import com.restaurantservice.repositories.RestaurantRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class RestaurantServiceImpl implements RestaurantService{

    private final RestaurantRepository restaurantRepository;

    @Override
    public List<Restaurant> findAllRestaurants() {
        return restaurantRepository.findAll();
    }

    @Override
    public Restaurant findRestaurantById(Integer restaurantId) {
        return restaurantRepository.findById(restaurantId).orElseThrow(()->new RuntimeException("RESTAURANT NOT FOUND"));
    }

    @Override
    public Restaurant createRestaurant(Restaurant restaurant) {
        Restaurant savedRestaurant=Restaurant.builder()
                .name(restaurant.getName())
                .address(restaurant.getAddress())
                .phoneNumber(restaurant.getPhoneNumber())
                .build();
        return restaurantRepository.save(savedRestaurant);
    }

    @Override
    public Restaurant updateRestaurant(Restaurant restaurant) {
        Restaurant fetchedRestaurant=restaurantRepository.findById(restaurant.getId()).orElseThrow(()->new RuntimeException("RESTAURANT NOT FOUND"));
        fetchedRestaurant.setName(restaurant.getName());
        fetchedRestaurant.setPhoneNumber(restaurant.getPhoneNumber());
        fetchedRestaurant.setAddress(restaurant.getAddress());
        return null;
    }

    @Override
    public void deleteRestaurant(Integer restaurantId) {
        Restaurant fetchedRestaurant=restaurantRepository.findById(restaurantId).orElseThrow(()->new RuntimeException("RESTAURANT NOT FOUND"));
        restaurantRepository.delete(fetchedRestaurant);
    }

}
