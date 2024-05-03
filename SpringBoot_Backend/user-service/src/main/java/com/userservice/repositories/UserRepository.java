package com.userservice.repositories;

import com.userservice.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User,Integer> {

    public boolean existsUserByEmailAndPassword(String userEmail,String userPassword);
    public User findByEmailAndPassword(String userEmail,String userPassword);

}
