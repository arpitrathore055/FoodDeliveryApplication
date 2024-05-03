package com.userservice.services;

import com.userservice.entities.User;

import java.util.List;

public interface UserService {

    public List<User> findAllUsers();
    public User findUserById(Integer userId);
    public User createUser(User user);
    public User updateUser(User user);
    public void deleteUser(Integer userId);
    public boolean isUserPresent(String userEmail,String userPassword);
    public User findUserByEmailAndPassword(String userEmail,String userPassword);

}
