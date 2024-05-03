package com.orderservice.repositories;

import com.orderservice.entities.Order;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OrderRepository extends JpaRepository<Order,Integer> {

    public List<Order> findAllByUserId(int userId);
    public List<Order> findAllByRestaurantId(int restaurantId);
    public List<Order> findAllByDriverId(int driverId);

}
