package com.ratingservice.services;

import com.ratingservice.entities.Rating;
import com.ratingservice.repositories.RatingRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class RatingServiceImpl implements RatingService{

    private final RatingRepository ratingRepository;

    @Override
    public List<Rating> findAllRatings() {
        return ratingRepository.findAll();
    }

    @Override
    public Rating findRatingById(Integer ratingId) {
        return ratingRepository.findById(ratingId).orElseThrow(()->new RuntimeException("RATING NOT FOUND"));
    }

    @Override
    public Rating createRating(Rating rating) {
        Rating savedRating=Rating.builder()
                .rating(rating.getRating())
                .restaurantId(rating.getRestaurantId())
                .userId(rating.getUserId())
                .build();
        return ratingRepository.save(savedRating);
    }

    @Override
    public Rating updateRating(Rating rating) {
        Rating fetchedRating=ratingRepository.findById(rating.getId()).orElseThrow(()->new RuntimeException("RATING NOT FOUND"));
        fetchedRating.setRating(rating.getRating());
        fetchedRating.setRestaurantId(rating.getRestaurantId());
        return ratingRepository.save(fetchedRating);
    }

    @Override
    public void deleteRating(Integer ratingId) {
        Rating fetchedRating=ratingRepository.findById(ratingId).orElseThrow(()->new RuntimeException("RATING NOT FOUND"));
        ratingRepository.delete(fetchedRating);
    }

    @Override
    public List<Rating> findAllRatingsByUserId(int userId) {
        return ratingRepository.findAllByUserId(userId);
    }

    @Override
    public List<Rating> findAllRatingsByRestaurantId(int restaurantId) {
        return ratingRepository.findAllByRestaurantId(restaurantId);
    }

}
