package com.paymentservice.entities;

import jakarta.persistence.*;
import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table(name="payments")
public class Payment {

    @Id
    @GeneratedValue
    private Integer id;

    @Column(nullable = false)
    private int orderId;

    @Column(nullable = false)
    private double amount;

    @Column(nullable = false)
    private String paymentMethod;

    @Column(nullable = false)
    private String status;

}
