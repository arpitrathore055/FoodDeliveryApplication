package com.userservice.services;

import com.userservice.entities.User;
import com.userservice.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService{

    private final UserRepository userRepository;

    @Override
    public List<User> findAllUsers() {
        return userRepository.findAll();
    }

    @Override
    public User findUserById(Integer userId) {
        return userRepository.findById(userId).orElseThrow(()->new RuntimeException("USER NOT FOUND"));
    }

    @Override
    public User createUser(User user) {
        User savedUser=User.builder()
                .name(user.getName())
                .email(user.getEmail())
                .phoneNumber(user.getPhoneNumber())
                .password(user.getPassword())
                .build();
        return userRepository.save(savedUser);
    }

    @Override
    public User updateUser(User user) {
        User fetchedUser=userRepository.findById(user.getId()).orElseThrow(()->new RuntimeException("not found"));
        fetchedUser.setName(user.getName());
        fetchedUser.setEmail(user.getEmail());
        fetchedUser.setPassword(user.getPassword());
        fetchedUser.setPhoneNumber(user.getPhoneNumber());
        return userRepository.save(fetchedUser);
    }

    @Override
    public void deleteUser(Integer userId) {
        User fetchedUser=userRepository.findById(userId).orElseThrow(()->new RuntimeException("not found"));
        userRepository.delete(fetchedUser);
    }

    @Override
    public boolean isUserPresent(String userEmail, String userPassword) {
        return userRepository.existsUserByEmailAndPassword(userEmail,userPassword);
    }

    @Override
    public User findUserByEmailAndPassword(String userEmail, String userPassword) {
        return userRepository.findByEmailAndPassword(userEmail,userPassword);
    }
}
