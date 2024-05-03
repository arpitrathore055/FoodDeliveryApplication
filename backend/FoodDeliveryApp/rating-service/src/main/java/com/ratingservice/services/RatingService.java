package com.ratingservice.services;

import com.ratingservice.entities.Rating;

import java.util.List;

public interface RatingService {

    public List<Rating> findAllRatings();
    public Rating findRatingById(Integer ratingId);
    public Rating createRating(Rating rating);
    public Rating updateRating(Rating rating);
    public void deleteRating(Integer ratingId);
    public List<Rating> findAllRatingsByUserId(int userId);
    public List<Rating> findAllRatingsByRestaurantId(int restaurantId);

}
