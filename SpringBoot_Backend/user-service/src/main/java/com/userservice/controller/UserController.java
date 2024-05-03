package com.userservice.controller;

import com.userservice.entities.User;
import com.userservice.services.UserServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/users")
@RequiredArgsConstructor
public class UserController {

    private final UserServiceImpl userServiceImpl;

    @PostMapping
    public ResponseEntity<User> createUser(@RequestBody User user){
        return new ResponseEntity<>(userServiceImpl.createUser(user), HttpStatus.CREATED);
    }

    @GetMapping
    public ResponseEntity<List<User>> findAllUsers(){
        return new ResponseEntity<>(userServiceImpl.findAllUsers(),HttpStatus.OK);
    }

    @GetMapping("/{userId}")
    public ResponseEntity<User> findUserById(@PathVariable("userId") int userId){
        return new ResponseEntity<>(userServiceImpl.findUserById(userId),HttpStatus.OK);
    }

    @PutMapping
    public ResponseEntity<User> updateUser(@RequestBody User user){
        return new ResponseEntity<>(userServiceImpl.updateUser(user),HttpStatus.OK);
    }

    @DeleteMapping("/{userId}")
    public ResponseEntity<String> deleteUser(@PathVariable("userId") int userId){
        userServiceImpl.deleteUser(userId);
        return new ResponseEntity<>("User deleted successfully.",HttpStatus.OK);
    }

//    @GetMapping("/exists")
//    public ResponseEntity<Boolean> isUserPresent(@RequestParam("email") String userEmail,@RequestParam("password") String userPassword){
//        return new ResponseEntity<>(userServiceImpl.isUserPresent(userEmail,userPassword),HttpStatus.OK);
//    }

    @GetMapping("/exists")
    public ResponseEntity<User> isUserPresent(@RequestParam("email") String userEmail,@RequestParam("password") String userPassword){
        return new ResponseEntity<>(userServiceImpl.findUserByEmailAndPassword(userEmail,userPassword),HttpStatus.OK);
    }

}
