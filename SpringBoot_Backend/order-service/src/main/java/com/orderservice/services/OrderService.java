package com.orderservice.services;

import com.orderservice.entities.Order;

import java.util.List;

public interface OrderService {

    public List<Order> findAllOrder();
    public Order findOrderById(Integer OrderId);
    public Order createOrder(Order Order);
    public Order updateOrder(Order Order);
    public void deleteOrder(Integer OrderId);
    public List<Order> findOrderByUserId(int userId);
    public List<Order> findOrderByRestaurantId(int restaurantId);
    public List<Order> findOrderByDriverId(int driverId);

}
