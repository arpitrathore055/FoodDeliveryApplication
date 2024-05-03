package com.restaurantservice.services;

import com.restaurantservice.entities.Restaurant;

import java.util.List;

public interface RestaurantService {

    public List<Restaurant> findAllRestaurants();
    public Restaurant findRestaurantById(Integer restaurantId);
    public Restaurant createRestaurant(Restaurant restaurant);
    public Restaurant updateRestaurant(Restaurant restaurant);
    public void deleteRestaurant(Integer restaurantId);

}
