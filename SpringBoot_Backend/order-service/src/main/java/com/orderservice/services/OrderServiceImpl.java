package com.orderservice.services;

import com.orderservice.entities.Order;
import com.orderservice.repositories.OrderRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class OrderServiceImpl implements OrderService{

    private final OrderRepository orderRepository;

    @Override
    public List<Order> findAllOrder() {
        return orderRepository.findAll();
    }

    @Override
    public Order findOrderById(Integer OrderId) {
        return orderRepository.findById(OrderId).orElseThrow(()->new RuntimeException("ORDER NOT FOUND"));
    }

    @Override
    public Order createOrder(Order Order) {
        Order savedOrder= com.orderservice.entities.Order.builder()
                .orderTotal(Order.getOrderTotal())
                .driverId(Order.getDriverId())
                .deliveryStatus(Order.getDeliveryStatus())
                .userId(Order.getUserId())
                .restaurantId(Order.getRestaurantId())
                .build();
        return orderRepository.save(savedOrder);
    }

    @Override
    public Order updateOrder(Order Order) {
        com.orderservice.entities.Order fetchedOrder=orderRepository.findById(Order.getId()).orElseThrow(()->new RuntimeException("ORDER NOT FOUND"));
        fetchedOrder.setOrderTotal(Order.getOrderTotal());
        fetchedOrder.setDriverId(Order.getDriverId());
        fetchedOrder.setDeliveryStatus(Order.getDeliveryStatus());
        fetchedOrder.setUserId(Order.getUserId());
        fetchedOrder.setRestaurantId(Order.getRestaurantId());
        return orderRepository.save(fetchedOrder);
    }

    @Override
    public void deleteOrder(Integer OrderId) {
        Order fetchedOrder=orderRepository.findById(OrderId).orElseThrow(()->new RuntimeException("ORDER NOT FOUND"));
        orderRepository.delete(fetchedOrder);
    }

    @Override
    public List<Order> findOrderByUserId(int userId) {
        return orderRepository.findAllByUserId(userId);
    }

    @Override
    public List<Order> findOrderByRestaurantId(int restaurantId) {
        return orderRepository.findAllByRestaurantId(restaurantId);
    }

    @Override
    public List<Order> findOrderByDriverId(int driverId) {
        return orderRepository.findAllByDriverId(driverId);
    }

}
