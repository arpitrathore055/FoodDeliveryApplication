package com.menuservice.services;

import com.menuservice.entities.Menu;
import com.menuservice.repositories.MenuRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class MenuServiceImpl implements MenuService{

    private final MenuRepository menuRepository;

    @Override
    public List<Menu> findAllMenus(int pageSize,int pageNum,String sortBy) {
        Pageable pageable= PageRequest.of(pageNum,pageSize, Sort.by(sortBy));
        Page<Menu> menuItems=menuRepository.findAll(pageable);
        return menuItems.toList();
    }

    @Override
    public Page<Menu> menusPageDetails(int pageSize,int pageNum,String sortBy) {
        Pageable pageable= PageRequest.of(pageNum,pageSize, Sort.by(sortBy));
        Page<Menu> menuItems=menuRepository.findAll(pageable);
        return menuItems;
    }

    @Override
    public Menu findMenuById(Integer menuId) {
        return menuRepository.findById(menuId).orElseThrow(()->new RuntimeException("MENU NOT FOUND"));
    }

    @Override
    public Menu createMenu(Menu menu) {
        Menu savedMenu=Menu.builder()
                .restaurantId(menu.getRestaurantId())
                .itemName(menu.getItemName())
                .price(menu.getPrice())
                .description(menu.getDescription())
                .stars(menu.getStars())
                .imageUrl(menu.getImageUrl())
                .createdAt(new Date())
                .updatedAt(new Date())
                .build();
        return menuRepository.save(savedMenu);
    }

    @Override
    public Menu updateMenu(Menu menu) {
        Menu fetchedMenu=menuRepository.findById(menu.getId()).orElseThrow(()->new RuntimeException("MENU NOT FOUND"));
        fetchedMenu.setPrice(menu.getPrice());
        fetchedMenu.setItemName(menu.getItemName());
        fetchedMenu.setRestaurantId(menu.getRestaurantId());
        fetchedMenu.setStars(menu.getStars());
        fetchedMenu.setDescription(menu.getDescription());
        fetchedMenu.setImageUrl(menu.getImageUrl());
        fetchedMenu.setUpdatedAt(new Date());
        return menuRepository.save(fetchedMenu);
    }

    @Override
    public void deleteMenu(Integer menuId) {
        Menu fetchedMenu=menuRepository.findById(menuId).orElseThrow(()->new RuntimeException("MENU NOT FOUND"));
        menuRepository.delete(fetchedMenu);
    }

    @Override
    public List<Menu> findAllMenuByRestaurantId(int restaurantId) {
        return menuRepository.findAllByRestaurantId(restaurantId);
    }

}
