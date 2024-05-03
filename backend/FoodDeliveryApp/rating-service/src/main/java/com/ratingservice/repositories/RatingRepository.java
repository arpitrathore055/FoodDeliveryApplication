package com.ratingservice.repositories;

import com.ratingservice.entities.Rating;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RatingRepository extends JpaRepository<Rating,Integer> {

    public List<Rating> findAllByUserId(int userId);
    public List<Rating> findAllByRestaurantId(int restaurantId);

}
