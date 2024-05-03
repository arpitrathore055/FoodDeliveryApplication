package com.orderservice.controller;

import com.orderservice.entities.Order;
import com.orderservice.services.OrderServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/orders")
@RequiredArgsConstructor
public class OrderController {

    private final OrderServiceImpl orderServiceImpl;

    @PostMapping
    public ResponseEntity<Order> createOrder(@RequestBody Order order){
        return new ResponseEntity<>(orderServiceImpl.createOrder(order), HttpStatus.CREATED);
    }

    @GetMapping
    public ResponseEntity<List<Order>> findAllOrder(){
        return new ResponseEntity<>(orderServiceImpl.findAllOrder(),HttpStatus.OK);
    }

    @GetMapping("/{orderId}")
    public ResponseEntity<Order> findOrderById(@PathVariable("orderId") int orderId){
        return new ResponseEntity<>(orderServiceImpl.findOrderById(orderId),HttpStatus.OK);
    }

    @GetMapping("/with-user-id/{userId}")
    public ResponseEntity<List<Order>> findOrderByUserId(@PathVariable("userId") int userId){
        return new ResponseEntity<>(orderServiceImpl.findOrderByUserId(userId),HttpStatus.OK);
    }

    @GetMapping("/with-restaurant-id/{restaurantId}")
    public ResponseEntity<List<Order>> findOrderByRestaurantId(@PathVariable("restaurantId") int restaurantId){
        return new ResponseEntity<>(orderServiceImpl.findOrderByRestaurantId(restaurantId),HttpStatus.OK);
    }

    @GetMapping("/with-driver-id/{driverId}")
    public ResponseEntity<List<Order>> findOrderByDriverId(@PathVariable("driverId") int driverId){
        return new ResponseEntity<>(orderServiceImpl.findOrderByDriverId(driverId),HttpStatus.OK);
    }

    @PutMapping
    public ResponseEntity<Order> updateOrder(@RequestBody Order order){
        return new ResponseEntity<>(orderServiceImpl.updateOrder(order),HttpStatus.OK);
    }

    @DeleteMapping("/{orderId}")
    public ResponseEntity<String> deleteOrder(@PathVariable("orderId") int orderId){
        orderServiceImpl.deleteOrder(orderId);
        return new ResponseEntity<>("Order deleted successfully.",HttpStatus.OK);
    }

}
