package com.ratingservice.controller;

import com.ratingservice.entities.Rating;
import com.ratingservice.services.RatingServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/ratings")
public class RatingController {

    private final RatingServiceImpl ratingServiceImpl;

    @PostMapping
    public ResponseEntity<Rating> createRating(@RequestBody Rating rating){
        return new ResponseEntity<>(ratingServiceImpl.createRating(rating), HttpStatus.CREATED);
    }

    @GetMapping
    public ResponseEntity<List<Rating>> findAllRatings(){
        return new ResponseEntity<>(ratingServiceImpl.findAllRatings(),HttpStatus.OK);
    }

    @GetMapping("/{ratingId}")
    public ResponseEntity<Rating> findRatingById(@PathVariable("ratingId") int ratingId){
        return new ResponseEntity<>(ratingServiceImpl.findRatingById(ratingId),HttpStatus.OK);
    }

    @PutMapping
    public ResponseEntity<Rating> updateRating(@RequestBody Rating rating){
        return new ResponseEntity<>(ratingServiceImpl.updateRating(rating),HttpStatus.OK);
    }

    @DeleteMapping("/{ratingId}")
    public ResponseEntity<String> deleteRating(@PathVariable("ratingId") int ratingId){
        ratingServiceImpl.deleteRating(ratingId);
        return new ResponseEntity<>("Rating deleted successfully.",HttpStatus.OK);
    }

    @GetMapping("/with-user-id/{userId}")
    public ResponseEntity<List<Rating>> findRatingsByUserId(@PathVariable("userId") int userId){
        return new ResponseEntity<>(ratingServiceImpl.findAllRatingsByUserId(userId),HttpStatus.OK);
    }

    @GetMapping("/with-restaurant-id/{restaurantId}")
    public ResponseEntity<List<Rating>> findRatingsByRestaurantId(@PathVariable("restaurantId") int restaurantId){
        return new ResponseEntity<>(ratingServiceImpl.findAllRatingsByRestaurantId(restaurantId),HttpStatus.OK);
    }

}
