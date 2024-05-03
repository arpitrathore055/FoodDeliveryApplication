package com.addressservice.entities;

import jakarta.persistence.*;
import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table(name="address")
public class Address {

    @Id
    @GeneratedValue
    private Integer id;

    @Column(name="user_id",nullable = false)
    private int userId;

    @Column(nullable = false)
    private String street;

    @Column(nullable = false,unique = true)
    private String city;

    @Column(nullable = false)
    private String state;

    @Column(nullable = false)
    private int pincode;

}
