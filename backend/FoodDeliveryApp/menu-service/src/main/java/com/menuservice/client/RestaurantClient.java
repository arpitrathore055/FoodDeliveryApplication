package com.menuservice.client;

import com.menuservice.Restaurant;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@FeignClient(name = "restaurant-service",url = "${spring.application.config.restaurant-service-url}")
public interface RestaurantClient {

    @GetMapping("/{restaurantId}")
    public Restaurant findRestaurantById(@PathVariable("restaurantId") int restaurantId);

}
