package com.menuservice.repositories;

import com.menuservice.entities.Menu;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface MenuRepository extends JpaRepository<Menu,Integer> {

    public List<Menu> findAllByRestaurantId(int restaurantId);

}
