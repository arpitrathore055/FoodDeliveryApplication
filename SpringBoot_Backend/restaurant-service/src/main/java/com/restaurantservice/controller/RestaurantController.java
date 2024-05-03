package com.restaurantservice.controller;

import com.restaurantservice.entities.Restaurant;
import com.restaurantservice.services.RestaurantServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/restaurants")
@RequiredArgsConstructor
public class RestaurantController {

    private final RestaurantServiceImpl restaurantServiceImpl;

    @PostMapping
    public ResponseEntity<Restaurant> createRestaurant(@RequestBody Restaurant restaurant){
        return new ResponseEntity<>(restaurantServiceImpl.createRestaurant(restaurant), HttpStatus.CREATED);
    }

    @GetMapping
    public ResponseEntity<List<Restaurant>> findAllRestaurants(){
        return new ResponseEntity<>(restaurantServiceImpl.findAllRestaurants(),HttpStatus.OK);
    }

    @GetMapping("/{restaurantId}")
    public ResponseEntity<Restaurant> findRestaurantById(@PathVariable("restaurantId") int restaurantId){
        return new ResponseEntity<>(restaurantServiceImpl.findRestaurantById(restaurantId),HttpStatus.OK);
    }

    @PutMapping
    public ResponseEntity<Restaurant> updateRestaurant(@RequestBody Restaurant restaurant){
        return new ResponseEntity<>(restaurantServiceImpl.updateRestaurant(restaurant),HttpStatus.OK);
    }

    @DeleteMapping("/{restaurantId}")
    public ResponseEntity<String> deleteRestaurant(@PathVariable("restaurantId") int restaurantId){
        restaurantServiceImpl.deleteRestaurant(restaurantId);
        return new ResponseEntity<>("Restaurant deleted successfully.",HttpStatus.OK);
    }

}
