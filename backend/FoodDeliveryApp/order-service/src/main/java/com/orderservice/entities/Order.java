package com.orderservice.entities;
import jakarta.persistence.*;
import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table(name="orders")
public class Order {

    @Id
    @GeneratedValue
    private Integer id;

    @Column(nullable = false)
    private int userId;

    @Column(nullable = false)
    private int restaurantId;

    @Column(nullable = false)
    private String deliveryStatus;

    @Column(nullable = false)
    private int driverId;

    @Column(nullable = false,precision = 2)
    private double orderTotal;

}
