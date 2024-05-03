package com.ratingservice.entities;

import jakarta.persistence.*;
import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table(name="ratings")
public class Rating {

    @Id
    @GeneratedValue
    private Integer id;

    @Column(nullable = false)
    private int userId;

    @Column(nullable = false)
    private int restaurantId;

    @Column(nullable = false)
    private int rating;

}
