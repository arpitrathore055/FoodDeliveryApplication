package com.menuservice.entities;

import jakarta.persistence.*;
import lombok.*;

import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table(name="menus")
public class Menu {

    @Id
    @GeneratedValue
    private Integer id;

    @Column(nullable = false)
    private int restaurantId;

    @Column(nullable = false)
    private String itemName;

    @Column(nullable = false,length = 4000)
    private String description;

    @Column(nullable = false)
    private int stars;

    @Column(nullable = false)
    private String imageUrl;

    @Column(nullable = false,precision = 2)
    private int price;

    @Column(nullable = false)
    private Date createdAt;

    @Column(nullable = false)
    private Date updatedAt;

}
