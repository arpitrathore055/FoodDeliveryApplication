package com.menuservice.services;

import com.menuservice.entities.Menu;
import org.springframework.data.domain.Page;

import java.util.List;
import java.util.Optional;

public interface MenuService {

    public List<Menu> findAllMenus(int pageSize,int pageNum,String sortBy);
    public Menu findMenuById(Integer menuId);
    public Menu createMenu(Menu menu);
    public Page<Menu> menusPageDetails(int pageSIze,int pageNum,String sortBy);
    public Menu updateMenu(Menu menu);
    public void deleteMenu(Integer menuId);
    public List<Menu> findAllMenuByRestaurantId(int restaurantId);

}
