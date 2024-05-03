package com.menuservice.controller;

import com.menuservice.MenuProductDetail;
import com.menuservice.MenuProductResponse;
import com.menuservice.Restaurant;
import com.menuservice.client.RestaurantClient;
import com.menuservice.entities.Menu;
import com.menuservice.services.MenuServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/v1/menus")
@RequiredArgsConstructor
public class MenuController {

    private final MenuServiceImpl menuServiceImpl;
    private final RestaurantClient restaurantClient;

    @PostMapping
    public ResponseEntity<Menu> createMenu(@RequestBody Menu menu){
        return new ResponseEntity<>(menuServiceImpl.createMenu(menu), HttpStatus.CREATED);
    }

    @GetMapping
    public ResponseEntity<List<Menu>> findAllMenu(@RequestParam(name="pageSize",defaultValue = "1",required = false) int pageSize,@RequestParam(name="pageNum",defaultValue = "0",required = false) int pageNum,@RequestParam(name="sortBy",defaultValue = "id",required = false) String sortBy){
        return new ResponseEntity<>(menuServiceImpl.findAllMenus(pageSize,pageNum,sortBy),HttpStatus.OK);
    }

    @GetMapping("/{menuId}")
    public ResponseEntity<Menu> findMenuById(@PathVariable("menuId") int menuId){
        return new ResponseEntity<>(menuServiceImpl.findMenuById(menuId),HttpStatus.OK);
    }

    @GetMapping("/with-restaurant-id/{restaurantId}")
    public ResponseEntity<List<Menu>> findMenuByUserId(@PathVariable("restaurantId") int restaurantId){
        return new ResponseEntity<>(menuServiceImpl.findAllMenuByRestaurantId(restaurantId),HttpStatus.OK);
    }

    @GetMapping("/products")
    public ResponseEntity<MenuProductResponse> findAllMenuProducts(@RequestParam(name="pageSize",defaultValue = "1",required = false) int pageSize,@RequestParam(name="pageNum",defaultValue = "0",required = false) int pageNum,@RequestParam(name="sortBy",defaultValue = "id",required = false) String sortBy){
        List<MenuProductDetail> productsDetails=menuServiceImpl.findAllMenus(pageSize, pageNum, sortBy).stream().map(menu -> {
            Restaurant fetchedRestaurant=restaurantClient.findRestaurantById(menu.getRestaurantId());
            return MenuProductDetail.builder()
                    .id(menu.getId())
                    .price(menu.getPrice())
                    .name(menu.getItemName())
                    .img(menu.getImageUrl())
                    .stars(menu.getStars())
                    .description(menu.getDescription())
                    .location(fetchedRestaurant.getAddress())
                    .created_at(menu.getCreatedAt())
                    .updated_at(menu.getUpdatedAt())
                    .type_id(2)
                    .build();

        }).collect(Collectors.toList());
        Page<Menu>menuPage=menuServiceImpl.menusPageDetails(pageSize,pageNum,sortBy);
        MenuProductResponse productResponse=MenuProductResponse.builder()
                .total_size(menuPage.getTotalPages())
                .type_id(2)
                .offset(menuPage.getNumberOfElements())
                .products(productsDetails)
                .build();
        return new ResponseEntity<>(productResponse,HttpStatus.OK);
    }

    @PutMapping
    public ResponseEntity<Menu> updateMenu(@RequestBody Menu menu){
        return new ResponseEntity<>(menuServiceImpl.updateMenu(menu),HttpStatus.OK);
    }

    @DeleteMapping("/{menuId}")
    public ResponseEntity<String> deleteMenu(@PathVariable("menuId") int menuId){
        menuServiceImpl.deleteMenu(menuId);
        return new ResponseEntity<>("Menu deleted successfully.",HttpStatus.OK);
    }
    
}
